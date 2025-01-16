function user_job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'DD' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'MEVA', 'DD', 'Axe' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Epeolatry",
		sub="Utu Grip",
	}

	gear.weapons['MEVA'] = {
		main="Epeolatry",
		sub="Utu Grip",
	}

	gear.weapons['DD'] = {
		main="Lionheart",
		sub="Utu Grip",
	}

	gear.weapons['Axe'] = {
		main="Dolichenus",
		sub="Vampirism",
	}

	gear.weapons['Sword'] = {
		main="Naegling",
		sub="Vampirism",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Dimidiation', 'Decimation' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = {name="Runeist Coat +3",priority=218}
	gear.Artifact.Hands = {name="Runeist Mitons +3",priority=85}
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = {name="Fu. Bandeau +3",priority=56}
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = {name="Futhark Trousers +3",priority=107}
	gear.Relic.Feet = {name="Futhark Boots +2",priority=13}

	gear.Empyrean = {}
	gear.Empyrean.Head = {name="Erilaz Galea +3",priority=91}
	gear.Empyrean.Body = {name="Erilaz Surcoat +3",priority=123}
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = {name="Eri. Leg Guards +3",priority=100}
	gear.Empyrean.Feet = {name="Erilaz Greaves +3",priority=48}

	gear.capes = {}
	gear.capes.ParryTank = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',},priority=60}
	gear.capes.DexWS = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	gear.capes.Utility = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=60}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps
~	Shift
--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

end

function init_gear_sets()
	sets.TreasureHunter = {}
	sets.SIRD = {
		ammo="Staunch Tathlum +1", --11
		head=gear.Empyrean.Head, --20
		neck="Moonlight Necklace", --15
		left_ear="Magnetic Earring", --8
		right_ear={name="Halasz Earring",priority=0},--5
		body={name="Nyame Mail",priority=91},
		--hands={name="Rawhide Gloves",priority=75},--15
		hands={name="Regal Gauntlets",priority=205},--10
		left_ring={name="Defending Ring",priority=0},
		right_ring={name="Gelatinous Ring +1",priority=110},
		back=gear.capes.Utility,--10
		waist={name="Audumbla Sash",priority=0},--10
		legs={name="Carmine Cuisses +1",priority=130},--20
		feet=gear.Empyrean.Feet,
		--feet=gear.Taeon.Feet.SIRD,
	}
	sets.Enmity = {
		ammo={name="Sapience Orb",priority=0},
		--head="Halitus Helm",
		neck={name="Moonlight Necklace",priority=0},
		--ear1="Trux Earring",
		ear2={name="Cryptic Earring",priority=40},
		body={name="Emet Harness +1",priority=61},
		--hands="Kurys Gloves",
		ring1={name="Vengeful Ring",priority=20},
		ring2={name="Supershear Ring",priority=30},
		back=gear.capes.ParryTank,
		waist={name="Kasiri Belt",priority=30},
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	}

	sets.precast.JA['Lux'] = sets.Enmity
	sets.precast.JA['Lux'] = sets.Enmity
	sets.precast.JA['Tenebrae'] = sets.Enmity
	sets.precast.JA['Ignis'] = sets.Enmity
	sets.precast.JA['Gelus'] = sets.Enmity
	sets.precast.JA['Flabra'] = sets.Enmity
	sets.precast.JA['Tellus'] = sets.Enmity
	sets.precast.JA['Sulpor'] = sets.Enmity

	sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{
		legs=gear.Relic.Legs,
	})
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{
		body=gear.Artifact.Body,
		legs=gear.Relic.Legs,
	})
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Valiance'] = set_combine(sets.Enmity,{
		body=gear.Artifact.Body,
		legs=gear.Relic.Legs,
		back=gear.capes.ParryTank,
	})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity,{
		body=gear.Relic.Body,
	})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{
		head=gear.Relic.Head,
	})
	sets.precast.JA['Swipe'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Lunge'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{
		hands=gear.Artifact.Hands,
	})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{
		feet=gear.Relic.Feet,
	})
	
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Odyllic Subterfuge'] = set_combine(sets.Enmity,{})
	sets.precast.JA['One for All'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{
		body=gear.Relic.Body,
	})

	sets.precast.FC = {
		ammo="Impatiens", --2
		head={name="Carmine Mask +1", priority=38}, --14
		neck="Baetyl Pendant", --4
		left_ear={name="Etiolation Earring", priority=50}, --1
		body=gear.Empyrean.Body,--10
		hands={name="Leyline Gloves",priority=25},--8
		left_ring=gear.rings['Moonlight L'],
		right_ring=gear.rings['Moonlight R'],
		back=gear.capes.Utility,--10
		legs={name="Agwu's Slops",priority=50},--7
		feet={name="Carmine Greaves +1",priority=95},--8
    }

	sets.precast.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Sroda Ring",
        right_ring="Niqmaddu Ring",
        back=gear.capes.DexWS,
	}
    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo="Knobkierre",
		neck="Rep. Plat. Medal",
        waist="Kentarch Belt +1",
        left_ring="Regal Ring",
        right_ear="Odr Earring"
    })

	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS,{
        left_ear="Odr Earring"
    })

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS,{
		ammo="Seething Bomblet +1",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		left_ring="Medada's Ring",
		right_ring="Metamor. Ring +1",
    })

	sets.midcast = {}
	sets.midcast.FastRecast = sets.Enmity

	sets.midcast['Banishga'] = sets.SIRD
	sets.midcast['Poisonga'] = sets.SIRD

	sets.midcast['Enhancing Magic'] = set_combine(sets.SIRD,{
		head=gear.Empyrean.Head,
		hands="Regal Gauntlets",
		legs=gear.Relic.Legs,
		waist="Gishdubar Sash",
	})
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		head=gear.Relic.Head,
	})

	sets.idle = {
		ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", priority=91, augments={'Path: B',}},
		body={ name="Nyame Mail", priority=138, augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", priority=91, augments={'Path: B',}},
        legs={name="Carmine Cuisses +1",priority=130},
        feet={ name="Nyame Sollerets", priority=68, augments={'Path: B',}},
        neck={name="Warder's Charm +1",priority=0},
        waist="Engraved Belt",
        left_ear={name="Eabani Earring",priority=45},
        right_ear={ name="Erilaz Earring +1",},
        left_ring="Warp Ring",
        right_ring=gear.rings['Moonlight R'],
        back=gear.capes.ParryTank,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", priority=91, augments={'Path: B',}},
		body={ name="Nyame Mail", priority=138, augments={'Path: B',}},
		hands={ name="Turms Mittens +1", priority=74},
		legs=gear.Empyrean.Legs,
		feet={ name="Turms Leggings +1", priority=76},
		neck={ name="Futhark Torque +2", priority=60, augments={'Path: A',}},
		waist={ name="Plat. Mog. Belt", priority=100},
		left_ear={ name="Etiolation Earring", priority=50},
		right_ear={ name="Odnowa Earring +1", priority=100, augments={'Path: A',}},
		left_ring={ name="Defending Ring", priority=0},
		right_ring=gear.rings['Moonlight R'],
		back=gear.capes.ParryTank,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.DD = set_combine(sets.engaged, {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head=gear.Adhemar.Head.B,
		body=gear.Adhemar.Body.A,
		hands="Turms Mittens +1",
		legs=gear.Empyrean.Legs,
		feet="Turms Leggings +1",
		neck="Sanctity Necklace",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back=gear.capes.ParryTank,
	})
end