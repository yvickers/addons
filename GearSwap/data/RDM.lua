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
	state.CastingMode:options( 'Normal', 'Resistant', 'Potency', 'Proc' )
	enspell = ''

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Naegling",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade' }

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

	sets.precast.JA['Chainspell'] = {
		body=gear.Relic.Body
	}

	sets.precast.FC = {
	}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		--head=empty,
		--body="Twilight Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		--main="Daybreak",
		--sub="Sacro Bulwark"
	})

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

	sets.midcast.FastRecast = {
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range=empty,ammo="Hasty Pinion +1",
		--head="Atrophy Chapeau +3",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		--body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		--back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"
	}

    sets.midcast.Cure = {
		--main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        --head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        --body="Viti. Tabard +3",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        --back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"
	}
		
    sets.midcast.LightWeatherCure = {
		--main="Chatoyant Staff",sub="Curatio Grip",range=empty,ammo="Hasty Pinion +1",
        --head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        --body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        --back="Twilight Cape",waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Kaykaus Boots"
	}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
		--main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        --head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        --body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        --back="Twilight Cape",waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Kaykaus Boots"
	}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"
	})
		
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {
		--main="Colada",sub="Ammurapi Shield",range=empty,ammo="Hasty Pinion +1",
		--head="Telchine Cap",neck="Dls. Torque +2",ear1="Andoaa Earring",ear2="Gifted Earring",
		--body="Viti. Tabard +3",hands="Atrophy Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Leth. Houseaux +1"
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		--head="Leth. Chappel +1",
		--body="Lethargy Sayon +1",hands="Leth. Gantherots +1",
		--legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"
	}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
		--main="Pukulatmuj +1",head="Befouled Crown",neck="Incanter's Torque",ear2="Mimir Earring",hands="Viti. Gloves +3",back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3"
	}
	--sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	--sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	--sets.midcast.BarElement = {legs="Shedir Seraweels"}
	--sets.midcast.Temper = sets.EnhancingSkill
	--sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	--sets.midcast.Enspell = sets.midcast.Temper
	--sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	--sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	--sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	--sets.midcast.Protect = {ring2="Sheltered Ring"}
	--sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {
		--main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Regal Gem",
	--	head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		--body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"
	}
	sets.midcast.INTEnfeeble = {}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
		--main="Daybreak",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		--head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		--body="Atrophy Tabard +3",hands=gear.chironic_enfeeble_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"
	}
		
	--sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3",range="Kaja Bow"})
		
	--sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	--sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	--sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	--sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	--sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	--sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	--sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	--sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	
	--sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	--sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",legs="Psycloth Lappas"})
	
	--sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	--sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	--sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	--sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	--sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	--sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	--sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	--sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	--sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	--sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Chaac Belt"})
	
	--sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	--sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	--sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

    sets.midcast['Elemental Magic'] = {
		--main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Dosis Tathlum",
        --head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
       -- body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        --back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet
	}
		
    sets.midcast['Elemental Magic'].Resistant = {
		--main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        --head=gear.merlinic_nuke_head,neck="Dls. Torque +2",ear1="Regal Earring",ear2="Friomisi Earring",
       -- body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        --back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet
	}

    sets.midcast['Elemental Magic'].Proc = {}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Regal Earring",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ear1="Regal Earring",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ring1="Metamor. Ring +1"})
		
	sets.midcast.Impact = {}

	sets.midcast['Dark Magic'] = {
		--main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		--head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		--body="Atrophy Tabard +3",hands="Leth. Gantherots +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet
	}

    sets.midcast.Drain = {
		--main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
        --head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        --body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        --back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet
	}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
		--main="Daybreak",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		--head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		--body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Sailfi Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet
	}
		
	sets.midcast.Stun.Resistant = {
		--main="Daybreak",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		--head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		--body="Atrophy Tabard +3",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet
	}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {
		hands=gear.Empyrean.Hands,
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
	sets.idle.Refresh = set_combine(sets.idle, {
	})
	sets.latent_refresh = {}

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
	if spell.action_type == 'Magic' then
		if buffactive.Chainspell then
			eventArgs.handled = true
		end
		if spell.english == 'Phalanx II' and (spell.target.type == 'SELF' or buffactive.Accession) then
			windower.chat.input('/ma "Phalanx" <me>')
			cancel_spell()
			eventArgs.cancel = true
		elseif spell.english == 'Phalanx' and (spell.target.type ~= 'SELF') then
			windower.chat.input('/ws "Phalanx II" '..spell.target.raw)
			cancel_spell()
			eventArgs.cancel = true
		end
		
        if state.CastingMode.current ~= 'Normal' then
            classes.CustomClass = state.CastingMode.current
		else
			classes.CustomClass = ''
		end

		if buffactive.Stymie then
			classes.CustomClass = 'Potency'
		end
    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_midcast(spell,action,spellMap,eventArgs)
	if spell.skill == 'Enfeebling Magic' then

		if buffactive.Saboteur then
			equip(sets.buff.Saboteur)
		end

	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast['Enhancing Magic'])
	
		if buffactive.Composure and spell.target.type == 'PLAYER' then
			equip(sets.buff.ComposureOther)
		end
		if sets.midcast[spell.english] then		
			equip(sets.midcast[spell.english])
		end
    end

end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		--elseif data.spells.enspells:contains(spell.english) then
		--	enspell = spell.english
		--	update_melee_groups()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == enspell and not gain then
		enspell = ''
	end
	update_melee_groups()
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

	equip(gear.weapons[state.Weapons.current])

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
end


function customize_idle_set(idleSet)
	if state.IdleMode.value == 'Normal' then
		if player.mpp < 51 then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
		end
   end
    
    return idleSet
end

function customize_melee_set(meleeSet)
	if state.Weapons.value:contains('Enspell') and enspell ~= '' then
		local enspell_element = data.elements.enspells_lookup[enspell]
		if sets.element.enspell and sets.element.enspell[enspell_element] then
			meleeSet = set_combine(meleeSet, sets.element.enspell[enspell_element])
		end

		local hachirin_avail = item_available('Hachirin-no-Obi')
		if hachirin_avail and enspell_element == world.weather_element and world.weather_intensity == 2 then
			meleeSet = set_combine(meleeSet, {waist="Hachirin-no-Obi"})
		elseif item_available("Orpheus's Sash") then
			meleeSet = set_combine(meleeSet, {waist="Orpheus's Sash"})
		elseif hachirin_avail and enspell_element == world.weather_element or enspell_element == world.day_element then
			meleeSet = set_combine(meleeSet, {waist="Hachirin-no-Obi"})
		end
	end
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    --check_range_lock()
end

function update_melee_groups()
	classes.CustomMeleeGroups:clear()
	
	if enspell ~= '' then
		if enspell:endswith('II') then
			classes.CustomMeleeGroups:append('Enspell2')
		else
			classes.CustomMeleeGroups:append('Enspell')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
		if world.weather_element == 'Light' then
                return 'LightWeatherCure'
		elseif world.day_element == 'Light' then
                return 'LightDayCure'
        end
	end	
	
	if spell.skill == 'Enfeebling Magic' then
		if spell.english:startswith('Dia') then
			return "Dia"
		elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
			return 'MndEnfeebles'
        else
            return 'IntEnfeebles'
        end
    end
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
	end	

	if not buffactive.Composure then	
		if abil_recasts[50] < latency then	
			windower.chat.input('/ja "Composure" <me>')	
			return true	
		end	
	end	

	if player.sub_job == 'SCH' and not buffactive['Light Arts'] and abil_recasts[228] < latency then	
		send_command('@input /ja "Light Arts" <me>')	
		return true	
	end

	return false
end

--windower.register_event('examined', function(name,examiner_index)
--end)
--
--
--windower.register_event('remove item', function(bag,index,id,count)
	--local gate
	--local mobs = windower.ffxi.get_mob_array()
	--local player = windower.ffxi.get_mob_by_target('me')
	--packets = require('packets')
	--for _, mob in pairs(mobs) do
		--if 'altepa gate' == mob.name:lower() then
			--windower.add_to_chat(207, 'testing: ' .. mob.id)
			--local packet = packets.new('outgoing', 0x01A, {
				--["Target"]=mob.id,
				--["Target Index"]=mob.index,
				--["Category"]=0,
				--["Param"]=0,
				--["_unknown1"]=0})
			--packets.inject(packet)
		--end
	--end
--end)