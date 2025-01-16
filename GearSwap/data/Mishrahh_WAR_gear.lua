function user_job_setup()
	state.OffenseMode:options( 'PDT', 'Melee', 'Tanking', 'SB' )

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'GAXE', 'Shining', 'Mace', 'Axe' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}
	gear.weapons['Mace'] = {
		main="Loxotic Mace +1",
		sub="Blurred Shield +1",
	}
	gear.weapons['Shining'] = {
		main="Shining One",
		sub="Utu Grip",
	}
	gear.weapons['GAXE'] = {
		main="Chango",
		sub="Utu Grip",
	}
	gear.weapons['AXE'] = {
		main="Dolichenus",
		sub="Blurred Shield +1",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', "Upheaval", "Impulse Drive", "Judgment", 'Decimation' }


	gear.Artifact = {}
	gear.Artifact.Head = "Pumm. Mask +1"
	gear.Artifact.Body = "Pumm. Lorica +3"
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = "Pumm. Cuisses +3"
	gear.Artifact.Feet = "Pumm. Calligae +3"

	gear.Relic = {}
	gear.Relic.Head = "Agoge Mask +3"
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = "Agoge Calligae +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Boii Mask +3"
	gear.Empyrean.Body = "Boii Lorica +3"
	gear.Empyrean.Hands = "Boii Mufflers +3"
	gear.Empyrean.Legs = "Boii Cuisses +3"
	gear.Empyrean.Feet = "Boii Calligae +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.VitWS = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	gear.capes.STRCrit = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	select_default_macro_book()

end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		neck="Vim Torque +1",
	}
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Val.Hands.TH,
		body=gear.Val.Body.TH,
		--waist="Chaac Belt",
		legs=gear.Val.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.Enmity = {
		ammo="Sapience Orb",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=280},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=171},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=239},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=162},
		feet={ name="Eschite Greaves", priority=98},
		neck="Moonlight Necklace",
		left_ear={name="Cryptic Earring",priority=40},
		right_ear="Rimeice Earring",
		left_ring="Begrudging Ring",
		right_ring={name="Supershear Ring",priority=30},
	}

	sets.precast.FC = {
        --head=gear.Herc.Head.TH,
        --hands="Leyline Gloves",
        ammo="Impatiens",
        neck="Baetyl Pendant",
        left_ring="Weather. Ring +1",
        right_ring="Medada's Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.JA['Aggressor'] = {
		head=gear.Artifact.Head,
	}
	sets.precast.JA['Aggressor'].Tanking = set_combine(sets.Enmity,sets.precast.JA['Aggressor'])

	sets.precast.JA['Berserk'] = {
		body=gear.Artifact.Body,
		feet=gear.Relic.Feet,
	}
	sets.precast.JA['Berserk'].Tanking = set_combine(sets.Enmity,sets.precast.JA['Berserk'])

	sets.precast.JA['Warcry'] = {
		head=gear.Relic.Head,
	}
	sets.precast.JA['Warcry'].Tanking = set_combine(sets.Enmity,sets.precast.JA['Warcry'])

	sets.precast.JA['Blood Rage'] = {
		body=gear.Empyrean.Body,
	}
	sets.precast.JA['Blood Rage'].Tanking = set_combine(sets.Enmity,sets.precast.JA['Blood Rage'])

	sets.precast.JA['Restraint'] = {
		hands=gear.Empyrean.Hands,
	}
	sets.precast.JA['Restraint'].Tanking = set_combine(sets.Enmity,sets.precast.JA['Restraint'])

	sets.precast.JA['Jump'] = {
		feet="Ostro Greaves"
	}
	sets.precast.JA['High Jump'] = {
		feet="Ostro Greaves"
	}
	sets.precast.JA['Tomahawk'] = {
		ammo="Thr. Tomahawk",
	}

	sets.buff['Mighty Strikes'] = {
		ammo = "Yetshila +1",
		feet = gear.Empyrean.Feet
	}
	sets.buff['Retaliation'] = {
		feet = gear.Empyrean.Feet
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
		head=gear.Relic.Head,
		body="Nyame Mail",
		hands=gear.Empyrean.Hands,
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back=gear.capes.StrWS,
	}

	sets.precast.WS.Buffed = set_combine(sets.precast.WS, {
		body="Sakpata's Plate",
		legs=gear.Empyrean.Legs,
	})

	--sets.precast.WS['Judgment'] = set_combine(sets.precast.WS, {})
	--sets.precast.WS['Judgment'].Buffed = set_combine(sets.precast.WS['Judgment'], {})

	sets.precast.WS['Judgment'] = set_combine(sets.precast.WS, {
		legs=gear.Empyrean.Legs,
		right_ring="Regal Ring",
	})
	sets.precast.WS['Judgment'].Buffed = set_combine(sets.precast.WS['Judgment'], {
		body="Sakpata's Plate",
		right_ring="Epaminondas's Ring",
	})

	--ideally 2k-3k tp
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
		ammo="Yetshila +1",
		head=gear.Empyrean.Head,
		body="Hjarrandi Breast.",
		feet=gear.Empyrean.Feet,
		left_ear="Boii Earring +1",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.STRCrit,
	})
	sets.precast.WS['Impulse Drive'].Buffed = set_combine(sets.precast.WS['Impulse Drive'], {
		head="Blistering Sallet +1",
		body="Sakpata's Plate",
		legs=gear.Empyrean.Legs,
		left_ring="Sroda Ring",
	})

	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		ammo="Yetshila +1",
		head=gear.Empyrean.Head,
		body="Hjarrandi Breast.",
		hands=gear.Flamma.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Boii Earring +1",
		left_ring="Begrudging Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.STRCrit,
	})
	sets.precast.WS['Stardiver'].Buffed = set_combine(sets.precast.WS['Stardiver'], {
		head="Blistering Sallet +1",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		left_ring="Sroda Ring",
	})

	sets.precast.GAXEWS = set_combine(sets.precast.WS, {
		legs="Nyame Flanchard",
	})
	sets.precast.WS["Shield Break"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Iron Tempest"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Sturmwind"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Keen Edge"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Raging Rush"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Steel Cyclone"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Upheaval"] = set_combine(sets.precast.GAXEWS, {
		left_ring="Gelatinous Ring +1",
		right_ring="Niqmaddu Ring",
		back=gear.capes.VitWS,
	})
	sets.precast.WS["Metatron Torment"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["King's Justice"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.GAXEWS, {
		ammo="Yetshila +1",
		left_ear="Schere Earring",
		right_ear="Boii Earring +1",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.STRCrit,
	})

	sets.precast.WS["Armor Break"] = set_combine(sets.precast.GAXEWS, {
		ammo="Knobkierrie",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Crep. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Crepuscular Ring",
	})
	sets.precast.WS["Weapon Break"] = set_combine(sets.precast.WS["Armor Break"], {
	})
	sets.precast.WS["Full Break"] = set_combine(sets.precast.WS["Armor Break"], {
	})

	sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {
        head=gear.Relic.Head,
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Metamor. Ring +1",		
    } )
	sets.precast.WS["Cataclysm"] = set_combine(sets.precast.WS, {
        head="Pixie Hairpin +1",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Archon Ring",		
    } )

	sets.precast.WS["Sanguine Blade"] = set_combine(sets.precast.WS, {
        head="Pixie Hairpin +1",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Archon Ring",		
    } )
	sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS, {
        head="Nyame Helm",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Weather. Ring +1",		
    } )

	sets.precast.WS["Decimation"] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
		head=gear.Empyrean.Head,
		neck="War. Beads +2",
		ear1="Schere Earring",
		ear2="Boii Earring +1",
		body="Nyame Mail",
		hands=gear.Empyrean.Hands,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=gear.capes.STRCrit,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"		
    } )

	sets.precast.WS["Decimation"].Buffed = set_combine(sets.precast.WS["Decimation"], {
		head="Sakpata's Helm",
		neck="Fotia Gorget",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		ring1="Sroda Ring",
		legs=gear.Empyrean.Legs,
		feet="Sakpata's Leggings"		
    } )

	sets.precast.WS["Mistral Axe"] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
		head=gear.Artifact.Head,
		neck="War. Beads +2",
		ear1="Moonshade Earring",
		ear2="Thrud Earring",
		body="Nyame Mail",
		hands=gear.Empyrean.Hands,
		ring1="Sroda Ring",
		ring2="Regal Ring",
		back=gear.capes.StrWS,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"		
    } )
	sets.precast.WS["Mistral Axe"].Buffed = set_combine(sets.precast.WS["Mistral Axe"], {
		body="Sakpata's Plate",
		ring1="Sroda Ring",
		ring2="Epaminondas's Ring",
		back="Cichol's Mantle",
		legs=gear.Empyrean.Legs,
    } )

	sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
        head="Nyame Helm",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Weather. Ring +1",		
    } )

	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Hermes' Sandals",
		neck="Bathy Choker +1",
		waist="Engraved Belt",
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
		head=gear.Empyrean.Head,
		body="Hjarrandi Breast.",
		hands="Sakpata's Gauntlets",
		legs=gear.Artifact.Legs,
		feet=gear.Artifact.Feet,
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		left_ear="Schere Earring",
		right_ear="Boii Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
	})

	sets.engaged.Tanking = set_combine(sets.engaged.PDT, {
		left_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
	})

	sets.engaged.SB = set_combine(sets.engaged, {
		head="Sakpata's Helm",
		body="Dagon Breast.",
		hands=gear.Sulevia.Hands,
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		left_ring="Chirich Ring +1",
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end