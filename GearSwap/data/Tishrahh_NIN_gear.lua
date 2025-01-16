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
		main="Uchigatana",
		sub="",
		--ammo="Staunch Tathlum",
	}
end

function init_gear_sets()
    sets.precast.WS = {}

    sets.idle = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sanctity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Eabani Earring",
        right_ear="Telos Earring",
        left_ring="Warp Ring",
        right_ring="Ilabrat Ring",
        back="Solemnity Cape",
    }

    sets.engaged = {}
end