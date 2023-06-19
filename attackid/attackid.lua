_addon.version = '0.0.1'
_addon.name = 'attackid'
_addon.author = 'yyoshisaur'
_addon.commands = {'attackid','atkid'}

require('logger')
require('chat')
packets = require('packets')

local player_status = {
    ['Idle'] = 0,
    ['Engaged'] = 1,
}

local max_retry = 5

local function attack_on(id)
    local target = windower.ffxi.get_mob_by_id(id)

    if not target then
        -- error
        return
    end

    local p = packets.new('outgoing', 0x01A, {
        ["Target"] = target.id,
        ["Target Index"] = target.index,
        ["Category"] = 0x02 -- Engage Monster
    })

    packets.inject(p)

    log('Attacking ---> '..target.name)
end

local function target_lock_on()
    local player = windower.ffxi.get_player()
    if player and not player.target_locked then
        windower.send_command('input /lockon')
    end

    get_in_range()
end

function get_in_range()
    in_range = windower.register_event('prerender', function()
        local player = windower.ffxi.get_player()
        local target = windower.ffxi.get_mob_by_target('t') 
        if not player.in_combat or not target then
            clear_in_range()
            return
        end
        if target.distance > (3.2 + target.model_size ) and target.distance < 100 then
            windower.ffxi.follow(player.target_index)
        else
            windower.ffxi.run(false)
        end
    end)
end

function clear_in_range()
    windower.unregister_event(in_range)
end

windower.register_event('addon command', function(...)
    local args = {...}

    if args[1] then

        local id = tonumber(args[1])

        if not id then
            -- error
            return
        end

        local target = windower.ffxi.get_mob_by_id(id)

        if not target then
            -- error
            return
        end

        attack_on(id)
        target_lock_on:schedule(1)

    else
        -- error
    end
end)