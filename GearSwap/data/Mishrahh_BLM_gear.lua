function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Refresh', 'Club', }
	gear.weapons = {}
	gear.weapons['Default'] = {
        main="Mpaca's Staff",
        sub="Khonsu",
    }
    gear.weapons['Refresh'] = {
        main="Mpaca's Staff",
        sub="Khonsu",
    }
    gear.weapons['Club'] = {
        main="Maxentius",
        sub="Ammurapi Shield",
    }
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Cataclysm', 'Black Halo', }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = "Spaekona's Coat +3"
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
	gear.Empyrean.Head = "Wicce Petasos +1"
	gear.Empyrean.Body = "Wicce Coat +3"
	gear.Empyrean.Hands = "Wicce Gloves +1"
	gear.Empyrean.Legs = "Wicce Chausses +3"
	gear.Empyrean.Feet = "Wicce Sabots +3"

	gear.capes = {}
	gear.capes.Nuke = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    gear.capes.FastCast = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
    gear.capes.MNDWS = { name="Taranus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
end

function init_gear_sets()
    sets.TreasureHunter = {}

	sets.precast.JA['Manafont'] = {
        body=gear.Relic.Body,
    }
    sets.precast.JA['Elemental Seal'] = {}
    sets.precast.JA['Mana Wall'] = {
        feet=gear.Empyrean.Feet,
    }
    sets.AutoBuff['Mana Wall'] = {
        feet=gear.Empyrean.Feet,
    }
    sets.precast.JA['Cascade'] = {}
    sets.precast.JA['Enmity Douse'] = {}
    sets.precast.JA['Manawell'] = {}
    sets.precast.JA['Subtle Sorcery'] = {}

	sets.precast.FC = {
        main="Mpaca's Staff",
        sub="Khonsu",
        ammo="Impatiens",
        head="Merlinic Hood",
        body="Zendik Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Amalric Nails +1",
        neck="Baetyl Pendant",
        waist="Witful Belt",
        left_ear="Barkaro. Earring",
        right_ear="Malignance Earring",
        left_ring="Medada's Ring",
        right_ring="Weather. Ring +1",
        back=gear.capes.FastCast,    
    }
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty,
		body="Crepuscular Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Ammurapi Shield"
	})

	sets.precast.WS = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Grunfeld Rope",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MNDWS,
    }
    sets.precast.WS.Buffed = set_combine(sets.precast.WS,{})

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
        waist="Fotia Belt",
    })

    sets.midcast.FastRecast = {}
    sets.midcast.Cure = {
        main="Raetic Rod +1",
		sub="Sors Shield",
		range="Impatiens",
		head="Vanya Hood",
		hands="Vanya Cuffs",
		legs="Vanya Slops",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Nodens Gorget",
		waist="Witful Belt",
		left_ear="Magnetic Earring",
		right_ear="Gifted Earring",
		left_ring="Weather. Ring +1",
		right_ring="Lebeche Ring",
        back="Solemnity Cape",
    }
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {})
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Enfeebling Magic'] = {
        main="Mpaca's Staff",
        sub="Khonsu",
        ammo="Ghastly Tathlum +1",
        body="Cohort Cloak +1",
        hands="Agwu's Gages",
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Src. Stole +2",
        waist="Acuity Belt +1",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Metamor. Ring +1",
        back="Aurist's Cape +1",
    }
    sets.midcast['Elemental Magic'] = {
        main="Mpaca's Staff",
        sub="Enki Strap",
        ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Src. Stole +2",
        waist="Acuity Belt +1",
        left_ear="Barkaro. Earring",
        right_ear="Malignance Earring",
        left_ring="Medada's Ring",
        right_ring="Metamor. Ring +1",
        back=gear.capes.Nuke,
    }
    sets.midcast['Elemental Magic'].Proc = {}
    sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        head="Ea Hat +1",
        hands="Amalric Gages +1",
    })
    sets.midcast['Elemental Magic'].Recover = set_combine(sets.midcast['Elemental Magic'].MagicBurst, {
        body=gear.Artifact.Body,
    })
    sets.midcast.Impact = {
        ammo="Pemphredo Tathlum",
        head=empty,
		body="Crepuscular Cloak",
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Src. Stole +2",
        waist="Acuity Belt +1",
        left_ear="Ilmr Earring",
        right_ear="Malignance Earring",
        left_ring=gear.rings['Stikini L'],
        right_ring=gear.rings['Stikini R'],
        back="Aurist's Cape +1",
    }
    sets.midcast['Dark Magic'] = {
        main="Rubicundity",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        body=gear.Empyrean.Body,
        hands="Amalric Gages +1",
        legs=gear.Empyrean.Legs,
        feet="Agwu's Pigaches",
        neck="Erra Pendant",
        waist="Acuity Belt +1",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Evanescence Ring",
        right_ring="Archon Ring",
        back="Aurist's Cape +1",
    }

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Herald's Gaiters",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Eabani Earring",
        left_ring="Warp Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }
    sets.idle.Regen = set_combine(sets.idle,{})
    sets.idle.Refresh = set_combine(sets.idle,{
        body=gear.Empyrean.Body,
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
    })

    sets.engaged = {
        ammo="Oshasha's Treatise",
        head="Null Masque",
        body="Nyame Mail",
        hands="Gazu Bracelets +1",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring=gear.rings['Chririch L'],
        right_ring=gear.rings['Chririch R'],
        back="Null Shawl",
    }
    sets.engaged.PDT = set_combine(sets.engaged,{})

end