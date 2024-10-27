--[[
* Test targeting while assisting
* String replacements for better messaging
* Listen for monster buffs rather than self-targets (-na spells)
* On screen UI
]]--

_addon.author = 'Mishrahh'
_addon.commands = {'autodispel','ad'}
_addon.name = 'AutoDispel'
_addon.version = '0.1'

require('luau')
config = require('config')
texts = require('texts')
packets = require('packets')
res = require('resources')

default = {
    active = true,
    retry = 5,
    text = {text={size=10}},
    assist = '',
}

settings = config.load(default)
active = settings.active
needs_dispel = false
player = windower.ffxi.get_player()
casting = false

function determine_dispel_spell()
    local player = windower.ffxi.get_player()
    if player.main_job == 'BRD' then
        return 462 -- magic finale
    end

    if player.main_job == 'RDM' or player.sub_job == 'RDM' then
        return 260 -- dispel
    end
end
dispel = determine_dispel_spell()

-- messages where buff is removed, but maybe more?
dispel_green = L{
    64,
    74,
    83,
    123,
    159,
    168,
    204,
    206,
    321,
    322,
    341,
    342,
    343,
    344,
    350,
    378,
    453,
    531,
    647,

}
-- messages that should result in a retry
dispel_yellow = L{

}
-- these should be messages when no buffs present
dispel_red = L{
    75,
    156,
    283,
    323,
    423,
    659,
}
     
mob_actions = {
    [4] = function(actor,param)
        if res.spells[param] then
            needs_dispel = actor.id
            addon_message('Completed Casting '..actor.name..'->'..res.spells[param].en)
        end
    end,
    [11] = function(actor, param)
        if res.monster_abilities[param] then 
            needs_dispel = actor.id
            addon_message('Completed Ready Move: '..actor.name..'->'..res.monster_abilities[param].en)
        end
    end,
}
--https://github.com/Windower/Lua/wiki/Action-Event
user_actions = {
    [2] = function(param,targets) finishCasting() end,
    [3] = function(param,targets) finishCasting() end,
    [4] = function(param,targets)
        finishCasting()
        if dispel == param then
            for i in pairs(targets) do
                if targets[i].id == needs_dispel then
                    for j in pairs(targets[i].actions) do
                        if dispel_red:contains(targets[i].actions[j].message) then
                            needs_dispel = false
                            addon_message('Dispel complete.')
                        elseif dispel_green:contains(targets[i].actions[j].message) then
                            addon_message('Dispel successful, continuing.')
                        else
                            addon_message('Unknown - '..res.action_messages[targets[i].actions[j].message].en)
                        end
                    end
                end
            end
        end
    end,    
    [5] = function(param,targets) finishCasting() end,
    [7] = function(param,targets) beginOrInterrupt(param) end,
    [8] = function(param,targets) beginOrInterrupt(param) end,
    [9] = function(param,targets) beginOrInterrupt(param) end,
    [11] = function(param,targets) finishCasting() end,
    [12] = function(param,targets) beginOrInterrupt(param) end,
}

function beginOrInterrupt(param)
    if param == 24931 then
        casting = true
        addon_message('Self casting on')
    elseif param == 28787 then
        casting = false
        addon_message('Self casting off')
    end
end

function finishCasting()
    casting = false
    addon_message('Self casting off')
end

windower.register_event('action',function (act)
    local player = windower.ffxi.get_player()

    if not player.in_combat then
        return nil
    end

    local actor = windower.ffxi.get_mob_by_id(act.actor_id)
    local param = act.param
    local category = act.category
    local targets = act.targets
    local focusTarget = getTargetID()

    if actor.id == player.id then
        if user_actions[category] then
            user_actions[category](param,targets)
        end
        return nil
    end 

	local primarytarget = windower.ffxi.get_mob_by_id(targets[1].id)

    -- if npc acts on itself, assume buff
    if actor and focusTarget and actor.is_npc and actor.id == focusTarget and actor.id == primarytarget.id then
        if mob_actions[category] then
            mob_actions[category](actor,param)
        end
    end
    
end)
--[[
    Just who should we dispel?
]]--
function getTargetID()
    local player = windower.ffxi.get_player()
    local index = nil

    -- are we assisting someone else or using self target
    if '' ~= settings.assist then
        local assistTarget = windower.ffxi.get_mob_by_name(settings.assist)
        if assistTarget and assistTarget.target_index then
            index = assistTarget.target_index
        end
    else
        index = player.target_index
    end

    --make sure monster exists and is valid
    if index then
        local monster = windower.ffxi.get_mob_by_index(index)
        if monster and monster.is_npc and monster.valid_target then
            return monster.id
        end
    end

    return nil
end

windower.register_event('prerender', function()
    if needs_dispel and not casting and not moving then
        local recasts = windower.ffxi.get_spell_recasts()
        local target = windower.ffxi.get_mob_by_id(needs_dispel)
        local player = windower.ffxi.get_player()
        if not target then
            needs_dispel = false
            return
        end

        packets.inject(packets.new('incoming', 0x058, {
            ['Player'] = player.id,
            ['Target'] = target.id,
            ['Player Index'] = player.index,
        }))

        if dispel and recasts[dispel] <= 0 then
            windower.chat.input('/ma "'..res.spells[dispel].en..'" <t>')
            return
        end
    end
end)

-- Begin Moving Check
last_coords = 'fff':pack(0,0,0)
moving = false

windower.register_event('outgoing chunk',function(id,data,modified,is_injected,is_blocked)
    if id == 0x015 then
        moving = last_coords ~= modified:sub(5, 16)
        last_coords = modified:sub(5, 16)
    end
end)
-- End Moving Check

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

commands.assist = function(...)
    local args = {...}
    if args[1] and args[1] ~= 'off' then
        settings.assist = args[1]
        addon_message('Assist set to %s':format(args[1]))
    else
        settings.assist = ''
        addon_message('Assist turned off')
    end
end

commands.save = function()
    settings:save('all')
    addon_message('Saving settings')
end

commands.start = function(...)
    local args = {...}
    local target = tonumber(args[1])
    addon_message('Dispel >> %s':format(target))
    needs_dispel = target
end
commands.stop = function()
    needs_dispel = false
    casting = false
end

commands.on = function()
    if dispel then
        active = true
    end
end
commands.off = function()
    active = false
    needs_dispel = false
    casting = false
end
commands.help = function()
    addon_message('Attempts to dispel until no buffs on target.')
    addon_message('Usage: //am save --saves current settings')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end

-- Basic clearing from transitions
windower.register_event('zone change', commands.off)
windower.register_event('job change', function()
    commands.off()
    dispel = determine_dispel_spell()
end)
windower.register_event('logout', commands.off)
function status_change(new,old)
    if new > 1 and new < 4 then
        commands.off()
    end
end
windower.register_event('status change', status_change)
-- End transition clearing