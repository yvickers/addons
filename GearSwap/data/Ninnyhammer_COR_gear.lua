function user_job_setup()
    state.IdleMode:options( 'Normal', 'Zeni', 'Regain' )

	state.Bullet = M{['description']='Bullet', 'Living Bullet', 'Chrono Bullet', }
    state.QDBullet = M{['description']='Quick Draw Bullet', 'Hauksbok Bullet'}

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'Death Penalty', 'Zeni', 'AE', 'AE Death Penalty', 'Dummy2', 'Fomalhaut' }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Leaden Salute', 'Last Stand', 'Aeolian Edge', 'Hot Shot', }
    state.CompensatorMode = M{['description'] = 'Compensator Mode', 'Always', 'Never','300','1000',}

	gear.Artifact = {}
    gear.Artifact.Head = {}
    gear.Artifact.Body = "Laksa. Frac +3"
    gear.Artifact.Hands = {}
    gear.Artifact.Legs = "Lak. Trews +1"
    gear.Artifact.Feet = {}

    gear.Relic = {}
    gear.Relic.Head = "Lanun Tricorne +1"
    gear.Relic.Body = "Lanun Frac +3"
    gear.Relic.Hands = "Lanun Gants +3"
    gear.Relic.Legs = "Lanun Trews +1"
    gear.Relic.Feet = "Lanun Bottes +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Chass. Tricorne +3"
    gear.Empyrean.Body = "Chasseur's Frac +3"
    gear.Empyrean.Hands = "Chasseur's Gants +3"
    gear.Empyrean.Legs = "Chas. Culottes +3"
    gear.Empyrean.Feet = "Chasseur's Bottes +3"

    gear.capes = {}
    gear.capes.MeleeTP = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.capes.MeleeWS = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.capes.PhantomRoll = { name="Camulus's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Snapshot"+10','Evasion+15',}}
    gear.capes.RngMagicalWS = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
    gear.capes.RngTPCape = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
    gear.capes.RngPhysicalWS =  { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
    gear.capes.INTWS = { name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}

    gear.weapons = {}
    --match key to state.weapons options
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Demers. Degen +1",
        ranged="Anarchy +2",
        ammo=state.Bullet.current,
    }
    gear.weapons['Death Penalty'] = {
        main="Naegling",
        sub="Tauret",
        ranged="Death Penalty",
        ammo=state.Bullet.current,
    }
    gear.weapons['Fomalhaut'] = {
        main="Naegling",
        sub="Tauret",
        ranged="Fomalhaut",
        ammo="Chrono Bullet",
    }
    gear.weapons['AE'] = {
        main="Tauret",
        sub="Naegling",
        ranged="Anarchy +2",
        ammo="Hauksbok Bullet",
    }
    gear.weapons['AE Death Penalty'] = {
        main={ name="Rostam", augments={'Path: B',}},
        sub="Tauret",
        ranged="Death Penalty",
        ammo=state.Bullet.current,
    }
    gear.weapons['Zeni'] = {
        main="Gleti's Knife",
        sub="Demers. Degen +1",
        range="Soultrapper 2000",
		ammo="Blank Soulplate",
    }
    gear.weapons['Dummy2'] = {
        main="Gleti's Knife",
        sub="Demers. Degen +1",
    }

    state.TreasureMode:set('Tag')

end

function init_gear_sets()
    sets.AutoBuff.sleep = {
		--ranged="Prime Gun",
	}
    
    sets.TreasureHunter = {
        head={ name="Herculean Helm", augments={'Attack+4','STR+3','"Treasure Hunter"+1','Accuracy+9 Attack+9',}},
        legs={ name="Herculean Trousers", augments={'Accuracy+10','Attack+19','"Treasure Hunter"+2','Accuracy+4 Attack+4',}},
        waist="Chaac Belt",
    }

	sets.precast.CorsairRoll = {
        main={ name="Rostam", augments={'Path: C',}},
        ranged="Compensator",
        head=gear.Relic.Head,
        hands=gear.Empyrean.Hands,
        --legs="Desultor Tassets",
        --neck="Regal Necklace",
        right_ring="Luzaf's Ring",
        left_ring="Defending Ring",
        back=gear.capes.PhantomRoll,
    }
    sets.precast.JA['Double-Up'] = sets.precast.CorsairRoll;
    sets.precast.JA['Snake Eye'] = {legs=gear.Relic.Legs}
    sets.precast.JA['Wild Card'] = {feet=gear.Relic.Feet}
    sets.precast.JA['Random Deal'] = {body=gear.Relic.Body}
    sets.precast.JA["Blitzer's Roll"] = {head=gear.Empyrean.Head}
    sets.precast.JA["Tactician's Roll"] = {body=gear.Empyrean.Body}
    sets.precast.FoldDoubleBust = {hands=gear.Relic.Hands}    
    sets.precast.Compensator = {
        main={ name="Rostam", augments={'Path: C',}},
        ranged = "Compensator",
    }

    sets.precast.FC = {
        head={ name="Herculean Helm", augments={'Attack+4','STR+3','"Treasure Hunter"+1','Accuracy+9 Attack+9',}},
        --ear2="Loquacious Earring",
        ear1="Etiolation Earring",
        hands="Leyline Gloves",
        --legs="Rawhide Trousers",
        --feet="Crimson Greaves",
        neck="Voltsurge Torque",
        ring1="Lebeche Ring",
    }

    sets.precast.RA = {
        head=gear.Empyrean.Head,
        body=gear.Artifact.Body,
        hands="Carmine Fin. Ga. +1",
        legs=gear.Empyrean.Legs,
        feet=gear.Meghanada.Feet,
        neck="Comm. Charm +2",
        waist="Ponente Sash",
        --left_ring="Crepuscular Ring",
        right_ring="Dingir Ring",
        back=gear.capes.PhantomRoll,
    }
    sets.precast.RA.Flurry1 = set_combine( sets.precast.RA, {})
    sets.precast.RA.Flurry2 = set_combine( sets.precast.RA.Flurry1, {})

    sets.precast.WS = {
        head="Nyame Helm",
        body=gear.Artifact.Body,
        hands=gear.Empyrean.Hands,
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        back=gear.capes.MeleeWS,
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Sroda Ring",
        right_ring="Karieyh Ring",
    }

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Savage Blade'].Buffed = set_combine(sets.precast.WS['Savage Blade'], {
        body="Ikenga's Vest",
    })

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        --head=gear.Adhemar.Head.B,
        --neck="Fotia Gorget",
        --waist="Fotia Belt",
        --ear1="Telos Earring",
    })

    sets.precast.WS['Evisceration'] = set_combine( sets.precast.WS, {
        --head=gear.Adhemar.Head.B,
        --body=gear.Mummu.Body,
        --hands=gear.Mummu.Hands,
        --legs=gear.Mummu.Legs,
        --feet=gear.Mummu.Feet,
        --neck="Fotia Gorget",
        --waist="Fotia Belt",
        --ring2="Mummu Ring",
        --ear1="Odr Earring",
    })

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        ammo="Hauksbok Bullet",
        head="Nyame Helm",
        neck="Sibyl Scarf",
        ear1="Friomisi Earring",
        ear2="Moonshade Earring",
        body=gear.Relic.Body,
        hands="Nyame Gauntlets",
        left_ring="Dingir Ring",
        right_ring="Karieyh Ring",
        back=gear.capes.INTWS,
        waist="Orpheus's Sash",
        legs="Nyame Flanchard",
    	feet=gear.Relic.Feet
    })

    sets.precast.WS['Leaden Salute'] = {
        head="Pixie Hairpin +1",
        neck="Comm. Charm +2",
        ear1="Friomisi Earring",
        ear2="Hermetic Earring",
        body=gear.Relic.Body,
        hands="Nyame Gauntlets",
        left_ring="Dingir Ring",
        right_ring="Archon Ring",
        back=gear.capes.RngMagicalWS,
        waist="Orpheus's Sash",
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet
    }

    sets.precast.WS['Wildfire'] = set_combine( sets.precast.WS['Leaden Salute'], {
        head="Nyame Helm",
        right_ring="Ilabrat Ring",
    })

    sets.precast.WS['Hot Shot'] = set_combine( sets.precast.WS['Leaden Salute'], {
        head="Nyame Helm",
        hands=gear.Empyrean.Hands,
        right_ring="Ilabrat Ring",
    })

    sets.precast.WS['Last Stand'] = {
        head="Nyame Helm",
        body=gear.Artifact.Body,
        hands=gear.Empyrean.Hands,
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet,
        neck="Comm. Charm +2",
        ear1="Beyla Earring",
        ear2="Enervating Earring",
        left_ring="Dingir Ring",
        right_ring="Ilabrat Ring",
        back=gear.capes.RngPhysicalWS,
        waist="Elanid Belt",
    }

    sets.midcast.CorsairShot = {
        head=gear.Empyrean.Head,
        body=gear.Relic.Body,
        hands="Nyame Gauntlets",
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Comm. Charm +2",
        ear1="Friomisi Earring",
        ear2="Hermetic Earring",
        right_ring="Dingir Ring",
        left_ring="Lehko's Ring",
        back=gear.capes.RngMagicalWS,
        waist="Orpheus's Sash",
    }

    sets.midcast.CorsairShot['Light Shot'] = set_combine( sets.midcast.CorsairShot,{
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        --neck="Sanctity Necklace",
        --back=gear.capes.QDTPCape,
        --ring1="Regal Ring",
        --ring2="Crepuscular Ring",
        --ear1="Crep. Earring",
        --ear2="Telos Earring",
        --waist="K. Kachina Belt +1",
    })

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']

    sets.midcast.RA = {
        --head="Ikenga's Hat",
        --body="Malignance Tabard",
        --hands="Malignance Gloves",
        --legs="Ikenga's Trousers",
        --feet="Malignance Boots",
        --neck="Iskur Gorget",
        --ear1="Telos Earring",
        --ear2="Crep. Earring",
        --ring1="Crepuscular Ring",
        --ring2="Ilabrat Ring",
        --back=gear.capes.RngLeadenCape,
        --waist="Yemaya Belt",
        head=gear.Meghanada.Head,
		body="Nisroch Jerkin",
		hands=gear.Meghanada.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Sanctity Necklace",
		waist="Elanid Belt",
		left_ear="Beyla Earring",
		right_ear="Enervating Earring",
		left_ring="Meghanada Ring",
		right_ring="Ilabrat Ring",
        back=gear.capes.RngTPCape,
    }
    sets.TripleShot ={
        body=gear.Empyrean.Body,
        hands=gear.Relic.Hands,
    }

    sets.midcast.ElementalNinjutsu = {
        --ammo="Ghastly Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		back=gear.capes.RngMagicalWS,
		waist="Orpheus's Sash",
		--left_ear="Heacate's Earring",
		right_ear="Friomisi Earring",
		right_ring="Dingir Ring",
    }

    sets.idle = {
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands="Nyame Gauntlets",
        legs="Carmine Cuisses +1",
        feet="Nyame Sollerets",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        neck="Loricate Torque +1",
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        back=gear.capes.MeleeTP,
    }
    sets.idle.Zeni = set_combine(sets.idle, {
		range="Soultrapper 2000",
		ammo="Blank Soulplate",
	})
    sets.idle.Regain = set_combine(sets.idle, {
        neck="Rep. Plat. Medal",
        right_ring="Karieyh Ring",
    })

    sets.engaged.Melee = {
        head=gear.Empyrean.Head,
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs=gear.Empyrean.Legs,
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Sailfi Belt +1",
        left_ear="Suppanomimi",
        right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Crit.hit rate+5',}},
        left_ring="Lehko's Ring",
        right_ring="Chirich Ring +1",
        back=gear.capes.MeleeTP,
    }
    sets.engaged.PDT = set_combine( sets.engaged.Melee, {
    })
    sets.engaged.MDT = set_combine( sets.engaged.Melee, {
    })
end

function select_default_macro_book()
	set_macro_page(1, 4)
end