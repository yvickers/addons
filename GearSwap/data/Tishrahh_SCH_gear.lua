function user_job_setup()
    gear.Artifact = {}
	gear.Artifact.Head = "Acad. Mortar. +3"
	gear.Artifact.Body = "Acad. Gown +3"
	gear.Artifact.Hands = "Acad. Bracers +1"
	gear.Artifact.Legs = "Acad. Pants +1"
	gear.Artifact.Feet = "Acad. Loafers +1"

	gear.Relic = {}
	gear.Relic.Head = "Peda. M.Board +1"
	gear.Relic.Body = "Peda. Gown +1"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Peda. Pants +1"
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Arbatel Bonnet +3"
	gear.Empyrean.Body = "Arbatel Gown +3"
	gear.Empyrean.Hands = "Arbatel Bracers +3"
	gear.Empyrean.Legs = "Arbatel Pants +3"
	gear.Empyrean.Feet = "Arbatel Loafers +3"

	gear.capes = {}
    gear.capes.MAB = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
end

function init_gear_sets()
	-- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {
    	legs=gear.Relic.Legs,
    }
	sets.precast.JA['Enlightenment'] = {
		body=gear.Relic.Body
	}

    -- Fast cast sets for spells

    sets.precast.FC = {
		main={ name="Gada", augments={'Attack+15','"Fast Cast"+5','Pet: "Mag.Atk.Bns."+24','DMG:+16',}},
        sub="Chanter's Shield",
        ammo="Impatiens",
        head=gear.Artifact.Head,
        body="Merlinic Jubbah",
        hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
        legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        feet="Regal Pumps +1",
        neck="Voltsurge Torque",
        waist="Embla Sash",
        left_ear="Enchntr. Earring +1",
        right_ear="Malignance Earring",
        left_ring="Medada's Ring",
        right_ring="Weather. Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		--waist="Siegel Sash"
	})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
    	--head=empty,
    	--body="Twilight Cloak"
    })
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    	--main="Mpaca's Staff",
    	--sub="Enki Strap",
    	--neck="Mizu. Kubikazari",
    	--ring1="Mujin Band",
    	--ring2="Freke Ring",
    	--head="Agwu's Cap",
    	--body="Agwu's Robe",
    	--hands="Amalric Gages +1",
    	--legs="Agwu's Slops",
    	--feet="Agwu's Pigaches",
	}
	
	-- Gear for specific elemental nukes.
	sets.element = {}
	sets.element.Dark = {
		--head="Pixie Hairpin +1",
		--ring2="Archon Ring"
	}

    sets.midcast.FastRecast = set_combine( sets.precast.FC, {
    	--main=gear.grioavolr_fc_staff,
    	--sub="Clerisy Strap +1",
    	--ammo="Hasty Pinion +1",
    	--head="Amalric Coif +1",
	} )
		
	sets.midcast.Cure = {
		main="Daybreak",
        sub="Sors Shield",
        ammo="Impatiens",
        head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        neck="Voltsurge Torque",
        waist="Luminary Sash",
        left_ear="Mendi. Earring",
        right_ear="Meili Earring",
        left_ring="Lebeche Ring",
        right_ring="Menelaus's Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}

	sets.midcast.LightWeatherCure = set_combine( sets.midcast.Cure, {
		--main="Chatoyant Staff",
	} )

	sets.midcast.LightDayCure = set_combine( sets.midcast.Cure, {
	} )

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna = {
		main={ name="Gada", augments={'Attack+15','"Fast Cast"+5','Pet: "Mag.Atk.Bns."+24','DMG:+16',}},
        sub="Culminus",
        ammo="Impatiens",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body=gear.Relic.Body,
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs=gear.Artifact.Legs,
        feet="Gende. Galosh. +1",
        neck="Debilis Medallion",
        waist="Bishop's Sash",
        left_ear="Malignance Earring",
        right_ear="Meili Earring",
        left_ring="Haoma's Ring",
        right_ring="Menelaus's Ring",
        back="Oretan. Cape +1",
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip"
	})

	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Impatiens",
		head=gear.Telchine.Head.Enhancing,
		neck="Reti Pendant",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
		body=gear.Relic.Body,
		hands=gear.Empyrean.Hands,
		left_ring={name = "Stikini Ring +1", bag = "wardrobe1"},
		right_ring={name = "Stikini Ring +1", bag = "wardrobe4"},
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		legs=gear.Telchine.Legs.Enhancing,
		feet=gear.Telchine.Feet.Enhancing,
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
    	main="Bolelabunga",
	    head=gear.Empyrean.Head,
	    body=gear.Telchine.Body.Enhancing,
	    back=gear.capes.MAB,
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    	neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		waist="Siegel Sash",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		--head="Amalric Coif +1"
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		--sub="Genmei Shield",
		--head="Amalric Coif +1",
		--hands="Regal Cuffs",
		waist="Emphatikos Rope",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		--legs="Shedir Seraweels"
	})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
    	--feet=gear.Relic.Feet
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
    	---ring2="Sheltered Ring"
	})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
    	--ring2="Sheltered Ring"
    })
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Quartz Tathlum +1",
		head=gear.Artifact.Head,
        neck="Erra Pendant",
        ear1="Vor Earring",
        ear2="Malignance Earring",
		body=gear.Artifact.Body,
        hands="Kaykaus Cuffs +1",
        left_ring={name = "Stikini Ring +1", bag = "wardrobe1"},
		right_ring={name = "Stikini Ring +1", bag = "wardrobe4"},
        back="Aurist's Cape +1",
        waist="Acuity Belt +1",
        legs=gear.Empyrean.Legs,
        feet=gear.Artifact.Feet
    }
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
    	--head="Amalric Coif +1",
    })
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		--head="Amalric Coif +1",
	})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		--head="",
		--body="Cohort Cloak +1"
	})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
		--ring2="Stikini Ring +1",
	})

    sets.midcast['Dark Magic'] = {
    	main="Maxentius",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Hecate's Earring",
        left_ring="Medada's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MAB,
    }

    sets.midcast.Kaustra = set_combine(sets.midcast['Dark Magic'], {
        --neck="Saevus Pendant +1",
        --ear1="Crematio Earring",
        --body=gear.merlinic_nuke_body,
        --hands="Amalric Gages +1",
        --ring1="Freke Ring",
        --waist="Refoccilation Stone",
        --legs="Merlinic Shalwar",
        --feet=gear.merlinic_nuke_feet
    })
		

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    })
		
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
    	main="Maxentius",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Hecate's Earring",
        left_ring="Medada's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MAB,
    }

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
    	main="Maxentius",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Hecate's Earring",
        left_ring="Medada's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MAB,
    }
		
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.precast.FC, {
    })
		
	sets.midcast.Helix = {
		main="Maxentius",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Hecate's Earring",
        left_ring="Medada's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MAB,
    }
		
	sets.midcast.Helix.Proc = set_combine(sets.precast.FC,{
	})

	sets.midcast.Impact = {
		--main="Daybreak",
		--sub="Ammurapi Shield",
		--ammo="Pemphredo Tathlum",
		--head=empty,
		--neck="Erra Pendant",
		--ear1="Regal Earring",
		--ear2="Malignance Earring",
		--body="Twilight Cloak",
		--hands="Acad. Bracers +3",
		--ring1="Metamor. Ring +1",
		--ring2="Stikini Ring +1",
		back=gear.capes.MAB,
		--waist="Acuity Belt +1",
		--legs="Merlinic Shalwar",
		--feet=gear.merlinic_nuke_feet
	}
	
	sets.buff['Ebullience'] = {
		head=gear.Empyrean.Head,
	}
	sets.buff['Rapture'] = {
		head=gear.Empyrean.Head,
	}
	sets.buff['Perpetuance'] = {
		hands=gear.Empyrean.Hands,
	}
	sets.buff['Immanence'] = {
		hands=gear.Empyrean.Hands,
	}
	sets.buff['Penury'] = {
		legs=gear.Empyrean.Legs,
	}
	sets.buff['Parsimony'] = {
		legs=gear.Empyrean.Legs,
	}
	sets.buff['Celerity'] = {
		--feet=gear.Relic.Feet,
	}
	sets.buff['Alacrity'] = {
		--feet=gear.Relic.Feet,
	}
	sets.buff['Klimaform'] = {
		feet=gear.Empyrean.Feet,
	}

	sets.buff.Doom = set_combine(sets.AutoBuff.Doom, {})
	sets.buff['Light Arts'] = {
		legs=gear.Artifact.Legs,
	}
	sets.buff['Dark Arts'] = {
		body=gear.Artifact.Body,
	}

    sets.buff.Sublimation = {
    	head=gear.Artifact.Head,
    	body=gear.Relic.Body,
    	--left_ear="Savant's Earring",
    	waist="Embla Sash",
    }
    sets.buff.DTSublimation = {
    	waist="Embla Sash"
    }

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
		--ammo="Staunch Tathlum",
		--head="Pixie Hairpin +1",
		--neck="Sanctity Necklace",
		--ear1="Evans Earring",
		--ear2="Etiolation Earring",
		--body="Amalric Doublet",
		--hands="Regal Cuffs",
		--ring1="Mephitas's Ring +1",
		--ring2="Mephitas's Ring",
		--back="Aurist's Cape +1",
		--waist="Yamabuki-no-Obi",
		--legs="Psycloth Lappas",
		--feet="Medium's Sabots"
	}

	sets.resting = {
		--main="Chatoyant Staff",
		--sub="Oneiros Grip",
		--ammo="Homiliary",
		--head="Befouled Crown",
		--neck="Chrys. Torque",
		--ear1="Etiolation Earring",
		--ear2="Ethereal Earring",
		--body="Amalric Doublet",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Defending Ring",
		--ring2="Dark Ring",
		--back="Umbra Cape",
		--waist="Fucho-no-obi",
		--legs="Assid. Pants +1",
		--feet=gear.chironic_refresh_feet
	}

	sets.idle = {
		main="Daybreak",
        sub="Culminus",
        ammo="Homiliary",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs=gear.Empyrean.Legs,
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring={name = "Stikini Ring +1", bag = "wardrobe1"},
        right_ring="Warp Ring",
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
		back=gear.capes.MAB,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {
		--head="Befouled Crown",
		--body="Jhakri Robe +2",
	}
end