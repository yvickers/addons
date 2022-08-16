-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
state.AutoWSTP = M{['description'] = 'AutoWSTP', 1500, }
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Shark Bite', 'Evisceration', 'Aeolian Edge' }
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'AOE', }
    gear.weapons = {}
    gear.weapons['Default'] = {
        main="Tauret",
        sub="Sandung",
    }
    gear.weapons['AOE'] = {
        main="Tauret",
        sub="Acrontica",
    }

    gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = "Pillager's Poulaines"

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = "Plun. Armlets +1"
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = "Skulk. Poulaines +1"

    gear.capes = {}
    gear.capes.TP = "" --{ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.capes.Crit = "" --{ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    gear.capes.WSDMG = "" --{ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

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

    sets.Kiting = {
        feet=gear.Artifact.Feet
    }

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
        --head=gear.Herc.Head.TH,
        --hands="Leyline Gloves",
        --ammo="Impatiens",
        --neck="Voltsurge Torque",
        --left_ring="Prolix Ring",
        --right_ring="Lebeche Ring",
        --left_ear="Loquac. Earring",
        --right_ear="Enchntr. Earring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        --ammo="Yetshila",
        --head=gear.Adhemar.Head.B,
        --body=gear.Relic.Body,
        hands=gear.Mummu.Hands,
        --legs=gear.Artifact.Legs,
        --feet=gear.Adhemar.Feet.B
        --neck="Fotia Gorget",
        left_ear="Odr Earring",
        right_ear="Sherida Earring",
        left_ring="Begrudging Ring",
        right_ring="Ilabrat Ring",
        --back=gear.capes.Crit,
        --waist="Fotia Belt",
    }
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {

    })

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {})

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
        hands=gear.Mummu.Hands,
    })
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS["Rudra's Storm"], {
    })
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})

    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS["Rudra's Storm"], {
    })
    sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS["Rudra's Storm"], {
    })

    sets.precast.WS['Aeolian Edge'] = {   
    }

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
        --ammo="Crepuscular Pebble",
        head=gear.Meghanada.Head,
        body=gear.Meghanada.Body,
        hands=gear.Meghanada.Hands,
        legs=gear.Meghanada.Legs,
        feet=gear.Artifact.Feet,
        --neck="Warder's Charm +1",
        --waist="Flume Belt +1",
        --back=gear.capes.TP,
        --left_ear="Odnowa Earring +1",
        --right_ear="Genmei Earring",
        left_ring="Meghanada Ring",
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
        head=gear.Meghanada.Head,
        body=gear.Meghanada.Body,
        hands=gear.Meghanada.Hands,
        legs=gear.Meghanada.Legs,
        feet=gear.Mummu.Feet,
        --ammo="Aurgelmir Orb",
        neck="Sanctity Necklace",
        --waist="Patentia Sash",
        --back=gear.capes.TP,
        left_ear="Suppanomimi",
        right_ear="Sherida Earring",
        left_ring="Begrudging Ring",
        right_ring="Ilabrat Ring",
    }
    sets.engaged.Acc = set_combine(sets.engaged, {})

    sets.engaged.Evasion = set_combine(sets.engaged, {

    })

    sets.engaged.PDT = set_combine(sets.engaged, {
        --head="Malignance Chapeau",
        --body="Malignance Tabard",
        --hands="Malignance Gloves",
        --legs="Malignance Tights",
        --feet="Malignance Boots",
        --left_ring="Defending Ring",
    })

    sets.engaged.MDT = set_combine(sets.engaged, {
        --head="Malignance Chapeau",
        --body="Malignance Tabard",
        --hands="Malignance Gloves",
        --legs="Malignance Tights",
        --feet="Malignance Boots",
        --left_ring="Defending Ring",
        --right_ring="Moonbeam Ring",
    })

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end