function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Piercing' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Ichigohitofuri",
		sub="Utu Grip",
	}
	gear.weapons['Piercing'] = {
		main="Shining One",
		sub="Utu Grip",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Tachi: Kasha', 'Impulse Drive' }

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
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	--gear.capes.DexTP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	--gear.capes.StrWS = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		--body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.JA['Meditate'] = {
		--head=gear.Artifact.Head,
		--hands=gear.Relic.Hands,
	}
	sets.precast.JA['Blade Bash'] = {
		--hands=gear.Relic.Hands,
	}
	sets.precast.JA['Shikikoyo'] = {}
	sets.precast.JA['Sekkanoki'] = {
		--hands=gear.Empyrean.Hands,
	}
	sets.precast.JA['Sengikori'] = {
		--feet=gear.Empyrean.Feet,
	}
	sets.precast.JA['Hamanoha'] = {}
	sets.precast.JA['Konzen-ittai'] = {}
	sets.precast.JA['Third Eye'] = {
		--legs=gear.Relic.Legs,
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Sroda Ring",
        back="Solemnity Cape",
	}
   
	sets.idle = {
		ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back="Solemnity Cape",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Flam. Zucchetto +2",
        body="Dagon Breast.",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Vim Torque +1", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear="Dedition Earring",
        right_ear="Ethereal Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back="Solemnity Cape",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head=gear.Empyrean.Head,
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
		--hands=gear.Artifact.Hands,
	})
end