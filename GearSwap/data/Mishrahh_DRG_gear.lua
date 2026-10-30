function user_job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Naegling', 'Blunt', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Impulse Drive', 'Stardiver', 'Sonic Thrust', "Camlann's Torment", 'Drakesbane', 'Savage Blade' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Trishula",
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
	gear.Artifact.Hands = "Vis. Fng. Gaunt. +3"
	gear.Artifact.Legs = "Vishap Brais +3"
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Ptero. Armet +3"
	gear.Relic.Body = "Ptero. Mail +3"
	gear.Relic.Hands = "Ptero. Fin. G. +3"
	gear.Relic.Legs = "Ptero. Brais +3"
	gear.Relic.Feet = "Ptero. Greaves +3"

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
	sets.TreasureHunter = gear.TH.Val

	sets.precast.JA['Jump'] = {
		ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet="Ostro Greaves",
		neck="Vim Torque +1",
		back="Null Shawl",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring=gear.rings['Chririch L'],
		right_ring=gear.rings['Chririch R'],
	}
	sets.precast.JA['High Jump'] = set_combine( sets.precast.JA['Jump'], {} )
	sets.precast.JA['Spirit Jump'] = set_combine( sets.precast.JA['Jump'], {
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	} )
	sets.precast.JA['Soul Jump'] = set_combine( sets.precast.JA['Jump'], {
		body=gear.Empyrean.Body,
		hands="Gleti's Gauntlets",
	} )

	sets.precast.WS = {
		ammo="Knobkierrie",
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands=gear.Relic.Hands,
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Dgn. Collar +2",
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
		right_ring="Niqmaddu Ring",
		left_ring="Sroda Ring",
		waist="Fotia Belt",
	} )

	sets.precast.WS['Impulse Drive'] = set_combine( sets.precast.WS, {
		body="Gleti's Cuirass",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrCrit,
	} )
 
	sets.precast.WS['Stardiver'] = {
		ammo="Coiste Bodhar",
		head=gear.Relic.Head,
		hands=gear.Empyrean.Hands,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Sherida Earring",
		left_ring="Sroda Ring",
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
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrCrit,
	} )

	sets.precast.WS['Cataclysm'] = set_combine( sets.precast.WS, {
		right_ear="Friomisi Earring",
		left_ring="Medada's Ring",
		right_ring="Archon Ring",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		head="Pixie Hairpin +1",
	} )

	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Hjarrandi Breast.",
		hands="Gleti's Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Gleti's Boots",
		neck="Bathy Choker +1",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
		left_ring="Murky Ring",
		right_ring="Warp Ring",
		back="Null Shawl",
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
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs=gear.Relic.Legs,
		feet=gear.Flamma.Feet,
		neck="Vim Torque +1",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Dedition Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back="Null Shawl",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		hands=gear.Empyrean.Hands,
		legs="Gleti's Breeches",
		left_ring=gear.rings['Moonlight L'],
		back=gear.capes.DexTP,
	})

	sets.engaged.MDT = set_combine(sets.engaged.PDT, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 20)
end