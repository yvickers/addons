require( 'Utilities' )
require( 'Automation' )
require( 'Subjob-Actions' )

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.WeaponLock = M(false, 'Weapon Lock')
    state.AttackWithMe = M(false, 'Attack With Me')
    state.MagicBurstMode      = M{['description'] = 'Magic Burst Mode', 'Off', 'Single', 'Lock'}
    state.SkillchainMode      = M{['description'] = 'Skillchain Mode', 'Off', 'Single', 'Lock'}
    state.ElementalMode       = M{['description'] = 'Elemental Mode', 'Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark'}

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish, bully, chi blas
    info.default_ja_ids = S{35, 204, 240, 18}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
    send_command('bind ^f1 gs c toggle TicksActive')
    send_command('bind ^f2 gs c toggle AutoBuffMode')
 	send_command('bind ^f3 gs c cycle AutoMagicBuffs')
    send_command('bind !f3 gs c cycleback AutoMagicBuffs')
    send_command('bind ^f4 gs c toggle AutoWSMode')

    send_command('bind ^f5 gs c cycle ElementalMode')
    send_command('bind !f5 gs c cycleback ElementalMode')

    send_command('bind ^numpad1 @input //send @all //raptor')
    send_command('bind !numpad1 @input //send @all /dismount')
    send_command('bind ^numpad7 @input /ma "Utsusemi: Ni" <me>')
    send_command('bind !numpad7 @input //ffo me')
    send_command('bind #numpad7 @input //ffo stopall')
    send_command('bind ^numpad9 gs c smartws')
    send_command('bind !numpad9 gs c aoesleep')
    send_command('bind #numpad9 gs c toggle AttackWithMe')

    send_command('bind ^g gs c cycle Weapons')
	send_command('bind !g gs c cycle MainWS')
    send_command('bind #g gs c toggle WeaponLock')

    if select_default_macro_book then
        select_default_macro_book()
    end

    windower.chat.input( '/cm party' );
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^f1')
    send_command('unbind ^f2')
    send_command('unbind ^f3')
    send_command('unbind !f3')
    send_command('unbind ^f4')
    send_command('unbind ^f5')
    send_command('unbind !f5')

    send_command('unbind ^numpad1')
    send_command('unbind !numpad1')
    send_command('unbind ^numpad7')
    send_command('unbind !numpad7')
    send_command('unbind #numpad7')
    send_command('unbind ^numpad9')
    send_command('unbind !numpad9')

    send_command('unbind ^g')
	send_command('unbind !g')
    send_command('unbind #g')

    if unload_job_keybinds then
        unload_job_keybinds()
    end
end

-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
    if 'JobAbility' == spell.type then
        tickdelay = os.clock() + jatickdelay
    end
    if 'WeaponSkill' == spell.type then
        windower.send_ipc_message( 'weaponskill ' .. spell.name:gsub("%W",'_') )
        tickdelay = os.clock() + wstickdelay
    end

    local magic_types = S{ 'WhiteMagic', 'BlackMagic', 'SummonerPact', 'Ninjutsu', 'BardSong', 'BlueMagic', 'Geomancy', 'Trust' }
    if magic_types:contains(spell.type) then
        tickdelay = os.clock() + spell.cast_time + 3
    end

    if spellMap == 'Utsusemi' then
        refine_utsusemi( spell, action, spellMap, eventArgs )
    end
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    refine_waltz(spell, action, spellMap, eventArgs)

    if _G['sub_job_precast_'..player.sub_job] then
        if _G['sub_job_precast_'..player.sub_job](spell, action, spellMap, eventArgs) then return true end
    end
end

function refine_utsusemi( spell, action, spellMap, eventArgs )
    --utsusemi spells from resource map
    local utsusemispells = {
        [339] = {id=339,en="Utsusemi: Ni",ja="空蝉の術:弐",cast_time=1.5,duration=600,element=2,icon_id=-1,icon_id_nq=26,levels={[13]=37},mp_cost=0,prefix="/ninjutsu",range=0,recast=45,recast_id=339,requirements=0,skill=39,targets=1,type="Ninjutsu"},
        [338] = {id=338,en="Utsusemi: Ichi",ja="空蝉の術:壱",cast_time=4,duration=600,element=2,icon_id=-1,icon_id_nq=26,levels={[13]=12},mp_cost=0,prefix="/ninjutsu",range=0,recast=30,recast_id=338,requirements=0,skill=39,targets=1,type="Ninjutsu"},
    }

    if player.main_job == 'NIN' then
        --ninja main job has access to third level
        utsusemispells = {
            [1] = {id=340,en="Utsusemi: San",ja="空蝉の術:参",cast_time=0.5,duration=900,element=2,icon_id=-1,icon_id_nq=26,levels={[13]=100},mp_cost=0,prefix="/ninjutsu",range=0,recast=60,recast_id=340,requirements=0,skill=39,targets=1,type="Ninjutsu"},
            [2] = {id=339,en="Utsusemi: Ni",ja="空蝉の術:弐",cast_time=1.5,duration=600,element=2,icon_id=-1,icon_id_nq=26,levels={[13]=37},mp_cost=0,prefix="/ninjutsu",range=0,recast=45,recast_id=339,requirements=0,skill=39,targets=1,type="Ninjutsu"},
            [3] = {id=338,en="Utsusemi: Ichi",ja="空蝉の術:壱",cast_time=4,duration=600,element=2,icon_id=-1,icon_id_nq=26,levels={[13]=12},mp_cost=0,prefix="/ninjutsu",range=0,recast=30,recast_id=338,requirements=0,skill=39,targets=1,type="Ninjutsu"},
        }
    end

    --cancel overwriting 3+ images
    if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
        cancel_spell()
        add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
        eventArgs.handled = true
        return
    end

    local newUtsu = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()

    --loop through utusemi spells, use lowest tier that can be cast
    --if no shadows up, use highest tier (assuming that is what was cast)
    for k,v in pairs(utsusemispells) do
        if spell_recasts[v.recast_id] <= 0 then
            newUtsu = v.en
            if buffactive['Copy Image'] == nil and buffactive['Copy Image (2)'] == nil then
                break;
            end
        end
    end

    if newUtsu ~= spell.english then
        send_command('@input /ja "'..newUtsu..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
end

--**
--* Handle global state changes
--* user_state_change( stateField, newValue, oldValue ) --must be in job_state_change
--**
function user_state_change( stateField, newValue, oldValue )

    if _G['user_state_change_'..stateField:gsub("%W",'_')] then
        _G['user_state_change_'..stateField:gsub("%W",'_')]( newValue, oldValue )
    end

end

function user_state_change_Weapon_Setup( newValue, oldValue )
	equip(gear.weapons[state.Weapons.current])
end

function user_state_change_Weapon_Lock( newValue, oldValue )
    if state.WeaponLock.current == 'on' then
        disable('main')
        disable('sub')
        disable('ranged')
    else
        enable('main')
        enable('sub')
        enable('ranged')
    end
end

function user_state_change_Attack_With_Me( newValue, oldValue )
    if state.AttackWithMe.current == 'on' then
        send_command('@input //atkwm master')
        send_command('@input //send @others //atkwm slave on')
    else
        send_command('@input //send @others //atkwm slave off')
        send_command('@input //send @all //lua reload attackwithme')
    end
end

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end

function special_ammo_check()
    local no_shoot_ammo = S{"Animikii Bullet", "Hauksbok Bullet", "Hauksbok Arrow", "Hauksbok Bolt"}
    -- Stop if Animikii/Hauksbok equipped
    if no_shoot_ammo:contains(player.equipment.ammo) then
        cancel_spell()
        add_to_chat(123, '** Action Canceled: [ '.. player.equipment.ammo .. ' equipped!! ] **')
        return true
    end
    return false
end

function elemental_belt_check(spell)
end

function user_state_change_TicksActive( newValue, oldValue )
	if state.TicksActive.current == 'on' then
		register_ticks()
	else
		windower.unregister_event(tickEventListener)
	end
end

function user_buff_change( buff, gain, eventArgs )
    if sets.AutoBuff[buff] then
        local slots = T{}
        for slot,item in pairs(sets.AutoBuff[buff]) do
            slots:append(slot)
        end

        if 'sleep' == buff then
            send_command('cancel stoneskin')
        end

        if gain then
            equip(sets.AutoBuff[buff])
            disable(slots)
        else
            enable(slots)
            send_command('gs c update auto')
        end
        
    end
end

--[[
To be used as part of job_buff_change
user_announce_ailments(buff,gain)
]]--
function user_announce_ailments(buff,gain)
    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed, please Cursna.')
            disable('neck','legs','left_ring','right_ring','waist')
        else
            enable('neck','legs','left_ring','right_ring','waist')
            send_command('input /p Doom removed, Thank you.')
            handle_equipping_gear(player.status)
        end
    end
    
    if buff == "Sleep" then
        if gain then
            send_command('@input /p Slept, please wake.')
        else
            send_command('input /p '..player.name..' is no longer asleep.')
        end
    end
    
    if buff == "petrification" then
        if gain then    
            send_command('@input /p Petrification, please Stona.')      
        else
            send_command('input /p '..player.name..' is no longer Petrify Thank you !')
        end
    end
                 
    if buff == "Charm" then
        if gain then            
            send_command('@input /p Charmed, please Sleep me.')     
        else    
            send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
        end
    end
end

--Cure rules--
local cure_targets = {
    I   =   150,
    II  =   300,
    III =   500,
    IV  =   700
}
local cure_costs = {
    I   = 8,
    II  = 24,
    III = 46,
    IV  = 88
}
function refine_cure(spell, spellMap, eventArgs)
    if spell.name:startswith('Cure') then
    
        local newCure = spell.english
        
        local missingHP
        local currentHeal = 0
        
        -- If curing ourself, get our exact missing HP
        if spell.target.type == "SELF" then
            missingHP = player.max_hp - player.hp
        -- If curing someone in our alliance, we can estimate their missing HP
        elseif spell.target.isallymember then
            local target = find_player_in_alliance(spell.target.name)
            local est_max_hp = target.hp / (target.hpp/100)
            missingHP = math.floor(est_max_hp - target.hp)
        end

        for level, health in pairs(cure_targets) do
            if missingHP > health and currentHeal < health and player.mp >= cure_costs[level] then
                currentHeal = health
                if level == 'I' then
                    newCure = 'Cure'
                else
                    newCure = 'Cure '..level
                end
            end
        end

        if newCure ~= spell.english then
            send_command('@input /ma "'..newCure..'" '..tostring(spell.target.raw))
            eventArgs.cancel = true
        else
            if missingHP and missingHP > 0 then
                add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..newCure..'.')
            end
        end
    end
end

--**
--* Global Self Commands
--* user_self_command( cmdParams, eventArgs ) --must be in job_self_command to make use of these
--**

function user_self_command(cmdParams, eventArgs)

	if 'smartws' == cmdParams[1] then
		smart_ws()
	end
    if 'aoesleep' == cmdParams[1] then
        send_command('@send @brd //hordelullaby <tid>')
    end
    if 'checksoul' == cmdParams[1] then
        send_command('input /heal')
        windower.send_command:schedule(2,'input /heal')
    end
    if 'followme' == cmdParams[1] then
        --send_command('@send @others /follow '..player.name )
        windower.send_command('input //ffo me')
    end
    if 'followstop' == cmdParams[1] then
        --windower.ffxi.follow()
        windower.send_command('input //ffo stopall')
    end

end

function smart_ws()
	windower.chat.input('/ws "'..state.MainWS.current..'" <t>')
end
