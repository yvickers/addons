function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Club' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Mpaca's Staff",
		sub="Khonsu",
	}

	gear.weapons['Club'] = {
		main="Maxentius",
		sub="Daybreak",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Myrkr', 'Black Halo' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
    state.AutoFightMode = M( true, "Auto Pet Fight" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = "Con. Doublet +3"
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Glypich Horn +3"
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Beckoner's Horn +2"
	gear.Empyrean.Body = "Beck. Doublet +1"
	gear.Empyrean.Hands = "Beck. Bracers +1"
	gear.Empyrean.Legs = "Beck. Spats +1"
	gear.Empyrean.Feet = "Beck. Pigaches +2"

	gear.capes = {}
	gear.capes.SMNSkill = "Conveyance Cape"
	gear.capes.PetMAB = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.capes.PetPhysical = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	gear.capes.MNDWS = { name="Campestres's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

end

function init_gear_sets()
	sets.TreasureHunter = {}

	sets.precast.JA['Astral Flow'] = {
		head=gear.Relic.Head
	}

	sets.precast.JA['Elemental Siphon'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe +1",
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
		feet=gear.Empyrean.Feet,
		neck="Incanter's Torque",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}

	sets.precast.JA['Mana Cede'] = {
		hands=gear.Empyrean.Hands
	}

	-- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe +1",
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
		feet=gear.Empyrean.Feet,
		neck="Incanter's Torque",
		left_ear="Evans Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

	sets.precast.FC = {
        main="Mpaca's Staff",
        sub="Khonsu",
        ammo="Impatiens",
        head="Amalric Coif +1",
        body="Inyanga Jubbah +2",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Regal Pumps +1",
        neck="Baetyl Pendant",
        waist="Witful Belt",
        left_ear="Malignance Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring +1",
        right_ring="Medada's Ring",
        back=gear.capes.PetMAB,
    }

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash"
    })

	sets.precast.FC['Impact'] = set_combine(sets.precast.FC, {
		head="",
        body="Crepuscular Cloak",
    })

	sets.precast.WS = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Epaminondas's Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back=gear.capes.MNDWS,
	}

	sets.precast.WS['Seraph Strike'] = set_combine(sets.precast.WS, {
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		right_ring="Weather. Ring +1",
	})

	sets.midcast.Cure = {
        main="Raetic Rod +1",
        sub="Sors Shield",
        ammo="Impatiens",
        head="Vanya Hood",
        body="Bunzi's Robe",
        hands="Vanya Cuffs",
        legs="Vanya Slops",
        feet="Vanya Clogs",
        neck="Nodens Gorget",
        waist="Witful Belt",
        --left_ear="Mendi. Earring",
        --right_ear="Meili Earring",
        left_ring="Menelaus's Ring",
        right_ring="Lebeche Ring",
        back="Solemnity Cape",
    }
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
        neck="Debilis Medallion",
        --hands="Hieros Mittens",
		back="Oretan. Cape +1",
        right_ring="Haoma's Ring",
        left_ring="Menelaus's Ring",
    })

	sets.midcast['Summoning Magic'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe +1",
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
		feet=gear.Empyrean.Feet,
		neck="Incanter's Torque",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}

	sets.midcast['Enfeebling Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Incanter's Torque",
		waist="Null Belt",
		left_ear="Malignance Earring",
		right_ear="Vor Earring",
		left_ring="Medada's Ring",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
	}

	sets.midcast['Impact'] = set_combine(sets.midcast['Enfeebling Magic'], {
		head="",
		body="Crepuscular Cloak",
	})

	sets.midcast['Enhancing Magic'] = {
		main={ name="Gada", augments={'Pet: Haste+2','Pet: Phys. dmg. taken -2%','"Fast Cast"+4','DMG:+5',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
	}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		--sub="Genmei Shield",
		head="Amalric Coif +1",
		--hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"
	})

	-- Avatar pact sets.  All pacts are Ability type.
                
    sets.midcast.Pet.PhysicalBloodPactRage = set_combine( sets.midcast.Pet.BloodPactWard, {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		body=gear.Artifact.Body,
		--hands=gear.merlinic_magpact_hands,
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
		neck="Smn. Collar +2",
		left_ear="Lugalbanda Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		waist="Incarnation Sash",
    	back=gear.capes.PetPhysical,
	} )

    sets.midcast.Pet.MagicalBloodPactRage = set_combine( sets.midcast.Pet.BloodPactWard, {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		body=gear.Artifact.Body,
		--hands=gear.merlinic_magpact_hands,
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
		neck="Smn. Collar +2",
		left_ear="Lugalbanda Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
        back=gear.capes.PetMAB,
		waist="Regal Belt",
	} )

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
    
	sets.midcast.Pet['Flaming Crush'] = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		body=gear.Artifact.Body,
		--hands=gear.merlinic_magpact_hands,
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
		neck="Smn. Collar +2",
		left_ear="Lugalbanda Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
        back=gear.capes.PetMAB,
		waist="Regal Belt",
	}
			
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})

	sets.midcast.Pet.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Baayami Hat +1",
        body="Baayami Robe +1",
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
		feet="Baaya. Sabots +1",
		neck="Incanter's Torque",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Kobo Obi",
	}

    sets.midcast.Pet.DebuffBloodPactWard = set_combine( sets.midcast.Pet.BloodPactWard, {
        head="C. Palug Crown",
		neck="Adad Amulet",
		left_ear="Lugalbanda Earring",
		right_ear="Enmerkar Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring2="C. Palug Ring",
        --back=gear.magic_jse_back,
		--waist="Incarnation Sash",
		--legs="Tali'ah Sera. +2",
		--feet="Convo. Pigaches +3"
	} )

	sets.latent_refresh = {
		head="Null Masque",
		left_ring=gear.rings['Stikini L'],
		right_ring=gear.rings['Stikini R'],
	}

	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Herald's Gaiters",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Moonlight Cape",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.idle.Avatar = set_combine(sets.idle, {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head=gear.Empyrean.Head,
		--hands={ name="Asteria Mitts +1", augments={'Path: A',}},
		--legs={ name="Assid. Pants +1", augments={'Path: A',}},
		feet=gear.Empyrean.Feet,
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back=gear.capes.PetPhysical,
	})
		
    sets.idle.Spirit = set_combine( sets.idle.Avatar, {
        head=gear.Artifact.Head,
        back="Conveyance Cape",
	})

	sets.engaged = {
		ammo="Oshasha's Treatise",
        head=gear.Empyrean.Head,
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet=gear.Empyrean.Feet,
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Telos Earring",
        right_ear="Digni. Earring",
        left_ring=gear.rings['Chririch L'],
        right_ring=gear.rings['Chririch R'],
        back="Null Shawl",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end