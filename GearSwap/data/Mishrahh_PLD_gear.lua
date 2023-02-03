function user_job_setup()
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Aeolian Edge', 'Savage Blade' }
	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = "Rev. Surcoat +3"
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = ""
	gear.Relic.Hands = "Cab. Gauntlets +2"
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes.FastCast = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	gear.capes.Block = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}}
end

function unload_job_keybinds()
end

function init_gear_sets()
	sets.TreasureHunter = {
		head='Volte Cap',
		hands=gear.Val.Hands.TH,
		waist="Chaac Belt",
		legs=gear.Val.Legs.TH,
	}

	sets.Enmity = {
		ammo="Sapience orb", --2
		head="Souv. Schaller +1", --9
		body="Souv. Cuirass +1", --20
		hands="Souv. Handsch. +1", --9
		legs="Souv. Diechlings +1", --9
		feet="Eschite Greaves", --15
		neck="Moonlight Necklace ", --15
		left_ear="Cryptic Earring", --4
		right_ear="Odnowa Earring +1", --0
		left_ring="Supershear Ring", --5
		right_ring="Begrudging Ring", --5
		back=gear.capes.Block, --10
		waist="Creed Baudrier", --5
    } --108

    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{
    	--body=gear.Relic.Body,
    })
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{
		--feet=gear.Relic.Feet,
	})
	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity,{
		head="Nyame Helm",
		body=gear.Artifact.Body,
		hands=gear.Relic.Hands,
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	})
	sets.precast.JA['Chivalry'] = set_combine(sets.Enmity,{
		--hands=gear.Relic.Hands,
	})
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{
		--legs=gear.Relic.Legs,
	})
	sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{
		--head=gear.Relic.Head,
	})
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{
		--feet=gear.Artifact.Feet,
	})
	sets.precast.JA['Majesty'] = sets.Enmity
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Last Resort'] = sets.Enmity
	sets.precast.JA['Defender'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity
	sets.precast.JA['Vallation'] = sets.Enmity
	sets.precast.JA['Pflug'] = sets.Enmity
	sets.precast.JA['Swordplay'] = sets.Enmity
	sets.precast.JA['Valiance'] = sets.Enmity

	sets.precast.FC = {
		ammo="Sapience Orb", --2
		--head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		head="Sakpata's Helm", -- 8
		body=gear.Artifact.Body, --10
		hands="Leyline Gloves", --7
		--legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+4','"Fast Cast"+5','AGI+8',}}, --5
		feet="Carmine Greaves +1", --8
		back=gear.capes.FastCast, --10
		neck="Voltsurge Torque", --5
		right_ear="Etiolation earring", --1
		left_ring="Kishar Ring", --4
		right_ring="Weather. Ring +1", --6
	}
	sets.precast.FC.DT = set_combine(sets.precast.FC, {
    })
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		--waist="Siegel sash",
    })
		
	sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {
		--waist="Siegel Sash",
	})
	sets.precast.FC['Cure IV'] = set_combine(sets.precast.FC , {
		--left_ear="Nourish. Earring +1",
	})
	sets.precast.FC.Enlight = sets.precast.FC.Phalanx
	sets.precast.FC['Enlight II'] = sets.precast.FC.Phalanx
	sets.precast.FC.Protect = sets.precast.FC.Phalanx
	sets.precast.FC.Shell = sets.precast.FC.Phalanx
	sets.precast.FC.Crusade = sets.precast.FC.Phalanx

	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
        --neck="Rep. Plat. Medal",
        right_ear="Thrud Earring",
        left_ear="Moonshade Earring",
		left_ring="Regal Ring",
        right_ring="Metamor. Ring +1",
        back=gear.capes.Block,
        waist="Sailfi belt +1",
	}
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Atonement'] = set_combine(sets.enmity,	{
	})
	sets.precast.WS['Aeolian Edge'] = {
		body="Cohort Cloak +1",
		hands="Nyame gauntlets",
		legs="Nyame flanchard",
		feet="Nyame sollerets",
		neck="Sanctity Necklace",
		left_ear="Moonshade earring",
        right_ear="Friomisi Earring",
		left_ring="Regal Ring",
        right_ring="Metamor. Ring +1",
		back=gear.capes.Block,
        waist="Eschan Stone",
	}

	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.SpellInterrupt = {
		ammo="Staunch Tathlum", --10
		head="Souv. Schaller +1", --20
		--body="Nyame mail",
		legs="Founder's Hose", --30
		--hands="Regal Gauntlets", --10
		feet="Odyssean Greaves", --27
		neck="Moonlight Necklace", --15
		left_ear={name="Tuisto Earring", priority=2},
		right_ear={name="Odnowa Earring +1", priority=3},
		--left_ring={name="Moonbeam Ring", bag="wardrobe3", priority=1},
		--right_ring={name="Moonbeam Ring", bag="wardrobe4", priority=4},
		waist="Audumbla sash", --10
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    } --101 +10% from merit points 112sird

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Blue Magic'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    sets.midcast.Cure = set_combine(sets.Enmity, {
    	left_ear="Nourish. Earring +1", --1
    })
	sets.midcast.Protect = set_combine(sets.Enmity, {})
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Flash = set_combine(sets.Enmity, {
    	body=gear.Artifact.Body,
    })
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Poisonga = set_combine(sets.Enmity, {})
	sets.midcast['Sheep Song'] = set_combine(sets.Enmity, {})
    sets.midcast['Reprisal'] = set_combine(sets.Enmity, {
    	--body="Shabti Cuirass +1",
    })

    sets.midcast['Cure IV'] = set_combine(sets.midcast.SpellInterrupt, {
    	left_ear="Nourish. Earring +1", --1
    	hands="Macabre Gaunt. +1",--11CP/7enm
    })
    sets.midcast.Utsusemi = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Divine Magic'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Phalanx'] = set_combine(sets.midcast.SpellInterrupt, {
    	main="Sakpata's Sword",
    	hands="Souv. Handsch. +1",
    	legs="Sakpata's cuisses",
    	--left_ear="Mimir Earring",
    })
    sets.midcast['Banishga'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Raise'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Cursna'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Geist Wall'] = set_combine(sets.midcast.SpellInterrupt,{})
	sets.midcast['Cocoon'] = set_combine(sets.midcast.SpellInterrupt,{})
	sets.midcast['Crusade'] = set_combine(sets.midcast.SpellInterrupt, {})
	sets.midcast['Haste'] = set_combine(sets.midcast.SpellInterrupt, {})
	sets.midcast['Refresh'] = set_combine(sets.midcast.SpellInterrupt, {}) 

	sets.idle = {
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Bathy Choker +1",
		waist="Creed Baudrier",
		left_ear={name="Tuisto Earring", priority=2},
		right_ear={name="Odnowa Earring +1", priority=3},
		left_ring="Gelatinous Ring +1",
		right_ring="Moonbeam Ring",
		back=gear.capes.Block,
	}
	sets.idle.Refresh = set_combine(sets.idle, {
		ammo="Homiliary",
		legs="Carmine Cuisses +1",
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Phlx = set_combine(sets.idle, {
		--main="Sakpata's Sword",--5
	})

	sets.latent_refresh = {}

	sets.engaged = {
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Unmoving Collar +1",
		waist="Creed Baudrier",
		left_ear={name="Tuisto Earring", priority=2},
		right_ear={name="Odnowa Earring +1", priority=3},
		left_ring="Gelatinous Ring +1",
		right_ring="Moonbeam Ring",
		back=gear.capes.Block,
	}

	sets.engaged.Melee = set_combine(sets.engaged, {
		ammo="Coiste Bodhar",
		neck="Sanctity Necklace",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring="Regal Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
	
	sets.AutoBuff.Sleep = {}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end