-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )
	state.CastingMode:options('Normal', 'SIRD', 'Enmity' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', '' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	runedelay = os.clock() + 1
	state.AutoRunes = M{['description']='Auto Runes List', 'Default', 'Ignis', 'Gelus', 'Flabra', 'Sulpor', 'Unda', 'Lux' }
	runeSetups = {
		Default = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=3},
		},
		Ignis = {
			{Name='Ignis', Amount=3},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Gelus = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=3},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Flabra = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=3},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Tellus = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=3},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Sulpor = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=3},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Unda = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=3},
			{Name='Lux', Amount=0},
			{Name='Tenebrae', Amount=0},
		},
		Lux = {
			{Name='Ignis', Amount=0},
			{Name='Gelus', Amount=0},
			{Name='Flabra', Amount=0},
			{Name='Tellus', Amount=0},
			{Name='Sulpor', Amount=0},
			{Name='Unda', Amount=0},
			{Name='Lux', Amount=3},
			{Name='Tenebrae', Amount=0},
		},
		
	}

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

	if cmdParams[1]:lower() == 'rune' then
		next_rune()
		eventArgs.handled = true
	elseif cmdParams[1]:lower() == 'buff' then
		handle_buffing(cmdParams)
		eventArgs.handled = true
	elseif cmdParams[1]:lower() == 'showcharge' then
		add_to_chat(204, '~~~Current Stratagem Charges Available: ['..get_current_strategem_count()..']~~~')
	end
end

function handle_buffing(cmdParams)
	-- cmdParams[1] == 'buff'
    -- cmdParams[2] == ability to use
	-- cmdParams[3] == optional target

    if not cmdParams[2] then
        add_to_chat(123,'Error: No buff command given.')
        return
    end
    local command = cmdParams[2]:lower()

	if buffactive.silence or buffactive.mute or buffactive.paralysis then
		add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling buff.')
		return
	end

	-- determine target
	local target = '<me>'
	if player.target.type ~= "MONSTER" then
		target = '<t>'
	end
	if cmdParams[3] then
		target = cmdParams[3]
	end

	-- default to long, party wide buffs
	local params = {
		needs_addendum = false,
		accession = true,
		perpetuance = true,
		target = target,
	}

	if command == 'weather' then
		params.perpetuance = false
		params.target = '<me>'
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			params.spell = data.elements.storm_of[state.ElementalMode.value]..' II'
		else
			params.spell = data.elements.storm_of[state.ElementalMode.value]
		end
		buff_helper(params)
	elseif command == 'sneak' then
		params.spell = 'Sneak'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'invisible' then
		params.spell = 'Invisible'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'reraise' then
			params.spell = 'Reraise'
			params.perpetuance = false
			params.accession = false
			params.needs_addendum = true
			params.target = '<me>'
			buff_helper(params)
	else				
		add_to_chat(123,'Unrecognized buffing command.')
	end
end
-- normalize buffing
function buff_helper(params)
	local schedule = .1
	local strats_needed = 0

	-- base art activation needed
	if not (buffactive['Light Arts'] or buffactive['Addendum: White']) then
		windower.chat.input('/ja "Light Arts" <me>')
		schedule = schedule + 2
	end

	if params.needs_addendum and not buffactive['Addendum: White'] then
		windower.chat.input:schedule(schedule,'/ja "Addendum: White" <me>')
		schedule = schedule + 2
	end

	--determine strat requirements
	if params.accession then
		strats_needed = strats_needed + 1
	end

	if params.perpetuance then
		strats_needed = strats_needed + 1
	end

	--abort if we don't have required strats
	if (get_current_strategem_count()) < strats_needed then
		add_to_chat(123,'Abort: You have less than the required stratagems available.')
		return
	end
	
	--apply ja modifiers and schedule out casting
	if params.accession and not buffactive['Accession'] then
		windower.chat.input:schedule(schedule,'/ja "Accession" <me>')
		schedule = schedule + 2
	end

	if params.perpetuance and not buffactive['Perpetuance'] then
		windower.chat.input:schedule(schedule,'/ja "Perpetuance" <me>')
		schedule = schedule + 2
	end

	windower.chat.input:schedule(schedule,'/ma "' .. params.spell .. '" ' .. params.target)
end

function job_tick()
	if check_buff() then return true end
	if check_runes() then return true end
	if state.AutoTank.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_flash_foil() then return true end
		windower.send_command('gs c subjobemnity')
		return true
	end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Pflug'] and abil_recasts[59] < latency then
			windower.chat.input('/ja "Pflug" <me>')
			return true
		elseif not (buffactive['Vallation'] or buffactive['Valiance']) then
			if abil_recasts[113] < latency then
				windower.chat.input('/ja "Valiance" <me>')
				tickdelay = os.clock() + 10
				return true
			elseif abil_recasts[23] < latency then
				windower.chat.input('/ja "Vallation" <me>')
				tickdelay = os.clock() + 10
				return true
			end
		end
	end

	return false
end

function check_runes()

	if state.AutoBuffMode.value ~= 'Off' and windower.ffxi.get_ability_recasts()[242] < latency and (player.hpp < 50 or (state.AutoRunes.value == 'Default' and player.mpp < 75)) then
		windower.chat.input('/ja "Vivacious Pulse" <me>')
		return true
	end

	if state.AutoBuffMode.value ~= 'Off' and windower.ffxi.get_ability_recasts()[92] < latency and os.clock() > runedelay then
		runedelay = os.clock() + 5 --additional delay to prevent chat spam
		return next_rune()
    end

	return false
end

function next_rune()
	for i = 1,8 do
		local rune
		rune = runeSetups[state.AutoRunes.value][i]
		if rune then
			local runesActive = buffactive[rune.Name] or 0
			if tonumber(rune.Amount) > 0 and runesActive < rune.Amount then
				windower.chat.input('/ja "'..rune.Name..'" <me>')
				return true
			end
		else
			return false
		end
	end
end

function check_flash_foil()
	if silent_check_silence() then return false end
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	if not buffactive['Enmity Boost'] and spell_recasts[476] < spell_latency then
		windower.chat.input('/ma "Crusade" <me>')
		return true
	elseif spell_recasts[112] < spell_latency then
		windower.chat.input('/ma "Flash" <t>')
		return true
	elseif spell_recasts[840] < spell_latency then
		windower.chat.input('/ma "Foil" <me>')
		return true
	else
		return false
	end
end