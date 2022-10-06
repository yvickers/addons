function user_job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Naegling', 'Blunt', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Impulse Drive', 'Stardiver', 'Sonic Thrust', "Camlann's Torment", 'Drakesbane' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Shining One",
		sub="Utu Grip",
	}
	gear.weapons['Naegling'] = {
		main="Naegling",
	}
	gear.weapons['Blunt'] = {
		main="Malignance Pole",
		sub="Utu Grip",
	}

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
	gear.capes.DexTP = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+3','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Val.Hands.TH,
		--body=gear.Val.Body.TH,
		waist="Chaac Belt",
		legs=gear.Val.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.JA['Jump'] = {
		feet="Ostro Greaves",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	}
	sets.precast.JA['High Jump'] = set_combine( sets.precast.JA['Jump'], {} )
	sets.precast.JA['Spirit Jump'] = set_combine( sets.precast.JA['Jump'], {} )
	sets.precast.JA['Soul Jump'] = set_combine( sets.precast.JA['Jump'], {} )

	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Sulevia.Feet,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Thrud Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWS,
	}
 
	sets.precast.WS['Stardiver'] = {
		ammo="Crep. Pebble",
		head=gear.Flamma.Head,
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet=gear.Flamma.Feet,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWS,
	}

	sets.precast.WS['Sonic Thrust'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
	} )

	sets.precast.WS['Impulse Drive'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
	} )

	sets.precast.WS['Drakesbane'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
	} )

	sets.precast.WS['Savage Blade'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
	} )

	sets.precast.WS['Cataclysm'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
	} )

	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Hjarrandi Helm",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Genmei Earring",
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
		body="Dagon Breast.",
		hands="Gleti's Gauntlets",
		legs=gear.Sulevia.Legs,
		feet=gear.Flamma.Feet,
		neck="Anu Torque",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Hjarrandi Helm",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		left_ring="Defending Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Gelti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		left_ring="Defending Ring",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 16)
end