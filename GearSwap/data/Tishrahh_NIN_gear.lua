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
        head = "Mummu Bonnet +2",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu Kecks +2",
        feet = "Mummu Gamash. +2",
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