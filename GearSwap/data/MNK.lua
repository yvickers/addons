-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'PDT', 'Normal', 'Acc', 'MDT' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc', 'Att', 'Mod' )
	state.CastingMode:options( 'Normal', 'Resistant' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')
	-- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Raging Fists' }

	state.AutoBoost = M( false, "Auto Boost Mode")
	state.AutoCounterstance = M( false, "Auto Counterstance" )
	state.AutoChakra = M( true, 'Auto Chakra' )
	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = "Temple Crown"
	gear.Artifact.Body = "Temple Cyclas"
	gear.Artifact.Hands = "Temple Gloves"
	gear.Artifact.Legs = "Temple Hose"
	gear.Artifact.Feet = "Temple Gaiters"

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
	gear.capes.DexTP = ""--{ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrDA = ""--{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	gear.capes.VitWS = ""--{ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}

	sets.buff.Impetus = {
		--body="Bhikku Cyclas +1"
	}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	select_default_macro_book()

	send_command('wait 10; input /lockstyle on')

	if user_job_setup then
        user_job_setup()
    end
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {}

	sets.precast.JA['Boost'] = {
		hands=gear.Artifact.Hands,
	}

	sets.precast.JA['Focus'] = {
		--head=gear.Artifact.Head,
	}

	sets.precast.JA['Dodge'] = {
		--body=gear.Artifact.Feet,
	}

	sets.precast.JA['Chakra'] = {
		body=gear.Artifact.Body,
		hands=gear.Relic.Hands,
	}

	sets.precast.WS = {}

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {
	})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {
	})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {
	})
	sets.precast.WS["Ascetic's Fury"]    = set_combine(sets.precast.WS, {
	})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {
	})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
	})

	sets.idle = {
	}

	sets.engaged = {
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.ExtraRegen = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
    end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if sets.buff[buff] then
        if gain then
            equip(sets.buff[buff])
        else
            send_command('gs c update auto')
        end     
    end
end


function job_status_change(new_status, old_status)
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

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
    --determine_haste_group()
end


function customize_idle_set(idleSet)
	if player.hpp < 80 and not areas.Cities:contains(world.area) then
		idleSet = set_combine( idleSet, sets.ExtraRegen )
	end
    
    return idleSet
end

function customize_melee_set(meleeSet)
	 if buffactive['Impetus'] and state.DefenseMode.value == 'None' and state.OffenseMode.value ~= 'Acc' then
		meleeSet = set_combine(meleeSet, sets.buff.Impetus)
    end
    return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

-- Automatically use boost when available
function auto_boost(spell)
    if player.tp > 1000 then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local boostCooldown = allRecasts[16]
        
        if boostCooldown < 1 then
            cast_delay(1.1)
            send_command('@input /ja "Boost" <me>')
        end
    end
end

function job_tick()
	if check_chakra() then return true end
	if check_counterstance() then return true end
	if check_buff() then return true end
	return false
end

function check_chakra()
	if state.AutoChakra.current == 'on' and not silent_check_amnesia() and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.hpp < 11 and abil_recasts[254] < latency then
			windower.chat.input('/ja "Inner Strength" <me>')
			return true
		end
		if player.hpp < 51 and abil_recasts[15] < latency then
			windower.chat.input('/ja "Chakra" <me>')
			return true
		end
	end
	return false
end

function check_counterstance()
	if state.AutoCounterstance.current == 'on' and not silent_check_amnesia() and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not buffactive['Counterstance'] then
			if abil_recasts[17] == 0 then
				send_command('@input /ja "Counterstance" <me>')
				return true
			end
		end
	end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive.Impetus and abil_recasts[31] < latency then
			windower.chat.input('/ja "Impetus" <me>')
			return true
		elseif not buffactive.Footwork and abil_recasts[21] < latency then
			windower.chat.input('/ja "Footwork" <me>')
			return true
		elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[13] < latency then
			windower.chat.input('/ja "Focus" <me>')
			return true
		end
	end

	return false
end