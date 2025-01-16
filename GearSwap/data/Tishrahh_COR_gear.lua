function user_job_setup()

	state.Bullet = M{['description']='Bullet', '', 'Bronze Bullet'}
    state.QDBullet = M{['description']='Quick Draw Bullet', 'Hauksbok Bullet'}

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Hot Shot', }

	gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Relic = {}
    gear.Relic.Head = "Lanun Tricorne +2"
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = "Chasseur's Gants +3"
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = ""

    gear.capes = {}
    gear.capes.MeleeTP = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.capes.MeleeWS = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.capes.PhantomRoll = gear.capes.MeleeWS
    gear.capes.RngMagicalWS = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+3','Weapon skill damage +10%',}}
    gear.capes.RngTPCape = gear.capes.RngMagicalWS
    gear.capes.RngPhysicalWS = gear.capes.RngMagicalWS

    gear.weapons = {}
    --match key to state.weapons options
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Tauret",
        ranged="Anarchy",
        ammo="Bronze Bullet",
    }

end

function init_gear_sets()
	sets.precast.CorsairRoll = {
        main="Lanun Knife",
        ranged = "Compensator",
        head=gear.Relic.Head,
        hands=gear.Empyrean.Hands,
        --legs="Desultor Tassets",
        --neck="Regal Necklace",
        --left_ring="Barataria Ring",
        right_ring="Barataria Ring",
        back=gear.capes.PhantomRoll,
    }
    sets.precast.JA['Double-Up'] = sets.precast.CorsairRoll;
    sets.precast.JA['Snake Eye'] = {legs=gear.Relic.Legs}
    sets.precast.JA['Wild Card'] = {feet=gear.Relic.Feet}
    sets.precast.JA['Random Deal'] = {body=gear.Relic.Body}
    sets.precast.JA["Blitzer's Roll"] = {head=gear.Empyrean.Head}
    sets.precast.JA["Tactician's Roll"] = {body=gear.Empyrean.Body}
    sets.precast.FoldDoubleBust = {hands=gear.Relic.Hands}    
    sets.precast.Compensator = { main="Lanun Knife",ranged = "Compensator" }

    sets.precast.FC = {
        --head=gear.Herc.Head.TH,
        --ear2="Loquacious Earring",
        ear1="Etiolation Earring",
        hands="Leyline Gloves",
        --legs="Rawhide Trousers",
        --feet="Crimson Greaves",
        neck="Voltsurge Torque",
        ring1="Lebeche Ring",
        ring2="Medada's Ring",
    }

    sets.precast.RA = {}
    sets.precast.RA.Flurry1 = set_combine( sets.precast.RA, {})
    sets.precast.RA.Flurry2 = set_combine( sets.precast.RA.Flurry1, {})

    sets.precast.WS = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands=gear.Empyrean.Hands,
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Chas. Earring +2",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Begrudging Ring",
    }

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
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

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS, {
        left_ring="Ilabrat Ring",
        right_ring="Cacoethic Ring +1",
        back=gear.capes.RngMagicalWS,
    })

    sets.precast.WS['Wildfire'] = set_combine( sets.precast.WS['Leaden Salute'], {})

    sets.precast.WS['Hot Shot'] = set_combine( sets.precast.WS['Leaden Salute'], {})

    sets.midcast.CorsairShot = {}

    sets.midcast.CorsairShot['Light Shot'] = set_combine( sets.midcast.CorsairShot,{})

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']

    sets.midcast.RA = {}

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Nyame Gauntlets",
        legs="Carmine Cuisses +1",
        feet="Nyame Sollerets",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        neck="Loricate Torque +1",
        waist="Engraved Belt",
        left_ear="Etiolation Earring",
        right_ear="Eabani Earring",
        back=gear.capes.MeleeTP,
    }

    sets.engaged.Melee = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Volte Tights",
        feet="Volte Spats",
        neck="Sanctity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Ilabrat Ring",
        right_ring="Cacoethic Ring +1",
        back=gear.capes.MeleeTP,
    }
    sets.engaged.Acc = set_combine( sets.engaged.Melee, {
    })
    sets.engaged.PDT = set_combine( sets.engaged.Melee, {
    })
    sets.engaged.MDT = set_combine( sets.engaged.Melee, {
    })
end

function select_default_macro_book()
	set_macro_page(1, 4)
end