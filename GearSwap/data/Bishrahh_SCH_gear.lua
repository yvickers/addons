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
	gear.Artifact.Head = "Acad. Mortar. +2"
	gear.Artifact.Body = "Acad. Gown +1"
	gear.Artifact.Hands = "Acad. Bracers +2"
	gear.Artifact.Legs = "Acad. Pants +2"
	gear.Artifact.Feet = "Acad. Loafers +2"

	gear.Relic = {}
	gear.Relic.Head = "Peda. M.Board +3"
	gear.Relic.Body = "Peda. Gown +3"
	gear.Relic.Hands = "Peda. Bracers +3"
	gear.Relic.Legs = "Peda. Pants +3"
	gear.Relic.Feet = "Peda. Loafers +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Arbatel Bonnet +3"
	gear.Empyrean.Body = "Arbatel Gown +3"
	gear.Empyrean.Hands = "Arbatel Bracers +3"
	gear.Empyrean.Legs = "Arbatel Pants +3"
	gear.Empyrean.Feet = "Arbatel Loafers +3"

	gear.capes = {}
	gear.capes.MAB = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.capes.IDLE = { name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}}
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
		main="Musa",
		ammo="Impatiens",
		head="Amalric Coif +1",
		body="Jhakri Robe +2",
		hands=gear.Artifact.Hands,
		legs="Jhakri Slops +2",
		feet=gear.Relic.Feet,
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Loquac. Earring",
		right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
		left_ring="Weather. Ring",
		right_ring="Lebeche Ring",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
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
		--main="Daybreak",
		--sub="Genmei Shield"
	})

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    	main="Mpaca's Staff",
    	sub="Enki Strap",
    	neck="Argute Stole +2",
    	ring1="Mujin Band",
    	ring2="Freke Ring",
    	head="Agwu's Cap",
    	body="Agwu's Robe",
    	hands="Amalric Gages +1",
    	legs="Agwu's Slops",
    	feet="Agwu's Pigaches",
	}

	sets.SIRD = {}
	
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
		main="Musa",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands=gear.Relic.Hands,
		legs=gear.Artifact.Legs,
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Null Loop",
		waist="Embla Sash",
		left_ring="Haoma's Ring",
		right_ring="Lebeche Ring",
		back="Solemnity Cape",
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
		--body=gear.Relic.Body,
		--hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Oretan. Cape +1",
		waist="Witful Belt",
		legs=gear.Artifact.Legs,
		feet="Vanya Clogs",
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip"
	})

	sets.midcast['Enhancing Magic'] = {
		main="Musa",
		ammo="Impatiens",
		head=gear.Telchine.Head.Duration,
		body=gear.Relic.Body,
		hands=gear.Telchine.Hands.Duration,
		legs=gear.Telchine.Legs.Duration,
		feet=gear.Telchine.Feet.Duration,
		neck="Null Loop",
		waist="Embla Sash",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	    head=gear.Empyrean.Head,
	    body=gear.Telchine.Body.Duration,
	    back=gear.capes.IDLE,
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    	--neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		--waist="Siegel Sash",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		--sub="Genmei Shield",
		head="Amalric Coif +1",
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"
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
		main="Mpaca's Staff",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Null Loop",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Digni. Earring",
		right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
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
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Banish'] = {
		main="Mpaca's Staff",
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Friomisi Earring",
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
	}
	sets.midcast['Banish II'] = sets.midcast['Banish']

    sets.midcast['Dark Magic'] = {
    	main="Mpaca's Staff",
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Hermetic Earring",
		right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.Kaustra = set_combine(sets.midcast['Dark Magic'], {
        --neck="Saevus Pendant +1",
        --ear1="Crematio Earring",
        --body=gear.merlinic_nuke_body,
       -- hands="Amalric Gages +1",
        --ring1="Freke Ring",
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
    	main="Mpaca's Staff",
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Hermetic Earring",
		right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

		
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.precast.FC, {
    })
		

	sets.midcast.Helix = {
		main="Mpaca's Staff",
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Hermetic Earring",
		right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
		left_ring="Weather. Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

	--subtle blow + fast cast for immmanence
	sets.midcast['Geohelix'] = set_combine(sets.precast.FC,{
		main="Vadose Rod",
		left_ear="Digni. Earring",--5
	})
	sets.midcast['Hydrohelix'] = sets.midcast['Geohelix']
	sets.midcast['Anemohelix'] = sets.midcast['Geohelix']
	sets.midcast['Pyrohelix'] = sets.midcast['Geohelix']
	sets.midcast['Cryohelix'] = sets.midcast['Geohelix']
	sets.midcast['Ionohelix'] = sets.midcast['Geohelix']
	sets.midcast['Noctohelix'] = sets.midcast['Geohelix']
	sets.midcast['Luminohelix'] = sets.midcast['Geohelix']
	sets.midcast['Stone'] = sets.midcast['Geohelix']
	sets.midcast['Water'] = sets.midcast['Geohelix']
	sets.midcast['Blizzard'] = sets.midcast['Geohelix']
	sets.midcast['Aero'] = sets.midcast['Geohelix']
	sets.midcast['Fire'] = sets.midcast['Geohelix']
	sets.midcast['Thunder'] = sets.midcast['Geohelix']
	

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
	
	sets.buff['Ebullience'] = {
		head=gear.Empyrean.Head,
	}
	sets.buff['Rapture'] = {
		head=gear.Empyrean.Head,
	}
	sets.buff['Perpetuance'] = {
		hands=gear.Empyrean.Hands,
	}
	sets.buff['Immanence'] = set_combine( sets.precast.FC, {
		main="Vadose Rod",
	})
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
		main="Mpaca's Staff",
		sub="Enki Strap",
		ammo="Staunch Tathlum +1",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Nyame Gauntlets",
		legs="Arbatel Pants +3",
		feet="Herald's Gaiters",
		neck="Bathy Choker +1",
		waist="Fucho-no-Obi",
		left_ear="Eabani Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
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

	sets.latent_refresh = {}
end
