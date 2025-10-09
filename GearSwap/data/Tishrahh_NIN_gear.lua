function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Beads', 'GKTProc', 'KatanaProc' }
	gear.weapons = {}
	gear.weapons['Beads'] = {
		main="Voluspa Katana",
		sub="Voluspa Knife",
		--ammo="Staunch Tathlum",
	}
    gear.weapons['KatanaProc'] = {
		main="Yagyu Shortblade",
		sub="",
		--ammo="Staunch Tathlum",
	}
    gear.weapons['GKTProc'] = {
		main="Melon Slicer",
		sub="",
		--ammo="Staunch Tathlum",
	}
end

function init_gear_sets()
    sets.precast.WS = {}

    sets.idle = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Volte Spats",
        neck="Null Loop",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Warp Ring",
        right_ring="Defending Ring",
        back="Null Shawl",
    }

    sets.engaged = {
        ammo="Crepuscular Pebble",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Volte Mittens",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Volte Spats",
        neck="Null Loop",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Eabani Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Ilabrat Ring",
        back="Null Shawl",
    }
end