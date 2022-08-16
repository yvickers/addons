function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Flat Blade', 'Burning Blade', }
	gear.weapons['Default'] = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
	}

	gear.Artifact = {}
	gear.Artifact.Head = "Brioso Roundlet +3"
	gear.Artifact.Body = "Brioso Justau. +2"
	gear.Artifact.Hands = "Brioso Cuffs +2"
	gear.Artifact.Legs = "Brioso Cannions +2"
	gear.Artifact.Feet = "Brioso Slippers +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bihu Jstcorps. +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Fili Calot +1"
	gear.Empyrean.Body = "Fili Hongreline +1"
	gear.Empyrean.Hands = "Fili Manchettes +1"
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = "Fili Cothurnes +1"

	gear.capes = {}

end

function init_gear_sets()
	sets.precast.FC = {
		body=gear.Inyanga.Body,
	    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    legs=gear.Ayanmo.Legs,
	    neck="Voltsurge Torque",
	    waist="Embla Sash",
	    left_ear="Loquac. Earring",
	    right_ear="Enchntr. Earring +1",
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
	})
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		head=gear.Empyrean.Head,
	    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','Song spellcasting time -4%',}},
	    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','Song spellcasting time -7%','MP+43',}},
	} )

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
		body=gear.Relic.Body,
		hands=gear.Jhakri.Hands,
		--legs="Ken. Hakama +1",
		--feet="Ken. Sune-Ate +1",
		--neck="Mnk. Nodowa +1",
		waist="Sailfi Belt +1",
		--left_ear="Sherida Earring",
		--right_ear="Moonshade Earring",
		--left_ring="Epona's Ring",
		--right_ring="Rajas Ring",
		--back=gear.capes.StrDA,
	}

	sets.midcast.FastRecast = {}

	-- General Song sets --
	sets.midcast.SongEffect = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnbw. Whistle +1",
	}

	sets.midcast.SongDebuff = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		head=gear.Artifact.Head,
		body=gear.Artifact.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Artifact.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		left_ear="Hermetic Earring",
		right_ear="Crep. Earring",
	}

	-- Dummy Song Instruments --
	sets.midcast.DummySong = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Daurdabla",
		--swap in items that don't extend duration to prevent overwriting with lag
		head=gear.Ayanmo.Head,
		body=gear.Ayanmo.Body,
		hands=gear.Ayanmo.Hands,
		legs=gear.Ayanmo.Legs,
		feet=gear.Ayanmo.Feet,
		neck="Sanctity Necklace",
	}
	sets.midcast['Warding Round'] = sets.midcast.DummySong
	sets.midcast['Gold Capriccio'] = sets.midcast.DummySong
	sets.midcast["Puppet's Operetta"] = sets.midcast.DummySong
	sets.midcast["Scop's Operetta"] = sets.midcast.DummySong
	sets.midcast['Shining Fantasia'] = sets.midcast.DummySong
	sets.midcast['Herb Pastoral'] = sets.midcast.DummySong
	sets.midcast['Fowl Aubade'] = sets.midcast.DummySong
	sets.midcast['Valor Minuet'] = sets.midcast.DummySong
	sets.midcast["Knight's Minne"] = sets.midcast.DummySong
	sets.midcast["Army's Paeon"] = sets.midcast.DummySong

	-- Song specific sets --
	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {
		range="Daurdabla",
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
	}
	sets.midcast.Lullaby.Resistant = set_combine(sets.midcast.Lullaby,{})
	sets.midcast['Horde Lullaby'] = set_combine(sets.midcast.Lullaby,{})
	sets.midcast['Horde Lullaby'].Resistant = set_combine(sets.midcast.Lullaby.Resistant,{})
	sets.midcast['Horde Lullaby'].AoE = set_combine(sets.midcast.Lullaby,{})
	sets.midcast['Horde Lullaby II'] = set_combine(sets.midcast.Lullaby,{})
	sets.midcast['Horde Lullaby II'].Resistant = set_combine(sets.midcast.Lullaby.Resistant,{})
	sets.midcast['Horde Lullaby II'].AoE = set_combine(sets.midcast.Lullaby,{})
	sets.midcast.Madrigal = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast.Prelude = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{})
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}

	sets.midcast.Cure = {
		main="Mafic Cudgel",
		sub="Culminus",
		head=gear.Vanya.Head.B,
		body=gear.Vanya.Body.B,
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		legs="Inyanga Shalwar +2",
		feet=gear.Vanya.Feet.B,
		neck="Reti Pendant",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear="Meili Earring",
		left_ring="Ayanmo Ring",
		right_ring="Inyanga Ring",
		back="Oretan. Cape +1",
	}
	sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Stoneskin = {}
	sets.midcast.Cursna = {
		hands="Inyan. Dastanas +2",
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
		waist="Gishdubar Sash",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		back="Oretan. Cape +1",
	}

	sets.idle = {
		range="Linos",
		head=gear.Inyanga.Head,
		body=gear.Inyanga.Body,
		hands=gear.Ayanmo.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Empyrean.Feet,
		neck="Loricate Torque +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		left_ring="Ayanmo Ring",
		right_ring="Inyanga Ring",
		--back=gear.capes.DexTP,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		main="Naegling",
		head=gear.Ayanmo.Head,
		body=gear.Ayanmo.Body,
		hands=gear.Ayanmo.Hands,
		legs=gear.Ayanmo.Legs,
		feet=gear.Ayanmo.Feet,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Suppanomimi",
		right_ear="Crep. Earring",
		left_ring="Begrudging Ring",
		right_ring="Rajas Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 12)
end