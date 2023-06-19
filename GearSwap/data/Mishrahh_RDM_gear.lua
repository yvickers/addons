function user_job_setup()
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Evisceration', }

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'Dagger', }
    gear.weapons = {}
    --match key to state.weapons options
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Thibron",
    }
    gear.weapons['Dagger'] = {
        main="Tauret",
        sub="Gleti's Knife",
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
	gear.capes.MNDEnfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.capes.FC = gear.capes.MNDEnfeeble
	gear.capes.INTEnfeeble = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	gear.capes.DRKMagic = gear.capes.INTEnfeeble
	gear.capes.DexTP = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.capes.MagicMndWS = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	gear.capes.MagicMndWS = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
	gear.capes.StrWS =  { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

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
		body=gear.Relic.Body,
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
		right_ear="Lethargy Earring +2",
		left_ring="Kishar Ring",
		right_ring="Weather. Ring",
		back=gear.capes.FC,
	}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		--head=empty,
		--body="Twilight Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Ammurapi Shield",
	})

	sets.precast.WS = {
		ammo="Coiste Bodhar",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Sroda Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}

    sets.precast.WS['Evisceration'] = {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Ayanmo Corazza +2",
        hands="Malignance Gloves",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Malignance Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear="Sherida Earring",
        left_ring="Begrudging Ring",
        right_ring="Ilabrat Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

	sets.precast.MagicWS = {
		ammo="Sroda Tathlum",
		head=gear.Empyrean.Head,
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands=gear.Empyrean.Hands,
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet=gear.Empyrean.Feet,
		neck="Eddy Necklace",
		waist="Eschan Stone",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear="Malignance Earring",
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back=gear.capes.MagicMndWS,
	}

	sets.precast.WS['Seraph Blade'] = set_combine( sets.precast.MagicWS, {

	} )
	sets.precast.WS['Seraph Strike'] = set_combine( sets.precast.MagicWS, {

	} )
	sets.precast.WS['Sanguine Blade'] = set_combine( sets.precast.MagicWS, {
		hands=gear.Jhakri.Hands,
		legs=gear.Empyrean.Legs,
		left_ear="Friomisi Earring",
		left_ring="Archon Ring",
	} )
	sets.precast.WS['Aeolian Edge'] = set_combine( sets.precast.MagicWS, {
		neck="Sibyl Scarf",
		hands=gear.Jhakri.Hands,
		legs=gear.Empyrean.Legs,
		back=gear.capes.MagicIntWS,
	} )

	sets.midcast.FastRecast = {}

    sets.midcast.Cure = {
		main="Daybreak",
    	sub="Sors Shield",
		range=empty,
		ammo="Quartz Tathlum +1",
        --head=gear.Vanya.Head.B,
		body=gear.Relic.Body,
		hands="Kaykaus Cuffs +1",
		legs=gear.Artifact.Legs,
		--feet=gear.Vanya.Feet.B,
		neck="Debilis Medallion",
		left_ear="Meili Earring",
		right_ear="Mendi. Earring",
		left_ring="Lebeche Ring",
		right_ring="Menelaus's Ring",
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
		right_ring="Menelaus's Ring",
		waist="Witful Belt",
	})
		
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {
		--main="Colada",
		main="Pukulatmuj +1",
		sub="Ammurapi Shield",
		range=empty,
		--ammo="Hasty Pinion +1",
		ammo="Impatiens",
		head="Umuthi Hat",
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs="Carmine Cuisses +1",
		feet=gear.Empyrean.Feet,
		neck="Dls. Torque +1",
		left_ear="Andoaa Earring",
		right_ear="Lethargy Earring +2",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
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
		head="Amalric Coif +1",
		body=gear.Artifact.Body,
		legs=gear.Empyrean.Legs,
	}
	sets.midcast['Refresh II'] = sets.midcast.Refresh
	sets.midcast['Refresh III'] = sets.midcast.Refresh

	sets.midcast['Haste'] = {
		--head=gear.Telchine.Head.Enhancing,
		body=gear.Relic.Body,
		--legs=gear.Telchine.Legs.Enhancing,
	}
	sets.midcast['Haste II'] = sets.midcast.Haste

	--sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	--sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Enspell = sets.midcast.Temper
	--sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Stoneskin = {
		neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		waist="Siegel Sash",
		--legs="Shedir Seraweels"
	}
	--sets.midcast.Protect = {ring2="Sheltered Ring"}
	--sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range="Ullr",
		--ammo="Quartz Tathlum +1",
		head=gear.Relic.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Chironic Hose",
		feet=gear.Relic.Feet,
		neck="Dls. Torque +1",
		left_ear="Snotra Earring",
		right_ear="Lethargy Earring +2",
		left_ring="Metamor. Ring +1",
		right_ring="Kishar Ring",
		back=gear.capes.MNDEnfeeble,
		waist="Luminary Sash",	
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
		--range="Kaja Bow",
		--body=gear.Artifact.Body,
		--legs="Psycloth Lappas",
	})
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		body=gear.Artifact.Body,
		--range="Kaja Bow"
	})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1",})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1",back=gear.capes.INTEnfeeble,})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		ear1="Vor Earring",
		hands=gear.Empyrean.Hands,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
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
		right_ring="Stikini Ring +1",
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
		--body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1 +1",
		--back=gear.nuke_jse_back,waist="Sailfi Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet
	})

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {
		hands=gear.Empyrean.Hands,
	}

	sets.idle = {
		ammo="Homiliary",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Ilabrat Ring",
        back="Solemnity Cape",
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
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Bunzi's Hat",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Ilabrat Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
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