function user_job_setup()
	gear.Artifact = {}
	gear.Artifact.Head = "Atro. Chapeau +1"
	gear.Artifact.Body = "Atrophy Tabard +1"
	gear.Artifact.Hands = "Atrophy Gloves +3"
	gear.Artifact.Legs = "Atrophy Tights +1"
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Viti. Chapeau +3"
	gear.Relic.Body = "Viti. Tabard +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Leth. Chappel +2"
	gear.Empyrean.Body = "Lethargy Sayon +1"
	gear.Empyrean.Hands = "Leth. Gantherots +2"
	gear.Empyrean.Legs = "Leth. Fuseau +2"
	gear.Empyrean.Feet = "Leth. Houseaux +2"

	gear.capes = {}
	gear.capes.MNDEnfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.capes.FC = gear.capes.MNDEnfeeble
	gear.capes.INTEnfeeble = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	gear.capes.DRKMagic = gear.capes.INTEnfeeble

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
		main={ name="Vampirism", augments={'STR+5','INT+5','DMG:+3',}},
		sub="Culminus",
		--ammo="Quartz Tathlum +1",
		head=gear.Artifact.Head,
		body=gear.Relic.Body,
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs=gear.Ayanmo.Legs,
		feet=gear.Empyrean.Feet,
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Enchntr. Earring +1",
		right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		left_ring="Lebeche Ring",
		right_ring="Weather. Ring",
		back=gear.capes.FC,
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

	sets.midcast.FastRecast = {}

    sets.midcast.Cure = {
		main="Bolelabunga",
    	sub="Sors Shield",
		range=empty,
		ammo="Quartz Tathlum +1",
        head=gear.Vanya.Head.B,
		body=gear.Relic.Body,
		hands="Kaykaus Cuffs +1",
		legs=gear.Artifact.Legs,
		feet=gear.Vanya.Feet.B,
		neck="Debilis Medallion",
		left_ear="Meili Earring",
		right_ear="Mendi. Earring",
		left_ring="Lebeche Ring",
		right_ring="Haoma's Ring",
        back="Oretan. Cape +1",
		waist="Luminary Sash",
		
	}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
	})
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
	})
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		--hands="Hieros Mittens",
		feet="Gende. Galosh. +1",
		back="Oretan. Cape +1",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		waist="Witful Belt",
	})
		
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {
		--main="Colada",
		main="Pukulatmuj +1",
		sub="Ammurapi Shield",
		range=empty,
		--ammo="Hasty Pinion +1",
		head="Umuthi Hat",
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs="Carmine Cuisses +1",
		feet=gear.Empyrean.Feet,
		neck="Dls. Torque +1",
		left_ear="Andoaa Earring",
		right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=gear.capes.Enhancing,
		waist="Embla Sash",
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
		main="Pukulatmuj +1",
		--head="Befouled Crown",
		--neck="Incanter's Torque",
		ear2="Mimir Earring",
		hands=gear.Relic.Hands,
		back="Ghostfyre Cape",
		--waist="Olympus Sash",
		legs=gear.Artifact.Legs,
	}
	sets.midcast.Refresh = {
		--head="Amalric Coif +1",
		body=gear.Artifact.Body,
		legs=gear.Empyrean.Legs,
	}
	sets.midcast['Refresh II'] = sets.midcast.Refresh
	sets.midcast['Refresh III'] = sets.midcast.Refresh
	--sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	--sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Enspell = sets.midcast.Temper
	--sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	--sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	--sets.midcast.Protect = {ring2="Sheltered Ring"}
	--sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {
		--main="Daybreak",
		sub="Ammurapi Shield",
		range=empty,
		ammo="Quartz Tathlum +1",
		head=gear.Relic.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Chironic Hose",
		feet=gear.Relic.Feet,
		neck="Dls. Torque +1",
		left_ear="Snotra Earring",
		right_ear="Lethargy Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Stikini Ring",
		back=gear.capes.MNDEnfeeble,
		waist="Luminary Sash",	
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
		--range="Kaja Bow",
		--body=gear.Artifact.Body,
		--legs="Psycloth Lappas",
	})
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Atrophy Tabard +3",
		--range="Kaja Bow"
	})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		ear1="Vor Earring",
		hands=gear.Empyrean.Hands,
		left_ring="Stikini Ring",
		legs="Psycloth Lappas",
	})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Diaga = sets.midcast.Dia
	sets.midcast['Dia II'] = sets.midcast.Dia
	sets.midcast['Dia III'] = sets.midcast.Dia
	
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
			
	sets.midcast.Impact = {}

	sets.midcast['Dark Magic'] = {
		main="Malevolence",
		sub="Ammurapi Shield",
		--range="Kaja Bow",
		ammo=empty,
		head="Pixie Hairpin +1",--amalric
		body=gear.Artifact.Body,
		hands=gear.Empyrean.Hands,
		legs="Psycloth Lappas",
		--feet=gear.merlinic_nuke_feet,
		neck="Erra Pendant",
		left_ear="Mani Earring",
		right_ear="Hermetic Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Stikini Ring",
		back=gear.capes.DRKMagic,
		waist="Luminary Sash",
	}

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {} )
		--main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
        --head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        --body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        --back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		--main="Daybreak",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		--head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		--body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back=gear.nuke_jse_back,waist="Sailfi Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet
	})

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {
		hands=gear.Empyrean.Hands,
	}

	sets.idle = {
		main="Bolelabunga",
		sub="Culminus",
		--ammo="Quartz Tathlum +1",
		head=gear.Relic.Head,
		body="Shamash Robe",--jhakri +2 for refresh +4
		hands=gear.Ayanmo.Hands,
		legs="Carmine Cuisses +1",
		feet=gear.Ayanmo.Feet,
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Gishdubar Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		left_ring="Defending Ring",
		right_ring="Archon Ring",
		back=gear.capes.MNDEnfeeble,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})
	sets.idle.Refresh = set_combine(sets.idle, {
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

function select_default_macro_book()
end