function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Piercing', 'Proc' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Masamune",
		sub="Utu Grip",
	}
	gear.weapons['Piercing'] = {
		main="Shining One",
		sub="Utu Grip",
	}
	gear.weapons['Proc'] = {
		main="Soboro Sukehiro",
		sub="Utu Grip",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Tachi: Fudo', 'Tachi: Jinpu', 'Impulse Drive', 'Sonic Thrust', }

	gear.Artifact = {}
	gear.Artifact.Head = "Wakido Kabuto +3"
	gear.Artifact.Body = "Wakido Domaru +1"
	gear.Artifact.Hands = "Wakido Kote +2"
	gear.Artifact.Legs = "Wakido Haidate +3"
	gear.Artifact.Feet = "Wakido Sune-Ate +1"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Sakonji Domaru +3"
	gear.Relic.Hands = "Sakonji Kote +3"
	gear.Relic.Legs = "Sakonji Haidate +1"
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Kasuga Kabuto +3"
	gear.Empyrean.Body = "Kasuga Domaru +3"
	gear.Empyrean.Hands = "Kasuga Kote +3"
	gear.Empyrean.Legs = "Kasuga Haidate +3"
	gear.Empyrean.Feet = "Kasuga Sune-Ate +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		--body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.JA['Meditate'] = {
		head=gear.Artifact.Head,
		hands=gear.Relic.Hands,
	}
	sets.precast.JA['Blade Bash'] = {
		hands=gear.Relic.Hands,
	}
	sets.precast.JA['Shikikoyo'] = {}
	sets.precast.JA['Sekkanoki'] = {
		hands=gear.Empyrean.Hands,
	}
	sets.precast.JA['Sengikori'] = {
		feet=gear.Empyrean.Feet,
	}
	sets.precast.JA['Hamanoha'] = {}
	sets.precast.JA['Konzen-ittai'] = {}
	sets.precast.JA['Third Eye'] = {
		legs=gear.Relic.Legs,
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		body=gear.Relic.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Artifact.Legs,
		feet="Nyame Sollerets",
		neck="Sam. Nodowa +2",
		waist="Sailfi Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Thrud Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrWS,
	}
	sets.precast.WS.PROC = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +2",
		hands={ name="Tatena. Gote +1", augments={'Path: A',}},
		legs="Flamma Dirs +2",
		feet="Flam. Gambieras +2",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Mache Earring +1",
		right_ear="Assuage Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Chirich Ring +1",
		back=gear.capes.DexTP,
	}
   
	sets.idle = {
		--ammo="Staunch Tathlum",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands="Nyame Gauntlets",
		legs=gear.Empyrean.Legs,
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Sailfi Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Assuage Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back=gear.capes.DexTP,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Coiste Bodhar",
		head=gear.Flamma.Head,
		body=gear.Empyrean.Body,
		hands="Tatena. Gote +1",
		legs=gear.Empyrean.Legs,
		feet=gear.Ryou.Feet.C,
		neck="Sam. Nodowa +2",
		waist="Sailfi Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Assuage Earring",
		left_ring="Lehko's Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head=gear.Empyrean.Head,
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
		--hands=gear.Artifact.Hands,
	})
end