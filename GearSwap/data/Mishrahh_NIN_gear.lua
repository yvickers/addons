function user_job_setup()

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Savage', 'TPBonus', 'Aeolian' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Gokotai",
		sub="Kunimitsu",
	}
	gear.weapons['Savage'] = {
		main="Naegling",
		sub="Uzura +2",
	}
	gear.weapons['TPBonus'] = {
		main="Gokotai",
		sub="Uzura +2",
	}
	gear.weapons['Aeolian'] = {
		main="Tauret",
		sub="Uzura +2",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Blade: Chi', 'Blade: Ku', 'Blade: Ten', 'Blade: Ei', 'Aeolin Edge', }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
	state.NINStance = M{['description'] = 'Ninja Stance',  'None', 'Yonin', 'Innin', }
	state.AutoUtsu = M( false, "Automatic Utsusemi" )
	state.AutoUtsuBuffer = M{['description'] = 'Images for recast', 0, 1, 2, }

	gear.Artifact = {}
	gear.Artifact.Head = "Hachiya Hatsu. +3"
	gear.Artifact.Body = ""
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = "Hachiya Kyahan +3"

	gear.Relic = {}
	gear.Relic.Head = "Mochi. Hatsuburi +3"
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = "Mochi Kyahan +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = "Hattori Kyahan +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	gear.capes.StrWSD = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.MagicWSD = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
    gear.capes.FC = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    gear.capes.Ninjutsu = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+4','"Mag.Atk.Bns."+10',}}

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

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Herc.Hands.TH,
		body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	 sets.precast.FC = {
	 	ammo="Impatiens",
		head="Herculean Head",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		--body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Weather. Ring +1",
		legs="Rawhide Trousers",
		feet=gear.Relic.Feet,
		back=gear.capes.FC,
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
    	neck="Magoraga Beads",
    	--body="Passion Jacket",
    	feet=gear.Empyrean.Feet,
    } )


	sets.precast.WS = {
		ammo="Crepuscular Pebble",
		head=gear.Artifact.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Empyrean.Feet,
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Moonshade Earring",
		right_ear="Hattori Earring +2",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back=gear.capes.StrWSD,
	}

	sets.precast.WS.Hybrid = {
		ammo="Seeth. Bomblet +1",
		head=gear.Relic.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear="Moonshade Earring",
		right_ear="Lugra Earring +1",
		left_ring="Gere Ring",
		right_ring="Epaminondas's Ring",
		back=gear.capes.StrWSD,
	}
	sets.precast.WS['Blade: To'] = sets.precast.WS.Hybrid
	sets.precast.WS['Blade: Teki'] = sets.precast.WS.Hybrid
	sets.precast.WS['Blade: Chi'] = sets.precast.WS.Hybrid
	sets.precast.WS['Blade: Yu'] = sets.precast.WS.Hybrid
	sets.precast.WS['Blade: Ei'] = set_combine(sets.precast.WS.Hybrid, {
		head="Pixie Hairpin +1",
		neck="Sibyl Scarf",
		back=gear.capes.MagicWSD,
		right_ear="Friomisi Earring",
		left_ring="Archon Ring",
	})
	sets.precast.WS['Sanguine Blade'] = sets.precast.WS['Blade: Ei']

	sets.precast.WS['Blade: Hi'] = {
		ammo="Yetshila +1",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Empyrean.Feet,
		neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",
		left_ear="Odr Earring",
		right_ear="Hattori Earring +2",
		left_ring="Gere Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWSD,
	}

	sets.precast.WS['Blade: Kamu'] = {
		ammo="Crepuscular Pebble",
		head=gear.Artifact.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Mpaca's Hose",
		feet=gear.Empyrean.Feet,
		neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",
		left_ear="Lugra Earring +1",
		right_ear="Hattori Earring +2",
		left_ring="Gere Ring",
		right_ring="Sroda Ring",
		back=gear.capes.StrWSD,
	}

	sets.precast.WS['Blade: Ku'] = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Malignance Gloves",
		legs="Nyame Flanchard",
		feet=gear.Empyrean.Feet,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Lugra Earring +1",
		right_ear="Hattori Earring +2",
		left_ring="Gere Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWSD,
	}

	sets.precast.WS['Blade: Shun'] = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Mpaca's Hose",
		feet=gear.Empyrean.Feet,
		neck="Ninja Nodowa +2",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Hattori Earring +2",
		left_ring="Gere Ring",
		right_ring="Regal Ring",
		back=gear.capes.StrWSD,
	}

	sets.precast.WS['Aeolian Edge'] = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head=gear.Relic.Head,
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back=gear.capes.MagicWSD,
	}

	sets.midcast.SpellInterrupt = {
        ammo="Staunch Tathlum", --10
        --body=gear.Taeon_Phalanx_body, --10
        hands="Rawhide Gloves", --15
        --legs=gear.Taeon_Phalanx_legs, --10
        --feet=gear.Taeon_Phalanx_feet, --10
        neck="Moonlight Necklace", --15
        ear1="Halasz Earring", --5
        --ear2="Magnetic Earring", --8
        ring1="Evanescence Ring", --5
        back=gear.capes.FC, --10
        waist="Audumbla Sash", --10
    }
    sets.midcast.Utsusemi = set_combine(sets.midcast.SpellInterrupt, {
        feet=gear.Empyrean.Feet,
    })
    sets.midcast.EnhancingNinjutsu = {
		head=gear.Artifact.Head,
		feet=gear.Relic.Feet,
		--neck="Incanter's Torque",
		left_ear="Hnoss Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.capes.Ninjutsu,
		--waist="Cimmerian Sash",
	}
    sets.midcast.EnfeeblingNinjutsu = {
		ammo="Yamarang",
		head=gear.Artifact.Head,
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet=gear.Artifact.Feet,
		neck="Sanctity Necklace",
		back=gear.capes.Ninjutsu,
		waist="Eschan Stone",
		left_ear="Hnoss Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}
    sets.midcast.ElementalNinjutsu = {
		ammo="Ghastly Tathlum +1",
		head=gear.Relic.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Relic.Feet,
		neck="Sibyl Scarf",
		back=gear.capes.Ninjutsu,
		waist="Orpheus's Sash",
		left_ear="Heacate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Dingir Ring",
		right_ring="Metamor. Ring +1",
	}

	sets.idle = {
		ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet=gear.Artifact.Feet,
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        back=gear.capes.DexTP,
        left_ear="Odnowa Earring +1",
        right_ear="Genmei Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Date Shuriken",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands=gear.Adhemar.Hands.A,
		legs="Samnuha Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Sailfi Belt +1",
		back=gear.capes.DexTP,
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end