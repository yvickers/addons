function user_job_setup()
	state.OffenseMode:options( 'Tank', 'Melee', 'NinetyNine' )
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Naegling' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Sakpata's Sword",
		sub="Duban",
	}

	gear.weapons['Naegling'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}

	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Chant du Cygne' }

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = {name="Rev. Surcoat +3",priority=254}
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
	gear.Empyrean.Head = { name="Chev. Armet +3", priority=145 }
	gear.Empyrean.Body = { name="Chev. Cuirass +2", priority=141 }
	gear.Empyrean.Hands = { name="Chev. Gauntlets +3", priority=54 }
	gear.Empyrean.Legs = { name="Chev. Cuisses +3", priority=127 }
	gear.Empyrean.Feet = { name="Chev. Sabatons +3", priority=52 }

	gear.capes.FastCast = { name="Rudianos's Mantle", priority=60, augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	gear.capes.Block = { name="Rudianos's Mantle", priority=60, augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}}
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
		ammo= {name="Sapience orb"}, --2
		head= { name="Souv. Schaller +1", priority=280 }, --9
		body= { name="Souv. Cuirass +1", priority=171 }, --20
		hands= { name="Souv. Handsch. +1", priority=239 }, --9
		legs= { name="Souv. Diechlings +1", priority=162 }, --9
		feet= { name="Eschite Greaves", priority=98 }, --15
		neck= { name="Moonlight Necklace", }, --15
		right_ear= { name="Cryptic Earring", priority=40 }, --4
		--left_ear= { name="Friomisi Earring", }, --2
		left_ring= { name="Supershear Ring", priority=30 }, --5
		right_ring= { name="Begrudging Ring", }, --5
		back=gear.capes.Block, --10
		--waist={name="Creed Baudrier", priority=40 }, --5
    } --108

    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{
    	--body=gear.Relic.Body,
    })
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{
		--feet=gear.Relic.Feet,
	})
	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity,{
		head={name="Nyame Helm", priority=91},
		body=gear.Artifact.Body,
		hands={name=gear.Relic.Hands, priority=114},
		legs={name="Nyame Flanchard", priority=114},
		feet={name="Nyame Sollerets", priority=68},
	})
	sets.precast.JA['Chivalry'] = set_combine(sets.Enmity,{
		hands={name=gear.Relic.Hands, priority=114},
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
		ammo={name="Sapience Orb",}, --2
		head=gear.Empyrean.Head,--8
		head={name="Sakpata's Helm", priority=91}, -- 8
		body=gear.Artifact.Body, --10
		--hands={name="Leyline Gloves", priority=25}, --7
		--legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+4','"Fast Cast"+5','AGI+8',}}, --5
		feet=gear.Empyrean.Feet, --10
		back=gear.capes.FastCast, --10
		--neck={name="Baetyl Pendant",}, --5
		right_ear={name="Etiolation earring", priority=50}, --1
		left_ring={name="Medada's Ring",}, --10
		right_ring={name="Weather. Ring +1",}, --6
	}
	sets.precast.FC.DT = set_combine(sets.precast.FC, {
    })

	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
        neck="Rep. Plat. Medal",
        right_ear="Thrud Earring",
        left_ear="Moonshade Earring",
		left_ring="Regal Ring",
        right_ring="Metamor. Ring +1",
        back=gear.capes.Block,
        waist="Sailfi belt +1",
	}
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Crep. Pebble",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Guantlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        right_ear="Thrud Earring",
        left_ear="Moonshade Earring",
		left_ring="Regal Ring",
        right_ring="Sroda Ring",
        back=gear.capes.Block,
        waist="Sailfi belt +1",
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

	sets.midcast.SpellInterrupt = {
		ammo={name="Staunch Tathlum +1",}, --11
		head={name="Souv. Schaller +1",priority=280}, --20
		legs={name="Founder's Hose",priority=54}, --30
		hands={name="Regal Gauntlets",priority=205}, --10
		feet={name="Odyssean Greaves",priority=20}, --27
		--only use these below if you need to shore up a difference
		--body=gear.Empyrean.Body,--15
		--neck={name="Moonlight Necklace",}, --15
		--left_ear={ name="Nourish. Earring +1", augments={'Path: A',}, },
		--right_ear={name="Halasz Earring",},
		--left_ring={name="Evanescence Ring",},
		--waist={name="Audumbla sash",}, --10
		back=gear.capes.Block,
    } --123 +10% from merit points 133 sird

    sets.midcast['Enhancing Magic'] = set_combine(sets.Enmity, {
		hands={name="Regal Gauntlets",priority=205},
	})
	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.SpellInterrupt, {

	})

	sets.midcast['Enfeebling Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Enfeebling Magic'].SIRD = set_combine(sets.Enmity, {})

	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
    sets.midcast['Blue Magic'].SIRD = sets.Enmity

	sets.midcast.Cure = set_combine(sets.Enmity, {
    	--right_ear="Nourish. Earring +1", --1
		hands={name="Macabre Gaunt. +1",priority=29},--11CP/7enm
    })
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.SpellInterrupt, {
    	--right_ear="Nourish. Earring +1", --1
		hands={name="Macabre Gaunt. +1",priority=29},--11CP/7enm
    })

	sets.midcast.Protect = set_combine(sets.Enmity, {})

	sets.midcast.Shell = sets.midcast.Protect

	sets.midcast.Flash = set_combine(sets.Enmity, {
    	body=gear.Artifact.Body,
    })
	sets.midcast.Flash.SIRD = set_combine(sets.midcast.SpellInterrupt, {
    	body=gear.Artifact.Body,
    })

	sets.midcast.Stun = set_combine(sets.Enmity, {})

	sets.midcast.Poisonga = set_combine(sets.Enmity, {})

	sets.midcast['Sheep Song'] = set_combine(sets.Enmity, {})
	sets.midcast['Sheep Song'].SIRD = set_combine(sets.Enmity, sets.midcast.SpellInterrupt, {})

	sets.midcast['Reprisal'] = set_combine(sets.Enmity, {
    	--body="Shabti Cuirass +1",
    })
	sets.midcast['Reprisal'].SIRD = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {
    	--body="Shabti Cuirass +1",
    })

	sets.midcast.Utsusemi = set_combine(sets.Enmity, {})
	sets.midcast.Utsusemi.SIRD = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {})

	sets.midcast['Divine Magic'] = set_combine(sets.Enmity,{})
	sets.midcast['Divine Magic'].SIRD = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {})

	sets.midcast['Phalanx'] = set_combine(sets.Enmity, {
    	main="Sakpata's Sword",
    	hands="Souv. Handsch. +1",
    	legs="Sakpata's cuisses",
    	right_ear="Mimir Earring",
    })
	sets.midcast['Phalanx'].SIRD = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {
		main="Sakpata's Sword",
    	hands="Souv. Handsch. +1",
    	right_ear="Mimir Earring",
	})

	sets.midcast['Banishga'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt,{})
    sets.midcast['Raise'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt,{})
    sets.midcast['Cursna'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {})
    sets.midcast['Geist Wall'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt,{})
	sets.midcast['Cocoon'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt,{})
	sets.midcast['Crusade'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {})
	sets.midcast['Haste'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {})
	sets.midcast['Refresh'] = set_combine(sets.Enmity,sets.midcast.SpellInterrupt, {}) 

	sets.idle = {
		ammo={name="Staunch Tathlum +1",},
		head=gear.Empyrean.Head,
		body={name="Sakpata's Plate", priority=136},
		hands={name="Sakpata's Gauntlets", priority=91},
		legs=gear.Empyrean.Legs,
		feet={name="Sakpata's Leggings", priority=68},
		neck={name="Unmoving Collar +1", priority=200},
		waist={name="Plat. Mog. Belt", priority=300},
		left_ear={name="Tuisto Earring", priority=150},
		right_ear={name="Eabani Earring", priority=45},
		left_ring={name="Moonlight Ring",priority=110},
		right_ring={name="Moonlight Ring",priority=110},
		back=gear.capes.Block,
	}
	sets.idle.Refresh = set_combine(sets.idle, {
		ammo="Homiliary",
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Phlx = set_combine(sets.idle, {
		--main="Sakpata's Sword",--5
	})

	sets.latent_refresh = {}

	sets.engaged = {
		ammo={name="Staunch Tathlum +1",},
		head={name="Sakpata's Helm", priority=91},
		body={name="Sakpata's Plate", priority=136},
		hands={name="Sakpata's Gauntlets", priority=91},
		legs={name="Sakpata's Cuisses", priority=114},
		feet={name="Sakpata's Leggings", priority=68},
		neck={name="Unmoving Collar +1", priority=200},
		waist={name="Creed Baudrier", priority=40},
		left_ear={name="Tuisto Earring", priority=150},
		right_ear={name="Eabani Earring", priority=110},
		left_ring={name="Moonlight Ring",priority=110},
		right_ring={name="Moonlight Ring",priority=110},
		back=gear.capes.Block,
	}

	sets.engaged.Melee = set_combine(sets.engaged, {
		ammo="Coiste Bodhar",
		neck="Sanctity Necklace",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.engaged.NinetyNine = set_combine(sets.engaged, {
		head="Perle Salade",
		body="Perle Salade",
		hands="Perle Salade",
		legs="Perle Salade",
		feet="Perle Salade",
		back="Solemnity Cape",
	})
	
	sets.AutoBuff.Sleep = {}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end