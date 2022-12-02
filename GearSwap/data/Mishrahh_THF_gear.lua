-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()

    state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', "Rudra's Storm", 'Evisceration', 'Aeolian Edge' }
    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'Default', 'Cento', 'TTwash', 'Tauret', 'AOE', }
    gear.weapons = {}
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Crepuscular Knife",
    }
    gear.weapons['Default'] = {
        main="Twashtar",
        sub="Ternion Dagger +1",
    }
    gear.weapons['Cento'] = {
        main="Twashtar",
        sub="Centovente",
    }
    gear.weapons['TTwash'] = {
        main="Tauret",
        sub="Twashtar",
    }
    gear.weapons['Tauret'] = {
        main="Tauret",
        sub="Gleti's Knife",
    }
    gear.weapons['AOE'] = {
        main="Tauret",
        sub="Malevolence",
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
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = "Skulk. Poulaines +1"

    gear.capes = {}
    gear.capes.TP = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.capes.Crit = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    gear.capes.WSDMG = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = set_combine( gear.TH.Herc, {
        hands=gear.Relic.Hands,
        feet=gear.Empyrean.Feet
    } )

    sets.Kiting = {feet=gear.Artifact.Feet}

    sets.buff['Sneak Attack'] = {}

    sets.buff['Trick Attack'] = {}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


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
        neck="Voltsurge Torque",
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Yetshila",
        head=gear.Adhemar.Head.B,
        neck="Fotia Gorget",
        ear1="Odr Earring",
        ear2="Moonshade Earring",
        body=gear.Relic.Body,
        hands=gear.Adhemar.Hands.B,
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        back=gear.capes.Crit,
        waist="Fotia Belt",
        legs=gear.Artifact.Legs,
        feet=gear.Adhemar.Feet.B
    }
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {

    })

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
        head=gear.Artifact.Head,
        hands=gear.Meghanada.Hands,
        legs=gear.Relic.Legs,
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        back=gear.capes.WSDMG,
    })
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
        head=gear.Artifact.Head,
        hands=gear.Meghanada.Hands,
        legs=gear.Relic.Legs,
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        back=gear.capes.WSDMG,
    })
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})

    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {
        head=gear.Artifact.Head,
        hands=gear.Meghanada.Hands,
        legs=gear.Relic.Legs,
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        back=gear.capes.WSDMG,
    })
    sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})

    sets.precast.WS['Aeolian Edge'] = {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Dingir Ring",
        back=gear.capes.WSDMG,    
    }

    sets.precast.WS['Cyclone'] = set_combine( sets.precast.WS['Aeolian Edge'], sets.TreasureHunter )

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {
        head=gear.Artifact.Head,
        body="Nyame Mail",
        hands=gear.Meghanada.Hands,
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        back=gear.capes.WSDMG,
        ammo="Seeth. Bomblet +1",
        ring2="Gere Ring",
        waist="Sailfi Belt +1"
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
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet=gear.Artifact.Feet,
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        back=gear.capes.TP,
        left_ear="Odnowa Earring +1",
        right_ear="Genmei Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
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
        head=gear.Adhemar.Head.B,
        body=gear.Artifact.Body,
        hands=gear.Adhemar.Hands.B,
        legs="Samnuha Tights",
        feet=gear.Relic.Feet,
        ammo="Aurgelmir Orb",
        neck="Asn. Gorget +1",
        waist="Patentia Sash",
        back=gear.capes.TP,
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        ring1="Gere Ring",
        ring2="Ilabrat Ring",
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
        right_ring="Moonbeam Ring",
    })

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end