function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'HaloTime' }
	gear.weapons['Default'] = {
		main="Idris",
		sub="Ammurapi Shield",
		range="Dunna",
	}
	gear.weapons['HaloTime'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		range="Dunna",
	}
	gear.weapons['Omen'] = {
        main="Aern Dagger",
        sub="Aern Dagger II",
    }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Hexa Strike', 'Exudation', }

	gear.Artifact = {}
	gear.Artifact.Head = "Geo. Galero +3"
	gear.Artifact.Body = "Geomancy Tunic +3"
	gear.Artifact.Hands = "Geo. Mitaines +3"
	gear.Artifact.Legs = "Geomancy Pants +3"
	gear.Artifact.Feet = "Geo. Sandals +3"

	gear.Relic = {}
	gear.Relic.Head = "Bagua Galero +3"
	gear.Relic.Body = "Bagua Tunic +3"
	gear.Relic.Hands = "Bagua Mitaines +3"
	gear.Relic.Legs = "Bagua Pants +3"
	gear.Relic.Feet = "Bagua Sandals +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +3"
	gear.Empyrean.Body = "Azimuth Coat +3"
	gear.Empyrean.Hands = "Azimuth Gloves +3"
	gear.Empyrean.Legs = "Azimuth Tights +3"
	gear.Empyrean.Feet = "Azimuth Gaiters +3"

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -1%',}}
	gear.capes.DexTP = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Pet: "Regen"+10',}}
	gear.capes.MNDWS = { name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.capes.MAB = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

end

function init_gear_sets()
	sets.Empyrean = {
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	}

	sets.TreasureHunter = set_combine( gear.TH.Herc, {
    } )


	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {
		body=gear.Relic.Body,
	}
	sets.precast.JA['Life Cycle'] = {
		body=gear.Artifact.Body,
		back=gear.capes.PetRegen,
	}
	sets.precast.JA['Radial Arcana'] = {
		feet=gear.Relic.Feet,
	}
	sets.precast.JA['Mending Halation'] = {
		legs=gear.Relic.Legs,
	}
	sets.precast.JA['Full Circle'] = {
		head=gear.Empyrean.Head,
		--hands=gear.Relic.Hands
	}

	sets.precast.WS = {
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Malignance Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back=gear.capes.MNDWS,
	}

	sets.precast.WS['Seraph Strike'] = set_combine(sets.precast.WS,{
		ammo="Sroda Tathlum",
		neck="Rep. Plat. Medal",
		waist="Orpheus's Sash",
		left_ring="Weather. Ring +1",
	})

	sets.precast.WS['Exudation'] = set_combine(sets.precast.WS,{
		waist="Fotia Belt",
	})

	sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS['Exudation'],{})
	sets.precast.WS['Cyclone'] = set_combine(sets.engaged, sets.TreasureHunter,{})
	sets.precast.WS['Wasp Sting'] = set_combine(sets.engaged, {})
	sets.precast.WS['Gust Slash'] = set_combine(sets.engaged, {})

	sets.precast.FC = {
		range="Dunna",
		head="Merlinic Hood",
		body="Zendik Robe",
		hands="Agwu's Gages",
		legs=gear.Artifact.Legs,
		feet="Amalric Nails +1",
		neck="Baetyl Pendant",
    	waist="Embla Sash",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Weather. Ring +1",
    	right_ring="Medada's Ring",
		back=gear.capes.GeoSkill,
	}
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})

	sets.midcast.Geomancy = {
		range="Dunna",
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Empyrean.Feet,
		neck="Bagua Charm +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Vanya Hood",
		hands="Vanya Cuffs",
		legs="Vanya Slops",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Yngvi Choker",
		waist="Gishdubar Sash",
		--left_ear="Malignance Earring",
		--right_ear="Barkaro. Earring",
		left_ring="Weather. Ring +1",
		right_ring="Lebeche Ring",
	}
	sets.midcast.Curaga = set_combine( sets.midcast.Cure, {
	})
	sets.midcast.Cursna = set_combine( sets.midcast.Cure, {
		left_ring="Menelaus's Ring",
		--right_ring="Haoma's Ring",
	})
	sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Ea Hat +1",
		body=gear.Empyrean.Body,
	    hands="Agwu's Gages",
	    legs=gear.Empyrean.Legs,
	    feet="Agwu's Pigaches",
	    neck="Sibyl Scarf",
	    waist={ name="Acuity Belt +1", augments={'Path: A',}},
	    left_ear="Malignance Earring",
	    right_ear="Barkaro. Earring",
	    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",
	    back=gear.capes.MAB,
	}
	sets.midcast['Dark Magic'] = set_combine(sets.Empyrean,{
		main="Rubicundity",
		sub="Ammurapi Shield",
    	ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Pixie Hairpin +1",
		feet={ name="Agwu's Pigaches", augments={'Path: A',}},
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
	    right_ear="Barkaro. Earring",
		left_ring="Archon Ring",
    	right_ring="Evanescence Ring",
		back=gear.capes.MAB,
	})
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'],{})

	sets.midcast['Enfeebling Magic'] = set_combine(sets.Empyrean,{
		main="Daybreak",
		sub="Ammurapi Shield",
		neck="Null Loop",
		waist="Null Belt",
		back="Aurist's Cape +1",
		left_ear="Malignance Earring",
	    right_ear="Barkaro. Earring",
		left_ring="Kishar Ring",
    	right_ring="Stikini Ring +1",
	})
	sets.midcast.Dispel = set_combine(sets.midcast['Enfeebling Magic'],{})

	sets.midcast['Enhancing Magic'] = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Impatiens",
		head=gear.Telchine.Head.Enhancing,
		body=gear.Telchine.Body.Enhancing,
		hands=gear.Telchine.Hands.Enhancing,
		legs=gear.Telchine.Legs.Enhancing,
		feet=gear.Telchine.Feet.Enhancing,
		neck="Yngvi Choker",
		waist="Embla Sash",
		back="Fi Follet Cape +1",
		left_ring="Stikini Ring +1",
    	right_ring="Stikini Ring +1",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		waist="Siegel Sash",
		legs="Shedir Seraweels",
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		head="Amalric Coif +1",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels",
	})
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
		legs="Shedir Seraweels"
	})

	sets.idle = {
		head="Null Masque",
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Nyame Flanchard",
		feet=gear.Artifact.Feet,
		neck="Null Loop",
		left_ear="Eabani Earring",
		right_ear="Alabaster Earring",
		left_ring="Murky Ring",
		right_ring="Warp Ring",
		back="Moonlight Cape",
		waist="Carrier's Sash",
	}
	sets.idle.PDT = set_combine( sets.idle, {
		--main="Mafic Cudgel",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head=gear.Empyrean.Head,
		hands=gear.Artifact.Hands,
		legs="Psycloth Lappas",
		feet=gear.Relic.Feet,
		neck="Bagua Charm +1",
		waist="Isa Belt",
		--left_ear="Enchntr. Earring +1",
		--right_ear="Loquac Earring",
		--left_ring="Vertigo Ring",
		--right_ring="Warp Ring",
		back=gear.capes.PetRegen,
	})
	sets.idle.PDT.Pet = set_combine( sets.idle.Pet, {
		--main="Mafic Cudgel",
	})

	sets.latent_refresh = {
	}

	sets.engaged = {
		ammo="Oshasha's Treatise",
		head="Blistering Sallet +1",
		body="Nyame Mail",
		hands="Gazu Bracelets +1",
		legs=gear.Jhakri.Legs,
		feet="Nyame Sollerets",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring=gear.rings['Chririch L'],
		right_ring=gear.rings['Chririch R'],
		back="Null Shawl",
	}
	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Null Masque",
		feet=gear.Empyrean.Feet,
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end