-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
    state.WeaponskillMode:options( 'Normal', 'PROC', 'Buffed' )

    state.MainWS = M{['description'] = 'Main Weaponskill', "Rudra's Storm", 'Evisceration', 'Aeolian Edge', 'Savage Blade', }
    state.Weapons = M{['description'] = 'Weapon Setup',  'Default', 'TH', 'Tauret', 'Savage',}
    gear.weapons = {}

    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Centovente",
    }
    gear.weapons['Default'] = {
        main="Twashtar",
        sub="Gleti's Knife",
    }
    gear.weapons['Tauret'] = {
        main="Tauret",
        sub="Gleti's Knife",
    }
    gear.weapons['TH'] = {
        main="Gandring",
        sub="Gleti's Knife",
    }


    gear.Artifact = {}
    gear.Artifact.Head = "Pill. Bonnet +3"
    gear.Artifact.Body = "Pillager's Vest +3"
    gear.Artifact.Hands = "Pill. Armlets +2"
    gear.Artifact.Legs = "Pill. Culottes +3"
    gear.Artifact.Feet = "Pill. Poulaines +3"

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = "Plunderer's Vest +3"
    gear.Relic.Hands = "Plun. Armlets +1"
    gear.Relic.Legs = "Plun. Culottes +3"
    gear.Relic.Feet = "Plun. Poulaines +2"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Skulker's Bonnet +3"
    gear.Empyrean.Body = "Skulker's Vest +3"
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = "Skulk. Culottes +3"
    gear.Empyrean.Feet = "Skulk. Poulaines +3"

    gear.capes = {}
    gear.capes.TP = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.capes.Crit = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    gear.capes.WSDMG = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    gear.capes.STRWSDMG = { name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.capes.MAGWSDMG = { name="Toutatis's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = set_combine( gear.TH.Herc, {
        --hands=gear.Relic.Hands,
        feet=gear.Empyrean.Feet
    } )

    sets.Kiting = {feet=gear.Artifact.Feet}

    sets.buff['Sneak Attack'] = {}

    sets.buff['Trick Attack'] = {}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    --sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
    --sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
    sets.precast.JA['Flee'] = {
        feet=gear.Artifact.Feet
    }
    --sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    --sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
    --sets.precast.JA['Steal'] = {head="Plunderer's Bonnet",hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
    --sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
    --sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    --sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = { }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {
        head=gear.Herc.Head.TH,
        hands="Leyline Gloves",
        ammo="Impatiens",
        neck="Baetyl Pendant",
        left_ring="Weather. Ring +1",
        right_ring="Medada's Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        neck="Fotia Gorget",
        ear1="Odr Earring",
        ear2="Moonshade Earring",
        body=gear.Relic.Body,
        hands="Gleti's Gauntlets",
        ring1="Regal Ring",
        ring2="Begrudging Ring",
        back=gear.capes.Crit,
        waist="Fotia Belt",
        legs=gear.Empyrean.Legs,
        feet=gear.Adhemar.Feet.B
    }
    sets.precast.WS.Buffed = set_combine(sets.precast.WS, {
        head=gear.Empyrean.Head,
        ear1="Mache Earring +1",
       -- hands="Gleti's Gauntlets",
        ring2="Gere Ring",
        --legs="Gleti's Breeches",
        --feet="Gleti's Boots",
    })
    sets.precast.WS.PROC = set_combine(sets.precast.WS, {
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Chirich Ring +1",
        back="Archon Cape",
    })

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body=gear.Empyrean.Body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +2",
        waist="Kentarch Belt +1",
        back=gear.capes.WSDMG,
        ring2="Ilabrat Ring",
    })
    sets.precast.WS["Rudra's Storm"].Buffed = set_combine(sets.precast.WS["Rudra's Storm"], {
        ammo="Crepuscular Pebble",
        head=gear.Empyrean.Head,
        --hands="Gleti's Gauntlets",
        --legs="Gleti's Breeches",
        ear1="Odr Earring",
        ring2="Epaminondas's Ring",
    })

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS["Rudra's Storm"], {
        waist="Sailfi Belt +1",
    })

    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS["Rudra's Storm"], {
    })

    sets.precast.WS['Sanguine Blade'] = {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Archon Ring",
        back=gear.capes.MNDWS,
    }

    sets.precast.WS['Aeolian Edge'] = {
        ammo="Ghastly Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Medada's Ring",
        right_ring="Dingir Ring",
        back=gear.capes.MAGWSDMG,    
    }
    sets.precast.WS['Aeolian Edge'].PROC = {
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Cacoethic Ring +1",
        right_ring="Chirich Ring +1",
        back="Archon Cape",
    }

    sets.precast.WS['Cyclone'] = set_combine( sets.precast.WS['Aeolian Edge'], sets.TreasureHunter )

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {
        head="Nyame Helm",
        body=gear.Empyrean.Body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        back=gear.capes.STRWSDMG,
        ammo="Coiste Bodhar",
        ring2="Beithir Ring",
        ear1="Telos Earring",
        waist="Sailfi Belt +1"
    })
    sets.precast.WS["Savage Blade"].Buffed = set_combine(sets.precast.WS["Savage Blade"], {
        ammo="Crepuscular Pebble",
        head=gear.Empyrean.Head,
        --hands="Gleti's Gauntlets",
        neck="Asn. Gorget +2",
        waist="Kentarch Belt +1",
        right_ear="Skulker's Earring +1",
        ring1="Sroda Ring",
    })

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
    sets.midcast.Utsusemi = {}

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet=gear.Artifact.Feet,
        neck="Bathy Choker +1",
		waist="Engraved Belt",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
		left_ring="Defending Ring",
        right_ring="Warp Ring",
        back=gear.capes.TP,
    }

    sets.idle.Town = set_combine(sets.idle,{})

    sets.idle.Weak = set_combine(sets.idle,{})


    -- Defense sets

    sets.defense.Evasion = {}

    sets.defense.PDT = {}

    sets.defense.MDT = {}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
        head=gear.Empyrean.Head,
        body="Malignance Tabard",
        hands=gear.Adhemar.Hands.B,
        legs="Gleti's Breeches",
        feet="Malignance Boots",
        ammo="Aurgelmir Orb +1",
        neck="Asn. Gorget +2",
        waist="Reiki Yotai",
        back=gear.capes.TP,
        left_ear="Sherida Earring",
        right_ear="Skulker's Earring +1",
        left_ring="Gere Ring",
        right_ring="Moonlight Ring",
    }
    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.Evasion = set_combine(sets.engaged, {

    })

    sets.engaged.PDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
    })

    sets.engaged.MDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
    })

    sets.HP = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={name="Moonlight Ring",priority=110},
		right_ring={name="Moonlight Ring",priority=110},
    }

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 20)
end