function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Tachi: Fudo', 'Tachi: Jinpu', 'Tachi: Kagero', 'Tachi: Gekko', 'Tachi: Shoha', 'Tachi: Rana', 'Tachi: Kasha', }

	gear.Artifact = {}
	gear.Artifact.Head = "Wakido Kabuto +2"
	gear.Artifact.Body = "Wakido Domaru +1"
	gear.Artifact.Hands = "Wakido Kote +1"
	gear.Artifact.Legs = "Wakido Haidate +3"
	gear.Artifact.Feet = "Wakido Sune-Ate +1"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Sakonji Domaru +3"
	gear.Relic.Hands = "Sakonji Kote +3"
	gear.Relic.Legs = "Sakonji Haidate +1"
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Kasuga Kabuto +2"
	gear.Empyrean.Body = "Kasuga Domaru +3"
	gear.Empyrean.Hands = "Kasuga Kote +2"
	gear.Empyrean.Legs = "Kasuga Haidate +3"
	gear.Empyrean.Feet = "Kasuga Sune-Ate +2"

	gear.capes = {}
	--gear.capes.DexTP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
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
	sets.precast.JA['Sengikori'] = {}
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
		feet=gear.Empyrean.Feet,
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Thrud Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		--back=gear.capes.StrDA,
	}
   
	sets.idle = {
		--ammo="Staunch Tathlum",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands="Nyame Gauntlets",
		legs=gear.Empyrean.Legs,
		feet="Nyame Sollerets",
		neck="Warder's Charm +1",
		waist="Moonbow Belt",
		neck="Elite Royal Collar",
		waist="Sailfi Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Assuage Earring",
		left_ring="Warden's Ring",
		right_ring="Warp Ring",
		--back=gear.capes.DexTP,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Oshasha's Treatise",
		head=gear.Flamma.Head,
		body=gear.Empyrean.Body,
		hands="Tatena. Gote +1",
		legs=gear.Empyrean.Legs,
		feet=gear.Ryou.Feet.C,
		neck="Sanctity Necklace",
		waist="Sailfi Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Assuage Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		--back=gear.capes.DexTP,
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