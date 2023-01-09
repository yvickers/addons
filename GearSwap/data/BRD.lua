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

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		--main="Bolelabunga",
		--sub="Sors Shield",
		--range="Dunna",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', '' }

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

    enable( 'range', 'ranged', 'ammo' )
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.precast.FC = {}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
	})
	
	sets.precast.FC.BardSong = {
	}

	sets.precast.JA.Nightingale = {
		--feet=gear.Relic.Feet,
	}
	sets.precast.JA.Troubadour = {
		--body=gear.Relic.Body,
	}
	sets.precast.JA['Soul Voice'] = {
		--legs=gear.Relic.Legs,
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

	sets.midcast.FastRecast = {}

	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {}
	sets.midcast.Lullaby.Resistant = {}
	sets.midcast['Horde Lullaby'] = {}
	sets.midcast['Horde Lullaby'].Resistant = {}
	sets.midcast['Horde Lullaby'].AoE = {}
	sets.midcast['Horde Lullaby II'] = {}
	sets.midcast['Horde Lullaby II'].Resistant = {}
	sets.midcast['Horde Lullaby II'].AoE = {}
	sets.midcast.Madrigal = {}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{})
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}

	sets.midcast.SongEffect = {}

	sets.midcast.SongDebuff = {}

	sets.midcast.Cure = {}
	sets.midcast.Curaga = {}
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Stoneskin = {}
	sets.midcast.Cursna = {}

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

	sets.latent_refresh = {}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if spell.english == 'Horde Lullaby' and spell_recasts[376] > 0 then
		send_command('@input /ma "Horde Lullaby II" '..tostring(spell.target.raw))
		eventArgs.cancel = true
		return
	end
	if spell.english == 'Horde Lullaby II' and spell_recasts[377] > 0 then
		send_command('@input /ma "Horde Lullaby" '..tostring(spell.target.raw))
		eventArgs.cancel = true
		return
	end


	if spell.action_type == 'Magic' then
		if not sets.precast.FC[spell.english] and (spell.type == 'BardSong' and spell.targets.Enemy) then
			classes.CustomClass = 'SongDebuff'
		end
	end
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == "WeaponSkill" then
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_post_midcast(spell, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
			if generalClass and sets.midcast[generalClass] then
				if sets.midcast[generalClass][state.CastingMode.value] then
					equip(sets.midcast[generalClass][state.CastingMode.value])
				else
					equip(sets.midcast[generalClass])
				end
            end
			
            if sets.midcast[spell.english] then
				if sets.midcast[spell.english][state.CastingMode.value] then
					equip(sets.midcast[spell.english][state.CastingMode.value])
				else
					equip(sets.midcast[spell.english])
				end
			elseif sets.midcast[get_spell_map(spell, default_spell_map)] then
				if sets.midcast[get_spell_map(spell, default_spell_map)][state.CastingMode.Value]
					then equip(sets.midcast[get_spell_map(spell, default_spell_map)][state.CastingMode.Value])
				else
					equip(sets.midcast[get_spell_map(spell, default_spell_map)])
				end
			end
        end
    end
end
-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if spell.targets.Enemy then
		return 'SongDebuff'
    else
        return 'SongEffect'
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
	--determine_haste_group()
end


function customize_idle_set(idleSet)
	if state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere') then
		if player.mpp < 51 then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
		end
	end
	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    --check_range_lock()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if silent_check_fighting() and not silent_check_amnesia() then
		end
	end

	return false
end