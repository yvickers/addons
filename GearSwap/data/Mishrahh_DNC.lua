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

    state.MainWS = M{['description'] = 'Main Weaponskill', "Rudra's Storm", 'Evisceration', 'Aeolian Edge' }
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
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false

    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
    state.Samba = M{['description']='Main Samba', 'Haste Samba', 'Drain Samba III', 'Aspir Samba II'}

    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
    state.SkillchainPending = M(false, 'Skillchain Pending')

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
    gear.capes.TP = { name="Senuna's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    --gear.capes.Crit = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    --gear.capes.WSDMG = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

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

    sets.TreasureHunter = {
        --ammo="Per. Lucky Egg",
        head='Volte Cap',
        hands=gear.Herc.Hands.TH,
        body=gear.Herc.Body.TH,
        --waist="Chaac Belt",
        legs=gear.Herc.Legs.TH,
        --feet=gear.Empyrean.Feet
    }
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    --sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}

    --sets.precast.JA['Trance'] = {head="Horos Tiara"}
    

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
--        feet="Maxixi Toe Shoes"
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
--    sets.precast.Samba = {head="Maxixi Tiara"}

--    sets.precast.Jig = {legs="Horos Tights", feet="Maxixi Toe Shoes"}

    sets.precast.Step = {
        --waist="Chaac Belt"
    }
--    sets.precast.Step['Feather Step'] = {feet="Charis Shoes +2"}

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {
    } -- magic accuracy

    sets.precast.Flourish1['Desperate Flourish'] = {
    } -- acc gear

    sets.precast.Flourish2 = {}
--    sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

    sets.precast.Flourish3 = {}
--    sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}
--    sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +2"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
--        ammo="Impatiens",
--        head="Haruspex Hat",
--        ear2="Loquacious Earring",
--        hands="Thaumas Gloves",
--        ring1="Prolix Ring"
    }

--    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Charis Feather",
        head="Lilitu Headpiece",
        neck="Fotia Gorget",
        ear1="Odr Earring",
        ear2="Moonshade Earring",
        body=gear.Meghanada.Body,
        hands=gear.Meghanada.Hands,
        ring1="Rajas Ring",
        ring2="Ilabrat Ring",
        back=gear.capes.TP,
        waist="Kentarch Belt +1",
        legs=gear.Herc.Legs.WSD,
        feet=gear.Adhemar.Feet.B
    }
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    })
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
        ammo="Charis Feather",
        head=gear.Adhemar.Head.B,
        body=gear.Meghanada.Body,
        hands=gear.Mummu.Hands,
        legs="Samnuha Tights",
        feet=gear.Mummu.Feet,
        neck="Fotia Gorget",
        back=gear.capes.TP,
        waist="Fotia Belt",
        ear1="Odr Earring",
        ear2="Sherida Earring",
        ring1="Mummu Ring",
        ring2="Ilabrat Ring",
    })

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {
    })

    sets.precast.WS['Aeolian Edge'] = {
--        ammo="Charis Feather",
--        head="Wayfarer Circlet",
--        neck="Stoicheion Medal",
--        ear1="Friomisi Earring",
--        ear2="Moonshade Earring",
--        body="Wayfarer Robe",
--        hands="Wayfarer Cuffs",
--        ring1="Acumen Ring",
--        ring2="Demon's Ring",
--        back="Toro Cape",
--        waist="Chaac Belt",
--        legs="Shneddick Tights +1",
--        feet="Wayfarer Clogs"
    }
    
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
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Warder's Charm +1",
        waist="Flume Belt +1",
        back=gear.capes.TP,
        left_ear="Odnowa Earring +1",
        right_ear="Genmei Earring",
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
        head=gear.Adhemar.Head.B,
        --body=gear.Artifact.Body,
        hands=gear.Adhemar.Hands.TP,
        legs="Samnuha Tights",
        feet="Malignance Boots",
        ammo="Coiste Bodhar",
        neck="Sanctity Necklace",
        waist="Patentia Sash",
        back=gear.capes.TP,
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Ilabrat Ring",
        right_ring="Moonbeam Ring",
    }

    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.Evasion = set_combine(sets.engaged, {})

    sets.engaged.PDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Moonbeam Ring",
    })

    sets.engaged.MDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Moonbeam Ring",
    })

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {
        --legs="Horos Tights"
    }
    sets.buff['Climactic Flourish'] = {
        --head="Charis Tiara +2"
    }
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

    if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' and player.tp > (999 + step_cost()) then
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
        elseif player.sub_job == 'SAM' and player.tp > 1850 and abil_recasts[140] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Sekkanoki" <me>')
            windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            tickdelay = os.clock() + 1.25
            return
        elseif player.sub_job == 'SAM' and abil_recasts[134] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Meditate" <me>')
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
        if spell.type == 'WeaponSkill' and state.Buff['Climactic Flourish'] and not under3FMs() and player.tp < 999 then
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

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
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
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
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
    if state.AutoBuffMode.value ~= 'Off' then
        local abil_recasts = windower.ffxi.get_ability_recasts()

        if not buffactive['Finishing Move 1'] and not buffactive['Finishing Move 2'] and not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)'] and abil_recasts[223] < latency then
            windower.chat.input('/ja "No Foot Rise" <me>')
            tickdelay = os.clock() + 1.1
            return true
        end
        
        if player.in_combat then

            if player.sub_job == 'WAR' then
                if not buffactive.Berserk and 
                    abil_recasts[1] < latency then
                    windower.chat.input('/ja "Berserk" <me>')
                    tickdelay = os.clock() + jatickdelay
                    return true
                elseif not buffactive.Aggressor and abil_recasts[4] < latency then
                    windower.chat.input('/ja "Aggressor" <me>')
                    tickdelay = os.clock() + jatickdelay
                    return true
                else
                    return false
                end
            end
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