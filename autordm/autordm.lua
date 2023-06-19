--Handle self buffing

_addon.author = 'Mishrahh'
_addon.commands = {'AutoRDM','rdm'}
_addon.name = 'AutoRDM'
_addon.version = '0.1'

require('luau')
texts = require('texts')
packets = require('packets')

default = {
    delay = 4.2,
    start_on_load = false,
    active = true,
    min_ws_hp = 20,
    max_ws_hp = 99,
    composure = true,
    buffs = {haste=L{},refresh=L{},phalanx=L{}},
    --buff_spells = {haste='Haste II', refresh='Refresh III', phalanx='Phalanx II'}
    self = L{'Refresh III'},
    recast = {buff={min=5,max=10}},
    text = {text={size=10}},
}

settings = config.load(default)
actions = settings.start_on_load
last_coords = 'fff':pack(0,0,0)
is_moving = false
nexttime = os.clock()
del = 0
timers = {haste={},refresh={},phalanx={},self={}}
spells = {}
spells_by_name = {}

display_box = function()
    local str
    if actions then
        str = ' AutoRDM [On] '
    else
        str = ' AutoRDM [Off] '
    end
    if settings.active then
        if settings.composure then
            str = str..'\n Composure: On'
        else 
            str = str..'\n Compsoure: Off'
        end
        for k,v in ipairs(settings.buffs.haste) do
           str = str..'\n Haste:[%s]':format(v:ucfirst())
        end
        for k,v in ipairs(settings.buffs.refresh) do
            str = str..'\n Refresh:[%s]':format(v:ucfirst())
        end
        for k,v in ipairs(settings.buffs.phalanx) do
            str = str..'\n Phalanx:[%s]':format(v:ucfirst())
        end
        if settings.self:length() > 0 then
            for k,v in ipairs(settings.self) do
                str = str..'\n Self:[%s]':format(v:ucfirst())
            end
        end
        for k,v in pairs(settings.recast) do
            str = str..'\n Recast %s:[%d-%d]':format(k:ucfirst(),v.min,v.max)
        end
        str = str..'\n Delay:[%d] ':format(settings.delay)
    end
    return str
end

rdm_status = texts.new(display_box(),settings.text,settings)

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command](...)
    else
        commands.help()
    end
    rdm_status:text(display_box())
end)
commands = {}

commands.on = function()
    if not user_events then
        check_job()
    end
    actions = true
end
commands.off = function()
    actions = false
end
commands.recast = function(...)
    local args = {...}
    if settings.recast[args[1]] then
        if args[2] and tonumber(args[2]) then
            settings.recast[args[1]]['min'] = tonumber(args[2])
        end
        if args[3] and tonumber(args[3]) then
            settings.recast[args[1]]['max'] = tonumber(args[3])
        end
        addon_message('%s recast set to min: %s max: %s':format(args[1],settings.recast[args[1]]['min'],settings.recast[args[1]]['max']))
    end
end
commands.haste = function(...)
    commands.buff('haste',...)
end
commands.refresh = function(...)
    commands.buff('refresh',...)
end
commands.phalanx = function(...)
    commands.buff('phalanx',...)
end
commands.buff = function(buff,...)
    local args = {...}
    if(settings.buffs[buff]) then
        local ind = settings.buffs[buff]:find(args[1])
        if not args[2] then
            if ind then
               settings.buffs[buff]:remove(ind)
            else
                settings.buffs[buff]:append(args[1])
            end
        elseif args[2] == 'on' then
            settings.buffs[buff]:append(args[1])
        elseif args[2] == 'off' then
           settings.buffs[buff]:remove(ind)
        end
    end
end
commands.self = function(...)
    local args = {...}
    local ind = settings.self:find(args[1])
    if not args[2] then
        if ind then
            settings.self:remove(ind)
         else
            settings.self:append(args[1])
         end
    elseif args[2] == 'on' then
        settings.self:append(args[1])
    elseif args[2] == 'off' then
       settings.self:remove(ind)
    end
end
commands.save = function()
    settings.save(settings)
end
commands.help = function()
    addon_message('There is no help yet.')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end
function use_JA(str,ta)
    windower.send_command('input /ja "%s" %s':format(str,ta))
    del = 1.2
end
function use_MA(str,ta)
    windower.send_command('input /ma "%s" %s':format(str,ta))
    del = settings.delay
end
function calculate_buffs(curbuffs)
    local buffs = {}
    for i,v in pairs(curbuffs) do
        if res.buffs[v] and res.buffs[v].english then
            buffs[res.buffs[v].english:lower()] = (buffs[res.buffs[v].english:lower()] or 0) + 1
        end
    end
    return buffs
end
function get_spell_by_name(name)
    if spells_by_name[name] then
        return spells_by_name[name]
    end
    for k,v in pairs(res.spells) do
        if v.en:lower() == name then
            spells[k] = v
            spells_by_name[name] = v
            return v
        end
    end
    return false
end

function unload_chunk_event()
    windower.unregister_event(incoming_chunk)
    windower.unregister_event(outgoing_chunk)
end
function load_chunk_event()
    incoming_chunk = windower.register_event('incoming chunk', check_incoming_chunk)
    outgoing_chunk = windower.register_event('outgoing chunk', check_outgoing_chunk)
end
function check_incoming_chunk(id,original,modified,injected,blocked)
    if id == 0x028 then
        local packet = packets.parse('incoming', original)
        if packet.Actor ~= windower.ffxi.get_mob_by_target('me').id then return false end
        if packet.Category == 4 then
            -- Finish Casting
            is_casting = false
            del = settings.delay
            if timed_spells[packet.Param] then
                local spell = spell_ids[packet.Param]
                local target = windower.ffxi.get_mob_by_id(packet['Target 1 ID'])
                timers[spell.enl:lower()][target.name:lower()] = os.time()+spell.dur
            end
        elseif L{3,5,11}:contains(packet.Category) then -- 2 Ranged Attacks
            -- Finish Casting/WS/Item Use
            is_casting = false
        elseif L{7,8,9}:contains(packet.Category) then -- 12 Ranged Attacks
            if (packet.Param == 24931) then
                --  Begin Casting/WS/Item Use
                is_casting = true
            elseif (packet.Param == 28787) then
                -- Failed Casting/WS/Item Interrupted
                is_casting = false
                del = 2.5
            end
        end
    end
end
function check_outgoing_chunk(id,data,modified,is_injected,is_blocked)
    if id == 0x015 then
        is_moving = last_coords ~= modified:sub(5, 16)
        last_coords = modified:sub(5, 16)
    end
end

function prerender()
    if not actions then return end
    local curtime = os.clock()
    if nexttime + del <= curtime then
        nexttime = curtime
        del = 0.1
        local play = windower.ffxi.get_player()
        if not play or play.main_job ~= 'RDM' or play.status > 1 then return end

        local buffs = calculate_buffs(play.buffs)
        if is_moving or is_casting or buffs.stun or buffs.sleep or buffs.charm or buffs.terror or buffs.petrification then return end

        local JA_WS_lock,MA_lock
        if buffs.silence or buffs.mute or buffs.omerta then return end
        if buffs.amnesia or buffs.impairment then JA_WS_lock = true end

        local spell_recasts = windower.ffxi.get_spell_recasts()
        local abil_recasts = windower.ffxi.get_ability_recasts()

        --composure before any buff checks
        if settings.composure and not JA_WS_lock and not buffs.composure and abil_recasts[50] and abil_recasts[50] == 0 then
            use_JA('Composure','<me>')
            return
        end

        if settings.self:length() > 0 then
            for k,v in ipairs(settings.self) do
                local spell = get_spell_by_name(v:lower())
                if spell then
                    addon_message(v)
                    del = 10
                end
            end
        end
    end
end

function reset()
    actions = false
    is_casting = false
    timers = {haste={},refresh={},phalanx={}}
    rdm_status:text(display_box())
end

function status_change(new,old)
    is_casting = false
    if new == 2 or new == 3 then
        reset()
    end
end

function unloaded()
    if user_events then
        reset()
        for _,event in pairs(user_events) do
            windower.unregister_event(event)
        end
        rdm_status:hide()
        user_events = nil
        coroutine.schedule(unload_chunk_event,0.1)
    end
end

function loaded()
    if not user_events then
        user_events = {}
        user_events.prerender = windower.register_event('prerender', prerender)
        user_events.zone_change = windower.register_event('zone change', reset)
        user_events.status_change = windower.register_event('status change', status_change)
        rdm_status:text(display_box())
        rdm_status:show()
        coroutine.schedule(load_chunk_event,0.1)
    end
end

function check_job()
    local play = windower.ffxi.get_player()
    if play and play.main_job == 'RDM' then
        loaded()
    else
        unloaded()
    end
end

windower.register_event('job change','login','load', check_job)
windower.register_event('logout', unloaded)