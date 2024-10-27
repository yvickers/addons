function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Axe' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}
	gear.weapons['Axe'] = {
		main="Dolichenus",
		sub="Ikenga's Axe",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Decimation', 'Raging Rush' }


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
	gear.Empyrean.Head = "Boii Mask +3"
	gear.Empyrean.Body = "Boii Lorica +3"
	gear.Empyrean.Hands = "Boii Mufflers +3"
	gear.Empyrean.Legs = "Boii Cuisses +3"
	gear.Empyrean.Feet = "Boii Calligae +3"

	gear.capes = {}
	gear.capes.DexTP = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	gear.capes.StrWS = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.VitWS = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	gear.capes.STRCrit = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}

end

function init_gear_sets()

    sets.precast.WS = {
		ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Begrudging Ring",
		back=gear.capes.StrWS,
	}
    sets.idle = {
		ammo="Crepuscular Pebble",
        head="Sakpata's Helm",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Etiolation Earring",
        right_ear="Eabani Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Warp Ring",
        back="Solemnity Cape",
	}

	sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Sakpata's Helm",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="War. Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Eabani Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Chirich Ring +1",
		back=gear.capes.DexTP,
	}
end