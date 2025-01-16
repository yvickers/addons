-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:

--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    
    include('Mote-TreasureHunter')

    state.MainWS = M{['description'] = 'Main Weaponskill', 'Aeolian Edge' }
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', }
    gear.weapons = {}
    gear.weapons['Default'] = {}
    state.Ammo = M{['description'] = 'Main Ammo', 'Bronze Bullet', }

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

    state.OffenseMode:options( 'PDT', 'Normal', 'Acc', 'Evasion', 'MDT')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    elemental_ws = S{"Aeolian Edge", "Leaden Salute", "Wildfire", "Trueflight", "Hot Shot", "Flaming Arrow" }

    gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = ""

    gear.capes = {}
    --gear.capes.TP = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    --gear.capes.Crit = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    --gear.capes.WSDMG = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps
~   Shift
--]]
    --send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind %numpad0 input /ra <t>')

    send_command('wait 10; input /lockstyle on')

    if user_job_setup then
        user_job_setup()
    end

    flurry = nil
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
    send_command('unbind numpad0')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {}

    sets.Kiting = {
        --feet=gear.Artifact.Feet
    }

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    --sets.precast.JA['Collaborator'] =  {head="Raider's Bonnet +2" }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = { }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {}
    sets.precast.RA.Flurry1 = {}
    sets.precast.RA.Flurry2 = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {

    } )
    sets.FullTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
    sets.midcast.Utsusemi = {}

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}
    sets.midcast.RA.DoubleShot = {}
    sets.TrueShot = {}
    sets.midcast.RA.Critical = {}
    sets.midcast.RA.CriticalDoubleShot = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        --head="Malignance Chapeau",
        --body="Malignance Tabard",
        --hands="Malignance Gloves",
        --legs="Carmine Cuisses +1",
        --feet="Malignance Boots",
        --neck="Warder's Charm +1",
        --waist="Flume Belt +1",
        --back=gear.capes.TP,
        --left_ear="Odnowa Earring +1",
        --right_ear="Genmei Earring",
        --left_ring="Defending Ring",
        --right_ring="Warp Ring",
    }

    sets.idle.Town = set_combine(sets.idle,{})

    sets.idle.Weak = set_combine(sets.idle,{})


    -- Defense sets

    sets.defense.Evasion = {}

    sets.defense.PDT = {}

    sets.defense.MDT = {}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {}
    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.Evasion = set_combine(sets.engaged, {})

    sets.engaged.PDT = set_combine(sets.engaged, {})

    sets.engaged.MDT = set_combine(sets.engaged, {})

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' or spell.english == "Bounty Shot" or spell.english == "Shadowbind" then
        equip({ammo=state.Ammo.current})
    end
    if spell.type == 'WeaponSkill'  then
        if spell.skill == 'Marksmanship' or spell.skill == 'Archery' then
            equip({ammo=state.Ammo.current})
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

    if spell.type == 'WeaponSkill'  then
        if spell.skill == 'Marksmanship' or spell.skill == 'Archery' then
            if special_ammo_check() then
                equip({ammo=state.Ammo.current})
            end
        end
    end

    if spell.english == "Bounty Shot" or spell.english == "Shadowbind" then
        if special_ammo_check() then
            equip({ammo=state.Ammo.current})
        end
    end

    -- Don't shoot the good bullet....again
    if spell.action_type == 'Ranged Attack' then
        if special_ammo_check() then
            equip({ammo=state.Ammo.current})
        end
    end

    if spell.type == 'WeaponSkill'  then
        if player.tp > 2900 then
            equip(sets.FullTP)
        end
        if elemental_ws:contains(spell.name) then
            elemental_belt_check(spell)
        end
    end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if flurry == 2 then
            equip(sets.precast.RA.Flurry2)
        elseif flurry == 1 then
            equip(sets.precast.RA.Flurry1)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if buffactive['Double Shot'] then
            equip(sets.midcast.RA.DoubleShot)
        end

        if buffactive['Aftermath: Lv.3'] and player.equipment.ranged == "Armageddon" then
            equip(sets.midcast.RA.Critical)
            if (spell.target.distance < (7 + spell.target.model_size)) and (spell.target.distance > (5 + spell.target.model_size)) then
                equip(sets.TrueShot)
            end
            if buffactive['Double Shot'] then
                equip(sets.midcast.RA.CriticalDoubleShot)
            end
        end

        if buffactive['Aftermath: Lv.3'] and player.equipment.ranged == "Gandiva" then
            equip(sets.midcast.RA.Critical)
            if (spell.target.distance < (12 + spell.target.model_size)) and (spell.target.distance > (10 + spell.target.model_size)) then
                equip(sets.TrueShot)
            end
            if buffactive['Double Shot'] then
                equip(sets.midcast.RA.CriticalDoubleShot)
            end
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if 
        spell.action_type == 'Ranged Attack' or
        spell.english == "Bounty Shot" or
        spell.english == "Shadowbind" or
        ( spell.type == 'WeaponSkill' and ( spell.skill == 'Marksmanship' or spell.skill == 'Archery' ) )
    then
        if state.Weapons.current and gear.weapons[state.Weapons.current] and gear.weapons[state.Weapons.current].ammo then
            equip({
                ammo=gear.weapons[state.Weapons.current].ammo,
            })
        end
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if S{'flurry'}:contains(buff:lower()) then
        if not gain then
            flurry = nil
            --add_to_chat(122, "Flurry status cleared.")
        end
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if user_state_change then
        user_state_change( stateField, newValue, oldValue )
    end

    if new_status == 'Engaged' then
        --determine_haste_group()
    end
    
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

     if player.mpp < 50 then
        idleSet = set_combine(idleSet, sets.ExtraRefresh)
    end

    return idleSet
end

function customize_melee_set(meleeSet)
    if state.Weapons.current and gear.weapons[state.Weapons.current] and gear.weapons[state.Weapons.current].ammo then
        meleeSet = set_combine(meleeSet,{
            ammo=gear.weapons[state.Weapons.current].ammo,
        })
    end
    return meleeSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
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

function job_tick()
    if automatic_job_buffs() then return true end
    return false
end

function automatic_job_buffs()
    if state.AutoBuffMode.current == 'on' and player.in_combat then
        --local abil_recasts = windower.ffxi.get_ability_recasts()
    end

    return false
end

--Read incoming packet to differentiate between Haste/Flurry I and II
windower.register_event('action',
    function(act)
        --check if you are a target of spell
        local actionTargets = act.targets
        playerId = windower.ffxi.get_player().id
        isTarget = false
        for _, target in ipairs(actionTargets) do
            if playerId == target.id then
                isTarget = true
            end
        end
        if isTarget == true then
            if act.category == 4 then
                local param = act.param
                if param == 845 and flurry ~= 2 then
                    --add_to_chat(122, 'Flurry Status: Flurry I')
                    flurry = 1
                elseif param == 846 then
                    --add_to_chat(122, 'Flurry Status: Flurry II')
                    flurry = 2
              end
            end
        end
    end)