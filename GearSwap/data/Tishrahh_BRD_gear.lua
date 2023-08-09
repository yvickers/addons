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
	gear.Artifact.Body = "Brioso Justau. +3"
	gear.Artifact.Hands = "Brioso Cuffs +3"
	gear.Artifact.Legs = "Brioso Cannions +3"
	gear.Artifact.Feet = "Brioso Slippers +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bihu Jstcorps. +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
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
	gear.capes.TP = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	gear.capes.SavageWS = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		main="Mpu Gandring",
	}

	sets.precast.FC = {
		body=gear.Inyanga.Body,
	    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    legs="Kaykaus Tights +1",
		feet=gear.Empyrean.Feet,
	    neck="Voltsurge Torque",
	    waist="Embla Sash",
	    back=gear.capes.IMBARD,
	    left_ear="Loquac. Earring",
	    right_ear="Enchntr. Earring +1",
		left_ring="Weather. Ring",
    	right_ring="Medada's Ring",
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		head=gear.Empyrean.Head,
	    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','Song spellcasting time -4%',}},
	    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','Song spellcasting time -7%','MP+43',}},
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
		--legs=gear.Relic.Legs,
	}

	sets.precast.WS = {
		--ammo="Knobkierrie",
		head="Nyame Helm",
		body=gear.Relic.Body,
		hands=gear.Jhakri.Hands,
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		--left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		--left_ring="Epona's Ring",
		--right_ring="Rajas Ring",
		back=gear.capes.SavageWS,
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
		main="Kali",
		sub="Ammurapi Shield",
		range="Marsyas",
		head=gear.Artifact.Head,
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		back=gear.capes.IMBARD,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		left_ear="Gersemi Earring",
		right_ear="Crep. Earring",
	}
	sets.midcast.Lullaby.Resistant = set_combine(sets.midcast.Lullaby,{})
	sets.midcast.Lullaby.AOE = set_combine(sets.midcast.Lullaby,{
		range="Daurdabla",
		hands=gear.Inyanga.Hands,
		feet=gear.Relic.Feet,
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
		feet="Mou. Crackows +1",
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
		sub="Culminus",
		head=gear.Vanya.Head.B,
		body=gear.Vanya.Body.B,
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		legs="Kaykaus Tights +1",
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
	sets.midcast['Enhancing Magic'] = {
		main="Pukulatmuj +1",
		sub="Ammurapi Shield",
		range={ name="Linos", augments={'Mag. Evasion+14','"Regen"+2','HP+16',}},
		head="Umuthi Hat",
		body={ name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		hands="Inyan. Dastanas +2",
		legs="Shedir Seraweels",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Reti Pendant",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Nodens Gorget",
		waist="Seigel Sash",
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		head="Chironic Hat",
		waise="Emphatikos Rope",
	})
	sets.midcast.Cursna = {
		hands=gear.Inyanga.Hands,
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
		waist="Gishdubar Sash",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		back="Oretan. Cape +1",
	}
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range={ name="Linos", augments={'Mag. Evasion+14','"Regen"+2','HP+16',}},
		head="Fili Calot +3",
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+27','Weapon Skill Acc.+14','Accuracy+19 Attack+19','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet="Fili Cothurnes +3",
		neck="Sanctity Necklace",
		waist="Siegel Sash",
		left_ear="Vor Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}

	sets.midcast['Banish'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Friomisi Earring",
		left_ring="Weather. Ring",
		right_ring="Medada's Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
	sets.midcast['Banish II'] = sets.midcast['Banish']

	sets.idle = {
		main="Daybreak",
		sub="Culminus",
		range="Linos",
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Bathy Choker +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back=gear.capes.Idle,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})
	sets.idle.Refresh = set_combine(sets.idle, {
		head=gear.Inyanga.Head,
		body=gear.Inyanga.Body,
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Inyanga.Feet,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	})

	sets.engaged = {
		main="Naegling",
		head=gear.Ayanmo.Head,
		body=gear.Ayanmo.Body,
		hands=gear.Ayanmo.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Ayanmo.Feet,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Suppanomimi",
		right_ear="Crep. Earring",
		left_ring="Begrudging Ring",
		right_ring="Rajas Ring",
		back=gear.capes.TP,
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