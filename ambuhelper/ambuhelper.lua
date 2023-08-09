_addon.author = 'Mishrahh'
_addon.commands = {'ambuhelper','ambu'}
_addon.name = 'Ambuscade Helper'
_addon.version = '0.1'

require('luau')
config = require('config')
texts = require('texts')
packets = require('packets')
res = require('resources')

default = {
    active = true,
}


local function target_lock_on()
    local player = windower.ffxi.get_player()
    if player and not player.target_locked then
        windower.send_command('input /lockon')
    end
end

local function target_follow()
    local player = windower.ffxi.get_player()
    if player and player.target_index then
        windower.ffxi.follow(player.target_index)
    end
end

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command](...)
    else
        commands.help()
    end
end)
commands = {}

commands.switch_target = function(...)
    local args = {...}
    local name = args[1]
    local target = windower.ffxi.get_mob_by_name(name)

    if not target then
        return
    end

    addon_message('[Ambu] Switch Target: '.. name .. ':'.. target.id )

    local p = packets.new('outgoing', 0x01A, {
        ["Target"] = target.id,
        ["Target Index"] = target.index,
        ["Category"] = 0x0F -- Switch target
    })

    packets.inject(p)
    target_lock_on:schedule(1)
    target_follow:schedule(2)
    
end

commands.attack_target = function(...)
    local args = {...}
    local name = args[1]
    local target = windower.ffxi.get_mob_by_name(name)

    if not target then
        return
    end

    addon_message('[Ambu] Attack Target: '.. name .. ':'.. target.id )

    local p = packets.new('outgoing', 0x01A, {
        ["Target"] = target.id,
        ["Target Index"] = target.index,
        ["Category"] = 0x02 -- Engage Monster
    })

    packets.inject(p)
    target_lock_on:schedule(1)
    target_follow:schedule(2)
end

commands.silence = function(...)
    local args = {...}
    local name = args[1]
    local target = windower.ffxi.get_mob_by_name(name)

    if not target then
        return
    end

    addon_message('[Ambu] Silence: '.. name .. ':'.. target.id )
    windower.chat.input('//silence ' .. target.id )
end

commands.on = function()
    active = true
end
commands.off = function()
    active = false
end
commands.help = function()
    addon_message('Contains various commands to help multibox ambuscade.')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end