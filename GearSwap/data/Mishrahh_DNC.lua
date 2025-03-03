-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    gs c step
        Uses the currently configured step on the target, with either <t> or <stnpc> depending on setting.

    gs c step t
        Uses the currently configured step on the target, but forces use of <t>.
    
    
    Configuration commands:
    
    gs c cycle mainstep
        Cycles through the available steps to use as the primary step when using one of the above commands.
        
    gs c cycle altstep
        Cycles through the available steps to use for alternating with the configured main step.
        
    gs c toggle usealtstep
        Toggles whether or not to use an alternate step.
        
    gs c toggle selectsteptarget
        Toggles whether or not to use <stnpc> (as opposed to <t>) when using a step.
--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    include('Mote-TreasureHunter')

    state.MainWS = M{['description'] = 'Main Weaponskill', 'Evisceration', "Rudra's Storm", 'Aeolian Edge' }
    state.AutoBuffMode = M( true, "Automatic Buffs" )

    state.Buff['Climactic Flourish'] = buffactive['Climactic Flourish'] or false
    state.Buff['Building Flourish'] = buffactive['Building Flourish'] or false
    state.Buff['Presto'] = buffactive['Presto'] or false
    state.Buff['Contradance'] = buffactive['Contradance'] or false
    state.Buff['Saber Dance'] = buffactive['Saber Dance'] or false
    state.Buff['Fan Dance'] = buffactive['Fan Dance'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false

    state.AutoPrestoMode = M(true, 'Auto Presto Mode')
    state.DanceStance = M{['description']='Dance Stance','None','Saber Dance','Fan Dance'}

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

    state.OffenseMode:options('PDT', 'Normal', 'Acc')
    state.HybridMode:options('PDT', 'Normal', 'Evasion')
    state.WeaponskillMode:options('Normal', 'Buffed' )
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false

    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
    state.Samba = M{['description']='Main Samba', 'Haste Samba', 'Drain Samba III', 'Aspir Samba II'}

    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
    state.SkillchainPending = M(false, 'Skillchain Pending')

    gear.Artifact = {}
    gear.Artifact.Head = "Maxixi Tiara +3"
    gear.Artifact.Body = "Maxixi Casaque +3"
    gear.Artifact.Hands = "Maxixi Bangles +2"
    gear.Artifact.Legs = "Maxixi Tights +1"
    gear.Artifact.Feet = "Maxixix Toe Shoes +3"

    gear.Relic = {}
    gear.Relic.Head = "Horos Tiara +3"
    gear.Relic.Body = "Horos Casaque +3"
    gear.Relic.Hands = "Horos Bangles +1"
    gear.Relic.Legs = "Horos Tights +3"
    gear.Relic.Feet = "Horos T. Shoes +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Maculele Tiara +3"
    gear.Empyrean.Body = "Macu. Casaque +3"
    gear.Empyrean.Hands = "Macu. Bangles +3"
    gear.Empyrean.Legs = "Maculele Tights +3"
    gear.Empyrean.Feet = "Macu. Toe Sh. +3"

    gear.capes = {}
    gear.capes.TP = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.capes.Crit = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
    gear.capes.WSDMG = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    gear.capes.STRWS = { name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+9','Weapon skill damage +10%',}}

    function calculate_step_feet_reduction()
        local tp_reduction = 0
        
        if sets.precast.Step and sets.precast.Step.feet and standardize_set(sets.precast.Step).feet:startswith('Horos T. Shoes') then
            if sets.precast.Step.feet:endswith('+2') then
                tp_reduction = 10
            elseif sets.precast.Step.feet:endswith('+3') then
                tp_reduction = 20
            end
        end
        
        return tp_reduction 
    end

    step_feet_reduction = calculate_step_feet_reduction()

    --determine_haste_group()
    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
    send_command('bind @1 gs c cycle mainstep')
    send_command('bind @2 gs c cycle altstep')
    send_command('bind @3 gs c cycle Samba')

    select_default_macro_book()

    send_command('wait 10; input /lockstyle on')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
    send_command('unbind @1')
    send_command('unbind @2')
    send_command('unbind @3')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.TreasureHunter = gear.TH.Herc
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {
        body=gear.Relic.Body
    }

    sets.precast.JA['Trance'] = {
        head=gear.Relic.Head
    }
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
--        ammo="Sonia's Plectrum",
--        head="Horos Tiara",
--        ear1="Roundel Earring",
--        body="Maxixi Casaque",
--        hands="Buremte Gloves",
--        ring1="Asklepian Ring",
        back="Toetapper Mantle",
        waist="Prosilio Belt +1",
--        legs="Nahtirah Trousers",
        feet=gear.Empyrean.Feet
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
--    sets.precast.Samba = {head="Maxixi Tiara"}
    sets.precast.Jig = {
        legs=gear.Relic.Legs,
        feet=gear.Empyrean.Feet
    }

    sets.precast.Step = {
        --waist="Chaac Belt",
        feet=gear.Relic.Feet,
    }

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {
    } -- magic accuracy

    sets.precast.Flourish1['Desperate Flourish'] = {
    } -- acc gear

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {
        hands=gear.Empyrean.Hands
    }

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {
        body=gear.Empyrean.Body,
    }
    sets.precast.Flourish3['Climactic Flourish'] = {
        head=gear.Empyrean.Head,
    }

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        ammo="Impatiens",
        head=gear.Herc.Head.FC,
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
        neck="Baetyl Pendant",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Weather. Ring +1",
        right_ring="Medada's Ring",
    }

--    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head=gear.Empyrean.Head,
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Etoile Gorget +2",
        waist="Kentarch Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Store TP"+6','DEX+9 AGI+9',}},
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
        back=gear.capes.WSDMG,
    }
    sets.precast.WS.Buffed = set_combine(sets.precast.WS, {
        ammo="Crepuscular Pebble",
        body="Gleti's Cuirass",
    })

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
        body="Gleti's Cuirass",
        hands=gear.Adhemar.Hands.B,
        feet=gear.Adhemar.Feet.B,
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        left_ear="Sherida Earring",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        back=gear.capes.STRWS,
    })
    sets.precast.WS['Pyrrhic Kleos'].Buffed = set_combine(sets.precast.WS['Pyrrhic Kleos'], {})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands=gear.Adhemar.Hands.B,
        legs="Gleti's Breeches",
        feet=gear.Adhemar.Feet.B,
        neck="Fotia Gorget",
        left_ear="Odr Earring",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back=gear.capes.Crit,
        waist="Fotia Belt",
    })

    sets.precast.WS['Aeolian Edge'] = set_combine( sets.precast.WS, {
        ammo="Ghastly Tathlum +1",
        neck="Sibyl Scarf",
        right_ear="Friomisi Earring",
        right_ring="Medada's Ring",
        waist="Orpheus's Sash",
    })
    sets.precast.WS['Cyclone'] = set_combine( sets.precast.WS['Aeolian Edge'], sets.TreasureHunter )
    
    sets.precast.Skillchain = {}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
--        head="Felistris Mask",
--        ear2="Loquacious Earring",
--        body="Iuitl Vest",
--        hands="Iuitl Wristbands",
--        legs="Kaabnax Trousers",
--        feet="Iuitl Gaiters +1"
    }
        
    -- Specific spells
    sets.midcast.Utsusemi = {
--        head="Felistris Mask",
--        neck="Ej Necklace",
--        ear2="Loquacious Earring",
--        body="Iuitl Vest",
--        hands="Iuitl Wristbands",
--        ring1="Beeline Ring",
--        back="Toetapper Mantle",
--        legs="Kaabnax Trousers",
--        feet="Iuitl Gaiters +1"
    }

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
--        head="Ocelomeh Headpiece +1",
--        neck="Wiglen Gorget",
--        ring1="Sheltered Ring",
--        ring2="Paguroidea Ring"
    }
--    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    

    -- Idle sets

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        back=gear.capes.TP,
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head=gear.Empyrean.Head,
        body="Gleti's Cuirass",
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs="Gleti's Breeches",
        feet=gear.Empyrean.Feet,
        ammo="Coiste Bodhar",
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        back=gear.capes.TP,
        left_ear="Sherida Earring",
        right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Store TP"+6','DEX+9 AGI+9',}},
        left_ring="Gere Ring",
        right_ring="Chirich Ring +1",
    }

    sets.engaged.Normal = set_combine(sets.engaged, {})

    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.Evasion = set_combine(sets.engaged, {})

    sets.engaged.PDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        left_ring="Moonlight Ring",
        right_ring="Moonlight Ring",
    })

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {
        --legs="Horos Tights"
    }
    sets.buff['Climactic Flourish'] = {
        head=gear.Empyrean.Head,
    }
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

    if spell.type == 'WeaponSkill' and state.AutoBuffMode.current == 'on' and player.tp > (999 + step_cost()) then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if under3FMs() and abil_recasts[220] < latency and (abil_recasts[236] < latency or state.Buff['Presto']) and player.status == 'Engaged' then
            eventArgs.cancel = true
            windower.send_command('gs c step')
            windower.chat.input:schedule(2.3,'/ws "'..spell.english..'" '..spell.target.raw..'')
            tickdelay = os.clock() + 4.3
            return
        elseif not under3FMs() and not state.Buff['Building Flourish'] and abil_recasts[226] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Climactic Flourish" <me>')
            windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            tickdelay = os.clock() + 1.25
            return
        elseif not under3FMs() and not state.Buff['Climactic Flourish'] and abil_recasts[222] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Building Flourish" <me>')
            windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            tickdelay = os.clock() + 1.25
            return
        end
    elseif spell.type == 'Step' and player.main_job_level >= 77 and state.AutoPrestoMode.value and player.tp > 99 and player.status == 'Engaged' and under3FMs() then
        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[236] < latency and abil_recasts[220] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Presto" <me>')
            windower.chat.input:schedule(1.1,'/ja "'..spell.english..'" '..spell.target.raw..'')
        end
    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.SkillchainPending.value == true then
            equip(sets.precast.Skillchain)
        end
    end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.type == 'WeaponSkill' and state.AutoBuffMode.current == 'on' and state.Buff['Climactic Flourish'] and not under3FMs() and player.tp < 999 then
            local abil_recasts = windower.ffxi.get_ability_recasts()
            if abil_recasts[222] < latency then
                windower.chat.input:schedule(1.5,'/ja "Reverse Flourish" <me>')
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        --determine_haste_group()
        handle_equipping_gear(player.status)
    elseif buff == 'Saber Dance' or buff == 'Climactic Flourish' then
        handle_equipping_gear(player.status)
    end
end


function job_status_change(new_status, old_status)
    if new_status == 'Engaged' then
        --determine_haste_group()
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

    --equip(gear.weapons[state.Weapons.current])

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()
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

function customize_idle_set(idleSet)
    if player.hpp < 80 and not areas.Cities:contains(world.area) then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.DefenseMode.value ~= 'None' then
        if buffactive['saber dance'] then
            meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
        end
        if state.Buff['Climactic Flourish'] then
            meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
        end
    end
    
    return meleeSet
end

-- Handle auto-targetting based on local setup.
--function job_auto_change_target(spell, action, spellMap, eventArgs)
--    if spell.type == 'Step' then
--        if state.IgnoreTargetting.value == true then
--            state.IgnoreTargetting:reset()
--            eventArgs.handled = true
--        end
--        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
--    end
--end


-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', ['..state.MainStep.current

    msg = msg .. '/'..state.AltStep.current
    
    msg = msg .. ']'

    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
    if cmdParams[1] == 'step' then
        local doStep = ''
         if cmdParams[2] == 'secondary' then
            doStep = state.AltStep.current
        else
            doStep = state.MainStep.current
        end        
        
        send_command('@input /ja "'..doStep..'" <t>')
    end

    if cmdParams[1] == 'samba' then
        local doSamba = ''
        doSamba = state.Samba.current      
        
        send_command('@input /ja "'..doSamba..'" <me>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Charis body, Charis neck + DW earrings, and Patentia Sash.

    -- For high haste, we want to be able to drop one of the 10% groups (body, preferably).
    -- High haste buffs:
    -- 2x Marches + Haste
    -- 2x Marches + Haste Samba
    -- 1x March + Haste + Haste Samba
    -- Embrava + any other haste buff
    
    -- For max haste, we probably need to consider dropping all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste/March + Haste Samba
    -- 2x March + Haste + Haste Samba

    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.haste or buffactive.march) and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march or buffactive['haste samba']) then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 and (buffactive.haste or buffactive['haste samba']) then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


-- Automatically use Presto for steps when it's available and we have less than 3 finishing moves
function auto_presto(spell)
    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 20)
end

function under3FMs()
    if not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)'] then
        return true
    else
        return false
    end
end

function job_tick()
    if check_dance() then return true end
    if automatic_job_buffs() then return true end
    return false
end

function automatic_job_buffs()
    if state.AutoBuffMode.current == 'on' then
        local abil_recasts = windower.ffxi.get_ability_recasts()

        if not buffactive['Finishing Move 1'] and not buffactive['Finishing Move 2'] and not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)'] and abil_recasts[223] < latency then
            windower.chat.input('/ja "No Foot Rise" <me>')
            tickdelay = os.clock() + 1.1
            return true
        end
        
    end

    return false
end

function check_dance()

    if state.DanceStance.value ~= 'None' and not (state.Buff['Saber Dance'] or state.Buff['Fan Dance']) and player.in_combat then
        
        local abil_recasts = windower.ffxi.get_ability_recasts()
        
        if state.DanceStance.value == 'Saber Dance' and abil_recasts[219] < latency then
            windower.chat.input('/ja "Saber Dance" <me>')
            tickdelay = os.clock() + 1.1
            return true
        elseif state.DanceStance.value == 'Fan Dance' and abil_recasts[224] < latency then
            windower.chat.input('/ja "Fan Dance" <me>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end

    return false
end

function step_cost()
    local cost = 100
    
    if player.equipment.main == 'Setan Kober' then cost = cost - 40 end
    if player.equipment.sub == 'Setan Kober' then cost = cost - 40 end
    if state.DefenseMode.value == 'None' then cost = cost - step_feet_reduction end
    
    return cost
end