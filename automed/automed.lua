_addon.author = 'Mishrahh'
_addon.commands = {'automed','am'}
_addon.name = 'AutoMed'
_addon.version = '0.1'

require('luau')
config = require('config')
texts = require('texts')
packets = require('packets')
res = require('resources')

default = {
    active = true,
    max_retry = 5,
    buffs = {
        silence='Remedy',
        doom='Holy Water',
    },
    text = {text={size=10}},
}

settings = config.load(default)
active = settings.active
current_buffs = {}

--attempt to use item to remove debuff
windower.register_event('gain buff', function(id)
    if not active then
        return
    end
    local name = res.buffs[id].english
    for key,val in pairs(settings.buffs) do
        if key:lower() == name:lower() then
            local retry_count = 0
            current_buffs[key:lower()] = 1
            repeat
                windower.send_command('input /item "'.. val ..'" '..windower.ffxi.get_player()["name"])
                coroutine.sleep(3)
                retry_count = retry_count + 1
            until not current_buffs[key:lower()] or retry_count > settings.max_retry
        end
    end
end)
--debuff lost
windower.register_event('lose buff', function(id)
    if not active then
        return
    end
    local name = res.buffs[id].english
    for key,val in pairs(settings.buffs) do
        if key:lower() == name:lower() then
           current_buffs[key:lower()] = nil
        end
    end
end)

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command](...)
    else
        commands.help()
    end
end)
commands = {}

commands.retry = function(...)
    local args = {...}
    local retry = args[1]
    if retry and tonumber(retry) then
        settings.max_retry = tonumber(retry)
        addon_message('Max Retry set to %s':format(args[1]))
    end
end

commands.add = function(...)
    local args = {...}
    local buff = args[1]
    local med = args[2]
    if buff and med then
        settings.buffs[buff] = med
        addon_message('Adding %s::%s to automed':format(buff,med))
    end
end
commands.remove = function(...)
    local args = {...}
    local buff = args[1]
    if settings.buffs[buff] then
        settings.buffs[buff] = nil
        addon_message('Removing %s from automed':format(buff))
    end
end

commands.restore = function()
    for key,val in pairs(default) do
        settings[key] = val
    end
    settings:save('all')
end
commands.save = function()
    settings:save('all')
    addon_message('Saving settings')
end

commands.on = function()
    active = true
end
commands.off = function()
    active = false
end
commands.help = function()
    addon_message('Uses specified item when a status is gained.')
    addon_message('Usage: //am add <buff> <item> --sets item to use when buff is gained')
    addon_message('Usage: //am remove <buff> --removes buff from watch list')
    addon_message('Usage: //am retry <num> --max number of attempts')
    addon_message('Usage: //am restore --restores defaults')
    addon_message('Usage: //am save --saves current settings')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end