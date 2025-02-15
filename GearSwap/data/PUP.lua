-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Buffed' )
	state.IdleMode:options( 'Normal', 'PDT' )

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Stringing Pummel' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
    state.AutoFightMode = M( true, "Auto Pet Fight" )

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
	gear.capes.BothTP = {} --{ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Accuracy+10','Pet: Haste+10',}}
	gear.capes.MasterTP = gear.capes.BothTP
	gear.capes.MasterWS = gear.capes.BothTP

	state.PetMode = M{['description']='Pet Mode', 'None', 'Overdrive', 'Ranger', 'BruiserTank', 'TurtleTank', 'HarlequinTank', 'SharpshotTank', 'BoneSlayer', 'WhiteMage', 'RedMage', 'BlackMage' }
	state.AutoManeuvers = M{['description']='Auto Maneuver List', 'Default', 'Overdrive', 'Ranger', 'BruiserTank', 'TurtleTank', 'HarlequinTank', 'SharpshotTank', 'BoneSlayer', 'WhiteMage', 'RedMage', 'BlackMage' }
	state.AutoEngageDistance = 8

	defaultManeuvers = {
		None = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
		},
		Overdrive = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		OverdriveRanger = {
			{Name='Light Maneuver',	  Amount=0},
			{Name='Fire Maneuver', 	  Amount=2},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
		},
		Ranger = {
			{Name='Light Maneuver',	  Amount=0},
			{Name='Fire Maneuver', 	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=3},
		},
		BruiserTank = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
		},
		TurtleTank = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=2},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		TurtleTankMagic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Water Maneuver',   Amount=1},
		},
		TurtleTankDispel = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Dark Maneuver',    Amount=1},
		},
		HarlequinTank = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Water Maneuver',   Amount=1},
		},
		SharpshotTank = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
		},
		BoneSlayer = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
		},
		WhiteMage = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Ice Maneuver',     Amount=1},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		WhiteMageIntense = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Ice Maneuver',     Amount=0},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		WhiteMageNA = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Water Maneuver',   Amount=1},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		RedMage = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Ice Maneuver',     Amount=1},
			{Name='Wind Maneuver', 	  Amount=0},
		},
		BlackMage = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Ice Maneuver',     Amount=1},
			{Name='Wind Maneuver', 	  Amount=0},
		},
	}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps
~	Shift
--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	if select_default_macro_book then
		select_default_macro_book()
	end

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
	sets.buff.Overdrive = {}

	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		-- body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.WS = {
		--ammo="Knobkierrie",
		--head="Ken. Jinpachi +1",
		--body="Ken. Samue +1",
		--hands=gear.Artifact.Hands,
		--legs="Ken. Hakama +1",
		--feet="Ken. Sune-Ate +1",
		--neck="Mnk. Nodowa +1",
		--waist="Moonbow Belt",
		--left_ear="Sherida Earring",
		--right_ear="Moonshade Earring",
		--left_ring="Epona's Ring",
		--right_ring="Rajas Ring",
		--back=gear.capes.StrDA,
	}

	sets.idle = {
		--ammo="Staunch Tathlum",
		--head="Malignance Chapeau",
		--body="Malignance Tabard",
		--hands=gear.Adhemar.Hands.TP,
		--legs="Malignance Tights",
		--feet="Malignance Boots",
		--neck="Warder's Charm +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Gelatinous Ring +1",
		--back=gear.capes.DexTP,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})
	sets.idle.Pet = {}
	sets.idle.Pet.Engaged = {}

	sets.engaged = {
		--ammo="Staunch Tathlum",
		--head="Malignance Chapeau",
		--body="Malignance Tabard",
		--hands=gear.Adhemar.Hands.TP,
		--legs="Malignance Tights",
		--feet="Malignance Boots",
		--neck="Warder's Charm +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Gelatinous Ring +1",
		--back=gear.capes.DexTP,
	}
	sets.engaged.Pet = {}
	sets.engaged.Pet.Engaged = {}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	--if state.AutoBuffMode.current == 'on' and spell.type == 'WeaponSkill' and player.sub_job == 'WAR' and abil_recasts[2] < latency and not buffactive.Berserk then
	--	cast_delay(1.1)
	--	send_command('@input /ja "Warcry" <me>')
	--end
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
	--update_melee_groups()
	if sets.buff[buff] then
        if gain then
            equip(sets.buff[buff])
        else
            send_command('gs c update auto')
        end     
    end
end


function job_status_change(new_status, old_status)
	if new_status == "Engaged" and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and state.AutoFightMode.value and player.target.distance < state.AutoEngageDistance then
		windower.chat.input('/pet Deploy <t>')
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
	--determine_haste_group()
end


function customize_idle_set(idleSet)
	if pet.isvalid and pet.status == 'Engaged' then
		if sets.idle.Pet.Engaged[state.PetMode.value] then
			idleSet = set_combine(idleSet, sets.idle.Pet.Engaged[state.PetMode.value])
		else
			idleSet = set_combine(idleSet, sets.idle.Pet.Engaged)
		end

		if buffactive['Overdrive'] and sets.buff.Overdrive then
			idleSet = set_combine(idleSet, sets.buff.Overdrive)
		end
	elseif player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere')) then
		if sets.latent_refresh then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
	end
	return idleSet
end

function customize_melee_set(meleeSet)
	if pet.isvalid and pet.status == 'Engaged' then
		if sets.engaged.Pet.Engaged[state.PetMode.value] then
			meleeSet = set_combine(idleSet, sets.engaged.Pet.Engaged[state.PetMode.value])
		else
			meleeSet = set_combine(idleSet, sets.engaged.Pet)
		end

	end
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    --check_range_lock()
end

-- Update custom groups based on the current pet.
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )

	if type(cmdParams) == 'string' then
		cmdParams = T(cmdParams:split(' '))
		if #cmdParams == 0 then
			return
		end
	end

	if cmdParams[1]:lower() == 'maneuver' then
		next_maneuver()
		eventArgs.handled = true
	end

	if cmdParams[1]:lower() == 'petdistance' then
		state.AutoEngageDistance = tonumber(cmdParams[2])
		add_to_chat(104, 'Automaton will engage < '..state.AutoEngageDistance..' yalms.')
		eventArgs.handled = true
	end
end

function job_tick()
	if check_buff() then return true end
	if check_repair() then return true end
	if check_maneuver() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
	end

	if silent_check_fighting() and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and state.AutoFightMode.value and player.target.distance < state.AutoEngageDistance then
		windower.chat.input('/pet Deploy <t>')
	end

	return false
end

function check_repair()

	if state.AutoBuffMode.current == 'on' and pet.isvalid and pet.hpp < 25 then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[206] < latency and player['inventory']['Automat. Oil +3'] then
			windower.chat.input('/ja "Repair" <me>')
			return true
		end

		--swap hp
		if abil_recasts[211] < latency then
			windower.chat.input('/ja "Role Reversal" <me>')
			return true
		end
	end

	return false
end

function check_maneuver()
    if state.AutoBuffMode.value ~= 'Off' and pet.isvalid and pet.status == 'Engaged' and windower.ffxi.get_ability_recasts()[210] < latency then
		return next_maneuver()
    end

	return false
end

function next_maneuver()
	for i = 1,8 do
		local maneuver
		if state.AutoManeuvers.value == 'Default' then
			maneuver = defaultManeuvers[state.PetMode.Value][i]
		else
			maneuver = defaultManeuvers[state.AutoManeuvers.value][i]
		end
		if maneuver then
			local maneuversActive = buffactive[maneuver.Name] or 0
			if maneuversActive < maneuver.Amount then
				windower.chat.input('/pet "'..maneuver.Name..'" <me>')
				return true
			end
		else
			return false
		end
	end
end