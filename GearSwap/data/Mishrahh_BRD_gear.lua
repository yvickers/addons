function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Flat Blade', 'Burning Blade', }
	gear.weapons['Default'] = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
	}

	gear.Artifact = {}
	gear.Artifact.Head = "Brioso Roundlet +1"
	gear.Artifact.Body = ""
	gear.Artifact.Hands = "Brioso Cuffs +1"
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = "Brioso Slippers +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Fili Calot +1"
	gear.Empyrean.Body = "Fili Hongreline +1"
	gear.Empyrean.Hands = "Fili Manchettes +1"
	gear.Empyrean.Legs = "Fili Rhingrave +1"
	gear.Empyrean.Feet = "Fili Cothurnes +1"

	gear.capes = {}
	gear.capes.Idle = { name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Enmity-10','Mag. Evasion+15',}}
	gear.capes.IMBARD = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.capes.TP = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	gear.capes.SavageWS = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		--main="Mpu Gandring",
	}

	sets.precast.FC = {
		head="Bunzi's Hat",
		body=gear.Inyanga.Body,
	    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    legs="Kaykaus Tights +1",
		feet=gear.Empyrean.Feet,
	    neck="Baetyl Pendant",
	    waist="Embla Sash",
	    back=gear.capes.IMBARD,
	    left_ear="Loquac. Earring",
	    right_ear="Enchntr. Earring +1",
		left_ring="Weather. Ring +1",
    	right_ring="Medada's Ring",
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		--head=gear.Empyrean.Head,
	    --hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
	    --legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','Song spellcasting time -4%',}},
	   -- feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','Song spellcasting time -7%','MP+43',}},
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
		range="Linos",
		head=gear.Inyanga.Head,
		body=gear.Inyanga.Body,
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Inyanga.Feet,
		neck="Mnbw. Whistle +1",
		--back=gear.capes.IMBARD,
	}

	sets.midcast.SongDebuff = {
		main="Kali",
		sub="Ammurapi Shield",
		range="Linos",
		head=gear.Inyanga.Head,
		body=gear.Inyanga.Body,
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Inyanga.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		--back=gear.capes.IMBARD,
		left_ring="Metamor. Ring +1",
		right_ring="Stikini Ring +1",
		left_ear="Hermetic Earring",
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
		range="Linos",
		head=gear.Inyanga.Head,
		body=gear.Inyanga.Body,
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Inyanga.Feet,
		neck="Mnbw. Whistle +1",
		waist="Acuity Belt +1",
		--back=gear.capes.IMBARD,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		left_ear="Gersemi Earring",
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
	})

	sets.engaged = {
		head="Bunzi's Hat",
		body="Nyame Mail",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring=gear.rings['Moonlight L'],
		right_ring=gear.rings['Moonlight R'],
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