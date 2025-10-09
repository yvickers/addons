function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Dagger', 'Sword', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Energy Drain', 'Wasp Sting', 'Mordant Rime', 'Savage Blade', }
	gear.weapons['Default'] = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Linos",
	}

	gear.weapons['Dagger'] = {
		main="Twashtar",
		sub="Centovente",
		range="Linos",
	}

	gear.weapons['Sword'] = {
		main="Naegling",
		sub="Centovente",
		range="Linos",
	}

	gear.Artifact = {}
	gear.Artifact.Head = "Brioso Roundlet +3"
	gear.Artifact.Body = ""
	gear.Artifact.Hands = "Brioso Cuffs +3"
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = "Brioso Slippers +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bihu Jstcorps. +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Bihu Cannions +3"
	gear.Relic.Feet = "Bihu Slippers +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Fili Calot +3"
	gear.Empyrean.Body = "Fili Hongreline +3"
	gear.Empyrean.Hands = "Fili Manchettes +3"
	gear.Empyrean.Legs = "Fili Rhingrave +3"
	gear.Empyrean.Feet = "Fili Cothurnes +3"

	gear.capes = {}
	gear.capes.Idle = { name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Enmity-10','Mag. Evasion+15',}}
	gear.capes.IMBARD = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.capes.STRWS = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.DEXWSD = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

	gear.Linos = {}
	gear.Linos.Idle = { name="Linos", augments={'Mag. Evasion+10','"Fast Cast"+3','INT+6 MND+6',}}
	gear.Linos.DEXCrit = { name="Linos", augments={'Crit.hit rate+3','DEX+8',}}
	gear.Linos.TP = { name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}}
	gear.Linos.STRWS = { name="Linos", augments={'Attack+19','Weapon skill damage +2%','STR+5 DEX+5',}}

end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		--main="Mpu Gandring",
	}

	sets.TreasureHunter = {
		head="Volte Cap",
		body="Volte Jupon",
		hands="Volte Bracers",
	}

	sets.precast.FC = {
		main="Kali",
		sub="Genmei Shield",
		ammo="Linos", --3
		head="Bunzi's Hat",	--10
		body=gear.Inyanga.Body,  --14
	    hands="Leyline Gloves", --8
	    legs="Kaykaus Tights +1", --7
		feet=gear.Empyrean.Feet, --10
	    neck="Baetyl Pendant",
	    waist="Embla Sash",  --5
	    back=gear.capes.IMBARD,  --10
	    left_ear="Loquac. Earring", --2
	    right_ear="Etiolation Earring", --1
		left_ring="Kishar Ring", --4
    	right_ring="Medada's Ring", --10
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		head=gear.Empyrean.Head,
	    hands="Gende. Gages +1", --10
	    legs="Gende. Spats +1", --10
	} )
	sets.precast.FC["Honor March"] = set_combine(sets.precast.FC.BardSong,{
		range="Marsyas"
	})

	sets.precast.JA.Nightingale = {
		feet=gear.Relic.Feet,
	}
	sets.precast.JA.Troubadour = {
		body=gear.Relic.Body,
	}
	sets.precast.JA['Soul Voice'] = {
		legs=gear.Relic.Legs,
	}

	sets.precast.WS = {
		range=gear.Linos.STRWS,
		head="Nyame Helm",
		body=gear.Relic.Body,
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back=gear.capes.STRWS,
	}

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{
		left_ring = "Ilabrat Ring",
		waist="Kentarch Belt +1",
		back=gear.capes.DEXWSD,
	})

	sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS,{
		range=gear.Linos.DEXCrit,
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		hands="Volte Mittens",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Mache Earring +1",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back=gear.capes.DEXWSD,
	})

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
		back=gear.capes.IMBARD,
	}

	sets.midcast.SongDebuff = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		head=gear.Artifact.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		back=gear.capes.IMBARD,
		left_ring="Metamor. Ring +1",
		right_ring="Stikini Ring +1",
		left_ear="Digni. Earring",
		right_ear="Crep. Earring",
	}

	-- Dummy Song Instruments --
	sets.midcast.DummySong = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Terpander",
		--swap in items that don't extend duration to prevent overwriting with lag
		head=gear.Ayanmo.Head,
		body=gear.Ayanmo.Body,
		hands=gear.Ayanmo.Hands,
		legs=gear.Ayanmo.Legs,
		feet=gear.Ayanmo.Feet,
		neck="Null Loop",
		back="Null Shawl",
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
		main="Kali",
		sub="Ammurapi Shield",
		range="Marsyas",
		head=gear.Artifact.Head,
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		back=gear.capes.IMBARD,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		left_ear="Digni. Earring",
		right_ear="Crep. Earring",
	}
	sets.midcast.Lullaby.Resistant = set_combine(sets.midcast.Lullaby,{})
	sets.midcast.Lullaby.AOE = set_combine(sets.midcast.Lullaby,{
		range="Terpander",
		hands=gear.Inyanga.Hands,
	})
	sets.midcast['Horde Lullaby'] = set_combine(sets.midcast.Lullaby.AOE,{})
	sets.midcast['Horde Lullaby'].Resistant = set_combine(sets.midcast.Lullaby.AOE,{})
	sets.midcast['Horde Lullaby II'] = set_combine(sets.midcast.Lullaby.AOE,{})
	sets.midcast['Horde Lullaby II'].Resistant = set_combine(sets.midcast.Lullaby.AOE,{})
	sets.midcast.Madrigal = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast.Prelude = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast["Honor March"] = set_combine(sets.midcast.March,{
		range="Marsyas"
	})
	sets.midcast.Mambo = {
		--feet="Mou. Crackows +1",
	}
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {
		feet=gear.Empyrean.Feet,
	}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}

	sets.midcast.Cure = {
		main="Daybreak",
		sub="Ammurapi Shield",
		head="Kaykaus Mitra +1",
		body="Bunzi's Robe",
		hands="Kaykaus Cuffs +1",
		legs="Kaykaus Tights +1",
		feet="Kaykaus Boots +1",
		neck="Reti Pendant",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear="Meili Earring",
		left_ring="Lebeche Ring",
		right_ring="Inyanga Ring",
		back="Oretan. Cape +1",
	}
	sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Stoneskin = {}
	sets.midcast.Cursna = {
		hands=gear.Inyanga.Hands,
	}

	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Linos",
		head="Null Masque",
		body="Volte Doublet",
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Bathy Choker +1",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Null Shawl",--gear.capes.Idle,
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
		head="Bunzi's Hat",
		body=gear.Ayanmo.Body,
		hands="Gazu Bracelets +1",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring=gear.rings['Moonlight L'],
		right_ring=gear.rings['Moonlight R'],
		back="Null Shawl",--gear.capes.TP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {}
end