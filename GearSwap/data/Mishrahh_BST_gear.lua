function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Shield',}
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Dolichenus",
		sub="Ikenga's Axe",
	}
	gear.weapons['Shield'] = {
		main="Dolichenus",
		sub="Forfend +1",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Decimation' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
    state.AutoFightMode = M( true, "Auto Pet Fight" )

	gear.Relic = {}
	gear.Relic.Head = "Ankusa Helm +3"
	gear.Relic.Body = "An. Jackcoat +3"
	gear.Relic.Hands = "Ankusa Gloves +3"
	gear.Relic.Legs = "Ankusa Trousers +3"
	gear.Relic.Feet = "Ankusa Gaiters +3"

	gear.Artifact = {}
	gear.Artifact.Head = "Totemic Helm +3"
	gear.Artifact.Body = "Tot. Jackcoat +3"
	gear.Artifact.Hands = "Totemic Gloves +3"
	gear.Artifact.Legs = "Totemic Trousers +1"
	gear.Artifact.Feet = "Totemic Gaiters +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Nuk. Cabasset +1"
	gear.Empyrean.Body = "Nukumi Gausape +3"
	gear.Empyrean.Hands = "Nukumi Manoplas +3"
	gear.Empyrean.Legs = "Nukumi Quijotes +1"
	gear.Empyrean.Feet = "Nukumi Ocreae +3"	
	

	gear.capes = {}
	gear.capes.STRDA = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+6','"Dbl.Atk."+10',}}
	gear.capes.CHRWS = { name="Artio's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}--,'CHR+10'
end

function init_gear_sets()
	sets.TreasureHunter = gear.TH.Herc

	sets.precast.WS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head=gear.Relic.Head,
        body=gear.Empyrean.Body,
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Bst. Collar +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Moonshade Earring",
        right_ear="Thrud Earring",
        left_ring="Gere Ring",
        right_ring="Sroda Ring",
        back=gear.capes.STRDA,
	}

	sets.precast.WS['Decimation'] = set_combine( sets.precast.WS,{
		body="Duty Cyclas",
		hands="Nyame Gauntlets",
		legs="Duty Flanchard",
		feet="Duty Sollerets",
		neck="Fotia Gorget",
		left_ear="Hoxne Earring",
	})
	sets.precast.WS['Mistral Axe'] = set_combine( sets.precast.WS,{
		left_ring="Epaminondas's Ring",
	})
	sets.precast.WS['Primal Rend'] = set_combine( sets.precast.WS,{
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Weather. Ring +1",
	})
	sets.precast.WS['Cloudsplitter'] = set_combine( sets.precast.WS,{
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Beithir Ring",
	})

	sets.precast.WS['Cyclone'] = set_combine(sets.engaged, sets.TreasureHunter,{})
	sets.precast.WS['Wasp Sting'] = set_combine(sets.engaged, {})
	sets.precast.WS['Gust Slash'] = set_combine(sets.engaged, {})

	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Duty Crown",
		body="Duty Cyclas",
		hands="Duty Gauntlets",
		legs="Duty Flanchard",
		feet="Duty Sollerets",
        neck="Warder's Charm +1",
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Warp Ring",
        right_ring="Murky Ring",
        back="Null Shawl",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Duty Crown",
		body="Duty Cyclas",
		hands="Duty Gauntlets",
		legs="Duty Flanchard",
		feet="Duty Sollerets",
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Dedition Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		waist="Windbuffet Belt +1",
		right_ear="Alabaster Earring",
		right_ring="Murky Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end