function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Sword', 'Mace' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Apocalypse",
		sub="Utu Grip",
	}

	gear.weapons['Sword'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}
	gear.weapons['Mace'] = {
		main="Loxotic Mace +1",
		sub="Blurred Shield +1",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Cross Reaper', 'Catastrophe', 'Savage Blade', 'Mace' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = ""
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
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.DexTP = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

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

	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		feet="Carmine Greaves +1",
		neck="Voltsurge Torque",
		waist="Ioskeha Belt +1",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Weather. Ring +1",
		right_ring="Medada's Ring",
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear="Heathen's Earring +1",
        left_ring="Epaminondas's Ring",
        right_ring="Niqmaddu Ring",
        back=gear.capes.DexTP,
	}

	sets.precast.WS['Cross Reaper'] = set_combine( sets.precast.WS, {
		right_ear="Moonshade Earring",
	})
	sets.precast.WS['Insurgency'] = set_combine( sets.precast.WS, {
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
	})
	sets.precast.WS['Quietus'] = set_combine( sets.precast.WS, {
		left_ear="Schere Earring",
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
	})
	sets.precast.WS['Entropy'] = set_combine( sets.precast.WS, {
		ammo="Coiste Bodhar",
		left_ear="Schere Earring",
		right_ear="Moonshade Earring",
		left_ring="Metamor. Ring +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
	})

	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Carmine Cuisses +1",
        feet="Sakpata's Leggings",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back="Solemnity Cape",
	}
	sets.idle.PDT = set_combine(sets.idle, {
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Cessance Earring",
		right_ear="Dedition Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Moonlight Ring",
        back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end