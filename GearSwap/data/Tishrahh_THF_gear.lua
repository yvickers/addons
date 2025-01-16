-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
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
    gear.Artifact.Feet = "Pill. Poulaines +1"

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = "Plun. Armlets +1"
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = "Skulker's Bonnet +3"
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = "Skulk. Culottes +3"
    gear.Empyrean.Feet = "Skulk. Poulaines +2"

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
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +3",
        body="Meg. Cuirie +2",
        hands="Mummu Wrists +2",
        legs="Skulk. Culottes +3",
        feet="Mummu Gamash. +2",
        neck="Sanctity Necklace",
        waist="Grunfeld Rope",
        left_ear="Odr Earring",
        right_ear={ name="Skulk. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
        left_ring="Begrudging Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Damage taken-5%',}},
    }

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
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Skulk. Culottes +3",
        feet="Pill. Poulaines +1",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Damage taken-5%',}},
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
        ammo="Oshasha's Treatise",
        head="Skulker's Bonnet +3",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Skulk. Culottes +3",
        feet="Mummu Gamash. +2",
        neck="Sanctity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear={ name="Skulk. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
        left_ring="Meghanada Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Damage taken-5%',}},
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