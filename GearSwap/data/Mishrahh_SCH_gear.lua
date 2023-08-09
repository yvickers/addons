--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]

function user_job_setup()

	gear.Artifact = {}
	gear.Artifact.Head = "Acad. Mortar. +3"
	gear.Artifact.Body = "Acad. Gown +2"
	gear.Artifact.Hands = "Acad. Bracers +2"
	gear.Artifact.Legs = "Acad. Pants +2"
	gear.Artifact.Feet = "Acad. Loafers +2"

	gear.Relic = {}
	gear.Relic.Head = "Peda. Mortar. +2"
	gear.Relic.Body = "Peda. Gown +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Arbatel Bonnet +2"
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = "Arbatel Bracers +2"
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.MAB = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

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
		--main=gear.grioavolr_fc_staff,
		--sub="Clerisy Strap +1",
		ammo="Impatiens",
		head=gear.Relic.Head,
		neck="Voltsurge Torque",
		ear1="Loquac. Earring",
		ear2="Malignance Earring",
		body="Agwu's Robe",
		hands=gear.Artifact.Hands,
		ring1="Prolix Ring",
		ring2="Weather. Ring +1",
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet=gear.Artifact.Feet,
    }
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    	--ear1="Malignance Earring"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    	--main="Serenity",
    	--sub="Clerisy Strap +1",
    	--body="Heka's Kalasiris"
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
    	head=empty,
    	--body="Twilight Cloak"
    })
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Genmei Shield"
	})

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    	main="Mpaca's Staff",
    	sub="Enki Strap",
    	neck="Mizu. Kubikazari",
    	ring1="Mujin Band",
    	ring2="Freke Ring",
    	head="Agwu's Cap",
    	body="Agwu's Robe",
    	hands="Amalric Gages +1",
    	legs="Agwu's Slops",
    	feet="Agwu's Pigaches",
	}
	
	-- Gear for specific elemental nukes.
	sets.element = {}
	sets.element.Dark = {
		head="Pixie Hairpin +1",
		ring2="Archon Ring"
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
		--ammo="Hasty Pinion +1",
		head="Vanya Hood",
		--neck="Incanter's Torque",
		--ear1="Meili Earring",
		ear2="Malignance Earring",
		--body="Kaykaus Bliaut",
		hands="Telchine Gloves",
		--ring1="Janniston Ring",
		ring2="Lebeche Ring",
		back="Fi Follet Cape +1",
		waist="Hachirin-no-obi",
		--legs="Chironic Hose",
		feet="Medium's Sabots"
	}

	sets.midcast.LightWeatherCure = set_combine( sets.midcast.Cure, {
		--main="Chatoyant Staff",
	} )

	sets.midcast.LightDayCure = set_combine( sets.midcast.Cure, {
	} )

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna = {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip",
		--ammo="Hasty Pinion +1",
		head="Vanya Hood",
		--neck="Debilis Medallion",
		--ear1="Meili Earring",
		--ear2="Malignance Earring",
		body=gear.Relic.Body,
		--hands="Hieros Mittens",
		--ring1="Haoma's Ring",
		--ring2="Menelaus's Ring",
		--back="Oretan. Cape +1",
		--waist="Witful Belt",
		legs=gear.Artifact.Legs,
		--feet="Vanya Clogs"
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip"
	})

	sets.midcast['Enhancing Magic'] = {
		--main=gear.gada_enhancing_club,
		sub="Ammurapi Shield",
		--ammo="Savant's Treatise",
		head="Telchine Cap",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		ear2="Gifted Earring",
		body=gear.Relic.Body,
		hands=gear.Empyrean.Hands,
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
    	main="Bolelabunga",
	    head=gear.Empyrean.Head,
	    body="Telchine Chas.",
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
		--main="Vadose Rod",
		sub="Genmei Shield",
		--head="Amalric Coif +1",
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		--legs="Shedir Seraweels"
	})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
    	feet=gear.Relic.Feet
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
		ammo="Ghastly Tathlum +1",
		head=gear.Artifact.Head,
        neck="Erra Pendant",
        ear1="Arbatel Earring +1",
        ear2="Malignance Earring",
		body=gear.Artifact.Body,
        hands=gear.Artifact.Hands,
        ring1="Metamor. Ring +1",
        ring2="Kishar Ring",
        back=gear.capes.MAB,
        waist="Acuity Belt +1",
        --waist="Luminary Sash",
        legs=gear.Artifact.Legs,
        feet=gear.Artifact.Feet
    }
	
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
        --ear2="Digni. Earring",
    })
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
    	--head="Amalric Coif +1",
    })
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
    	--head="Amalric Coif +1",
    })
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		--head="Amalric Coif +1",
	})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		--head="Amalric Coif +1",
	})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		head="",
		body="Cohort Cloak +1"
	})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
		--ring2="Stikini Ring +1",
	})

    sets.midcast['Dark Magic'] = {
    	main="Bunzi's Rod",
    	sub="Ammurapi Shield",
    	ammo="Ghastly Tathlum +1",
    	head="Pixie Hairpin +1",
        neck="Erra Pendant",
        ear1="Arbatel Earring +1",
        ear2="Malignance Earring",
        body=gear.Artifact.Body,
        hands=gear.Artifact.Hands,
        ring1="Freke Ring",
        ring2="Archon Ring",
        back=gear.capes.MAB,
        waist="Acuity Belt +1",
        legs=gear.Relic.Legs,
        feet="Agwu's Pigaches"
    }

    sets.midcast.Kaustra = set_combine(sets.midcast['Dark Magic'], {
        --neck="Saevus Pendant +1",
        --ear1="Crematio Earring",
        --body=gear.merlinic_nuke_body,
        hands="Amalric Gages +1",
        ring1="Freke Ring",
        --waist="Refoccilation Stone",
        --legs="Merlinic Shalwar",
        --feet=gear.merlinic_nuke_feet
    })
		
    sets.midcast.Kaustra.Resistant = set_combine(sets.midcast.Kaustra, {
    })

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    })
		
    sets.midcast.Drain.Resistant = set_combine(sets.midcast.Drain, {
    })

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
    	--main=gear.grioavolr_fc_staff,
    	--sub="Clerisy Strap +1",
    	--ammo="Hasty Pinion +1",
        head=gear.Artifact.Head,
        neck="Voltsurge Torque",
        ear1="Enchntr. Earring +1",
        ear2="Malignance Earring",
        body=gear.Artifact.Body,
        hands=gear.Artifact.Hands,
        ring1="Metamor. Ring +1",
        --ring2="Stikini Ring +1",
        back=gear.capes.MAB,
        waist="Witful Belt",
        legs=gear.Artifact.Legs,
        feet=gear.Relic.Feet,
    }

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {
    })

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
    	main="Bunzi's Rod",
    	sub="Ammurapi Shield",
    	ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        neck="Mizu. Kubikazari",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        body="Agwu's Robe",
        hands="Amalric Gages +1",
        ring1="Metamor. Ring +1",
        ring2="Freke Ring",
        back=gear.capes.MAB,
        waist="Hachirin-no-Obi",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches"
    }

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
    })
		
    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {
    })
		
    sets.midcast['Elemental Magic']['9k'] = set_combine(sets.midcast['Elemental Magic'], {
    })
		
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.precast.FC, {
    })
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'], {
    })
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
	})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant,{
	})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder,{
	})

	sets.midcast.Helix = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        neck="Mizu. Kubikazari",
        ear1="Crep. Earring",
        ear2="Malignance Earring",
        body="Agwu's Robe",
        hands="Amalric Gages +1",
        ring1="Metamor. Ring +1",
        ring2="Freke Ring",
        back=gear.capes.MAB,
        waist="Acuity Belt +1",
        legs="Agwu's Slops",
        feet="Amalric Nails +1"
    }
	
	sets.midcast.Helix.Resistant = set_combine(sets.midcast.Helix,{
	})
		
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
		--back=gear.capes.MAB,
		--waist="Acuity Belt +1",
		--legs="Merlinic Shalwar",
		--feet=gear.merlinic_nuke_feet
	}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {
    	head=empty,
    	body="Twilight Cloak"
    })
	
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
		feet=gear.Relic.Feet,
	}
	sets.buff['Alacrity'] = {
		feet=gear.Relic.Feet,
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
		sub="Genmei Shield",
		ammo="Crepuscular Pebble",
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Hachirin-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Solemnity Cape",
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
		--back=gear.capes.MAB,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {
		head="Befouled Crown",
		body="Jhakri Robe +2",
	}
end
