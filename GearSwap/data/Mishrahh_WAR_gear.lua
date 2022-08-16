function user_job_setup()

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Mace', 'Shining', 'GAXE', 'AXE' }
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
		sub="Zantetsuken",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', "Judgment", "Impulse Drive", "Sonic Thrust", "Ukko's Fury", "Upheaval", "Fell Cleave" }


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
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.DexTP = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.VitWS = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

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
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Val.Hands.TH,
		body=gear.Val.Body.TH,
		--waist="Chaac Belt",
		legs=gear.Val.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.FC = {
        --head=gear.Herc.Head.TH,
        --hands="Leyline Gloves",
        ammo="Impatiens",
        neck="Voltsurge Torque",
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

	sets.precast.JA['Aggressor'] = {
		head=gear.Artifact.Head,
	}
	sets.precast.JA['Berserk'] = {
		body=gear.Artifact.Body,
	}
	sets.precast.JA['Warcry'] = {
		head=gear.Relic.Head,
	}
	sets.precast.JA['Jump'] = {
		feet="Ostro Greaves"
	}
	sets.precast.JA['High Jump'] = {
		feet="Ostro Greaves"
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
		head=gear.Relic.Head,
		body=gear.Artifact.Body,
		hands="Sakpata's Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Sulevia.Feet,
		neck="War. Beads +1",
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.StrWS,
	}

	sets.precast.GAXEWS = set_combine(sets.precast.WS, {
		left_ring="Gelatinous Ring +1",
		back=gear.capes.VitWS,
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
	})
	sets.precast.WS["Metatron Torment"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["King's Justice"] = set_combine(sets.precast.GAXEWS, {
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

	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Hermes' Sandals",
		neck="Warder's Charm +1",
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
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands=gear.Sulevia.Hands,
		legs=gear.Artifact.Legs,
		feet=gear.Artifact.Feet,
		neck="War. Beads +1",
		waist="Ioskeha Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
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

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		left_ring="Shadow Ring",
		--back="Archon Cape",
	})

	sets.engaged.ACC = set_combine(sets.engaged, {
		ammo="Seeth. Bomblet +1",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		--left_ear="Crep. Earring",
		left_ring="Regal Ring",
		right_ring="Moonbeam Ring",
	})

	sets.engaged.SB = set_combine(sets.engaged, {
		head="Sakpata's Helm",
		body="Dagon Breast.",
		hands=gear.Sulevia.Hands,
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		left_ear="Schere Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
    	set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end