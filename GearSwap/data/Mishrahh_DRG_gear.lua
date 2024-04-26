function user_job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Naegling', 'Blunt', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Impulse Drive', 'Stardiver', 'Sonic Thrust', "Camlann's Torment", 'Drakesbane', 'Savage Blade' }
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
	gear.Relic.Body = "Ptero. Mail +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Peltast's Mezail +3"
	gear.Empyrean.Body = "Pelt. Plackart +3"
	gear.Empyrean.Hands = "Pel. Vambraces +3"
	gear.Empyrean.Legs = "Pelt. Cuissots +3"
	gear.Empyrean.Feet = "Pelt. Schyn. +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.STP = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.StrCrit = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}

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
		ammo="Aurgelmir Orb +1",
		head=gear.Flamma.Head,
		body=gear.Relic.Body,
		hands=gear.Flamma.Hands,
		legs=gear.Empyrean.Legs,
		feet="Ostro Greaves",
		neck="Vim Torque +1",
		back=gear.capes.STP,
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
	}
	sets.precast.JA['High Jump'] = set_combine( sets.precast.JA['Jump'], {} )
	sets.precast.JA['Spirit Jump'] = set_combine( sets.precast.JA['Jump'], {
		feet=gear.Empyrean.Feet,
	} )
	sets.precast.JA['Soul Jump'] = set_combine( sets.precast.JA['Jump'], {} )

	sets.precast.WS = {
		ammo="Knobkierrie",
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Beithir Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWS,
	}
	sets.precast.WS['Raiden Thrust'] = set_combine( sets.precast.WS, {
		waist="Orpheus's Sash",
		left_ring="Medada's Ring",
	} )
	sets.precast.WS['Savage Blade'] = set_combine( sets.precast.WS, {
	} )
	sets.precast.WS['Sonic Thrust'] = set_combine( sets.precast.WS, {
	} )
	sets.precast.WS["Camlann's Torment"] = set_combine( sets.precast.WS, {
		neck="Drg. Collar +2",
		left_ring="Niqmaddu Ring",
		waist="Fotia Belt",
	} )
	sets.precast.WS['Impulse Drive'] = set_combine( sets.precast.WS, {
		left_ear="Moonshade Earring",
		neck="Drg. Collar +2",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
	} )
 
	sets.precast.WS['Stardiver'] = {
		ammo="Coiste Bodhar",
		head="Blistering Sallet +1",
		body="Hjarrandi Breast.",
		hands="Gleti's Gauntlets",
		legs=gear.Empyrean.Legs,
		feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrCrit,
	}

	sets.precast.WS['Drakesbane'] = set_combine( sets.precast.WS, {
		ammo="Coiste Bodhar",
		head="Blistering Sallet +1",
		body="Hjarrandi Breast.",
		hands="Gleti's Gauntlets",
		legs=gear.Empyrean.Legs,
		feet="Gleti's Boots",
		neck="Drg. Collar +2",
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrCrit,
	} )

	sets.precast.WS['Cataclysm'] = set_combine( sets.precast.WS, {
		right_ear="Friomis Earring",
		left_ring="Medada's Ring",
		right_ring="Archon Ring",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		head="Pixie Hairpin +1",
	} )

	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands="Gleti's Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Gleti's Boots",
		neck="Bathy Choker +1",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
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
		head="Hjarrandi Helm",
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Dgn. Collar +2",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
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
		right_ring="Moonlight Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Gelti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 20)
end