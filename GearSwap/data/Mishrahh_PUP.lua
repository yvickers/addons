-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	state.PetMode = M{['description']='Pet Mode', 'None','Melee','Ranged','HybridRanged','Tank','LightTank','Magic','Heal','Nuke'}
	state.AutoRepairMode = M(true, 'Auto Repair Mode')
	state.AutoDeployMode = M(true, 'Auto Deploy Mode')
	state.AutoPetMode 	 = M(true, 'Auto Pet Mode')
	repairhpp = 45

	include('Mote-TreasureHunter')
	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}

	state.Weapons = M{['description'] = 'Weapon Setup', 'Godhands', 'PetHands' }
	gear.weapons = {}
	gear.weapons['Godhands'] = {
		main="Godhands",
		ranged="Animator P",
	}
	gear.weapons['Godhands'] = {
		main="Ohtas",
		ranged="Animator P",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Shijin Spiral', 'Victory Smite' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

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
	--gear.capes.DexTP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

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
	update_pet_mode()
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
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
end

function job_pet_change(pet, gain)
    update_pet_mode()
end

function job_status_change(new_status, old_status)
	if newStatus == "Engaged" and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and state.AutoDeployMode.value and player.target.distance < 20 then
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
	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
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

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
end

function job_tick()
	if check_repair() then return true end
	if check_buff() then return true end
	return false
end

function check_repair()

	if state.AutoRepairMode.value and pet.isvalid and pet.hpp < repairhpp then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[206] < latency then
			windower.chat.input('/ja "Repair" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end

	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and player.in_combat then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'WAR' then
			if not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + jatickdelay
				return true
			elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + jatickdelay
				return true
			else
				return false
			end
		end
	end

	return false
end

-- Get the pet mode value based on the equipped frame of the automaton.
-- Returns nil if pet is not valid.
function update_pet_mode()
	if pet.isvalid and state.AutoPetMode.value then
		state.PetMode:set(get_pet_mode())
	end
	
	update_custom_groups()
end

function get_pet_mode()
	if pet.frame == 'Sharpshot Frame' then
		if pet.head == 'Valoredge Head' or pet.head == 'Harlequin Head' then
			return 'HybridRanged'
		else
			return 'Ranged'
		end
	elseif pet.frame == 'Valoredge Frame' then
		if pet.head == 'Soulsoother Head' then
			return 'Tank'
		else
			return 'Melee'
		end
	elseif pet.head == 'Sharpshot Head' or pet.head == 'Stormwaker Head' then
		return 'Magic'
	elseif pet.head == 'Spiritreaver Head' then
		return 'Nuke'
	elseif pet.frame == 'Harlequin Frame' then
		if pet.head == 'Harlequin Head' then
			return 'Melee'
		else
			return 'LightTank'
		end
	else
			if pet.head == 'Soulsoother Head' then
				return 'Heal'
			elseif pet.head == 'Valoredge Head' then
				return 'Melee'
			else
				return 'Magic'
			end
	end
end

-- Update custom groups based on the current pet.
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
    	set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end