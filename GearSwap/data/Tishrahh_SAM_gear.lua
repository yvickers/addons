function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Piercing', 'Proc' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Dojikiri Yasutsuna",
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
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Tachi: Jinpu', 'Tachi: Fudo', 'Tachi: Kasha'  }

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
	gear.Empyrean.Head = "Kasuga Kabuto +3"
	gear.Empyrean.Body = "Kasuga Domaru +3"
	gear.Empyrean.Hands = "Kasuga Kote +3"
	gear.Empyrean.Legs = "Kasuga Haidate +3"
	gear.Empyrean.Feet = "Kas. Sune-Ate +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+6','Weapon skill damage +10%',}}
end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		--neck="Vim Torque +1",
	}

	sets.Enmity = {}

	sets.TreasureHunter = {}

	sets.precast.JA['Meditate'] = {
		--head=gear.Artifact.Head,
		--hands=gear.Relic.Hands,
	}
	sets.precast.JA['Blade Bash'] = {
		--hands=gear.Relic.Hands,
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
		--legs=gear.Relic.Legs,
	}
	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.WS = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands=gear.Empyrean.Hands,
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Nyame Sollerets",
        neck="Sam. Nodowa +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ilabrat Ring",
        back=gear.capes.StrWS,
    }
	sets.precast.WS.PROC = {
		--ammo="Staunch Tathlum +1",
		--head="Ken. Jinpachi +1",
		--body="Ken. Samue +1",
		--hands="Flam. Manopolas +2",
		--legs="Ken. Hakama +1",
		--feet="Ken. Sune-Ate +1",
		--neck={ name="Vim Torque +1", augments={'Path: A',}},
		--waist="Eschan Stone",
		--left_ear="Mache Earring +1",
		--right_ear="Crep. Earring",
		--left_ring="Cacoethic Ring +1",
		--right_ring="Chirich Ring +1",
		--back=gear.capes.DexTP,
	}

	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS,{
		head="Nyame Helm",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		right_ear="Friomisi Earring",
		right_ring="Medada's Ring",
        neck="Fotia Gorget",
		waist="Orpheus's Sash",
	})
	sets.precast.WS['Tachi: Jinpu'].PROC = set_combine(sets.precast.WS.PROC,{})
	sets.precast.WS['Tachi: Kagero'] = set_combine(sets.precast.WS,{
		head="Nyame Helm",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		right_ear="Friomisi Earring",
		right_ring="Medada's Ring",
		--waist="Orpheus's Sash",
	})
	sets.precast.WS['Tachi: Kagero'].PROC = set_combine(sets.precast.WS.PROC,{})


	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS,{

	})

	--switch to upgrade mpaca when have
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS,{
		ammo="Coiste Bodhar",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		--right_ear="Schere Earring",
		--left_ring="Niqmaddu Ring",
		--right_ring="Regal Ring",
	})
   
	sets.idle = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Nyame Sollerets",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
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
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands="Tatena. Gote +1",
        legs=gear.Empyrean.Legs,
        feet="Ryuo Sune-Ate +1",
        neck="Sam. Nodowa +2",
        waist="Ioskeha Belt +1",
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back=gear.capes.DexTP,
    }

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
		--hands=gear.Artifact.Hands,
	})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end