function user_job_setup()

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'AE', 'Arma', 'Ranged', }
    gear.weapons = {}
    gear.weapons['AE'] = {
        main='Tauret',
        sub='Malevolence',
        range="Sparrowhawk +2",
        ammo="Hauksbok Arrow",
    }
    gear.weapons['Ranged'] = {
        main='Perun +1',
        sub="Ternion Dagger +1",
        range="Annihilator",
        ammo="Chrono Bullet",
    }
    gear.weapons['Arma'] = {
        main='Tauret',
        sub="Gleti's Knife",
        ranged="Armageddon",
        ammo="Chrono Bullet",
    }
    gear.weapons['Savage'] = {
        main='Naegling',
        sub='Crepuscular Knife',
        range="Sparrowhawk +2",
        ammo="Hauksbok Arrow",
    }
    
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Coronach', 'Savage Blade', 'Evisceration', 'Aeolian Edge', }

    gear.Artifact = {}
    gear.Artifact.Head = "Orion Beret +3"
    gear.Artifact.Body = "Orion Jerkin +1"
    gear.Artifact.Hands = "Orion Bracers +3"
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = "Orion Socks +3"

    gear.Relic = {}
    gear.Relic.Head = "Arcadian Beret +3"
    gear.Relic.Body = "Arc. Jerkin +3"
    gear.Relic.Hands = ""
    gear.Relic.Legs = "Arc. Braccae +3"
    gear.Relic.Feet = "Arcadian Socks +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Amini Gapette +3"
    gear.Empyrean.Body = "Amini Caban +3"
    gear.Empyrean.Hands = "Amini Glove. +3"
    gear.Empyrean.Legs = "Amini Bragues +3"
    gear.Empyrean.Feet = "Amini Bottillons +3"

    gear.capes = {}
    gear.capes.DexTP = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    gear.capes.RNGTP = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
    gear.capes.PhysicalRangedWS = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
    gear.capes.MagicalRangedWS = { name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
    gear.capes.PhysicalMeleeWS = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.capes.Snapshot = { name="Belenus's Cape", augments={'"Snapshot"+10',}}
    gear.capes.CritTP = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Critical hit rate +10%',}}
    --gear.capes.VitWS = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
    --send_command('bind ^b gs c cycle AutoBoost')
    --send_command('bind @2 gs c cycle altstep')
    --send_command('bind @3 gs c cycle Samba')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
    --send_command('unbind ^b')
    --send_command('unbind @2')
    --send_command('unbind @3')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = set_combine( gear.TH.Herc, {
    } )

    sets.Kiting = {
        feet=gear.Artifact.Feet
    }

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    --sets.precast.JA['Collaborator'] =  {head="Raider's Bonnet +2" }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = { }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {
        head=gear.Herc.Head.TH,
        hands="Leyline Gloves",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {
        head=gear.Artifact.Head,
        body=gear.Empyrean.Body,
        hands="Carmine Fin. Ga. +1",
        legs=gear.Artifact.Legs,
        feet=gear.Meghanada.Feet,
        neck="Scout's Gorget +2",
        waist="Yemaya Belt",
        back=gear.capes.Snapshot,
        left_ring="Crepuscular Ring",
    }

    sets.precast.RA.Flurry1 = set_combine(sets.precast.RA, {
        head=gear.Artifact.Head,
        legs=gear.Adhemar.Legs.D,
        feet=gear.Relic.Feet,
    })

    sets.precast.RA.Flurry2 = set_combine(sets.precast.RA.Flurry1, {
    })


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=gear.Artifact.Head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        back=gear.capes.PhysicalMeleeWS,
        left_ear="Moonshade Earring",
        right_ear="Amini Earring +1",
        left_ring="Epaminondas's Ring",
        right_ring="Regal Ring",
    }

    sets.precast.MagicalWS = set_combine(sets.precast.WS, {
        waist="Orpheus's Sash",
        back=gear.capes.MagicalRangedWS,
        left_ear="Moonshade Earring",
        right_ear="Friomisi Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Dingir Ring",
    } )

    sets.precast.WS["Coronach"] = set_combine(sets.precast.WS, {
        ammo="Chrono Bullet",
        body=gear.Empyrean.Body,
        --feet=gear.Empyrean.Feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
    } )
    sets.precast.WS["Last Stand"] = set_combine(sets.precast, {
        body=gear.Empyrean.Body,
        --feet=gear.Empyrean.Feet,
        right_ear="Ishvara Earring",
        light_ring="Dingir Ring",
        neck="Fotia Gorget",
        waist="Fotia Belt",
    } )
    sets.precast.WS["Trueflight"] = set_combine(sets.precast.WS, {
        right_ring="Weather. Ring +1",
    } )

    sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {
        head="Nyame Helm",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Dingir Ring",
        right_ring="Epaminondas's Ring",		
    } )

    sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS, {
        head=gear.Adhemar.Head.B,
        body=gear.Mummu.Body,
        hands=gear.Adhemar.Hands.B,
        legs=gear.Mummu.Legs,
        feet=gear.Adhemar.Feet.B,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back=gear.capes.DexTP,
    } )

    sets.FullTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
    sets.midcast.Utsusemi = {}

    -- Ranged gear
    sets.midcast.RA = {
        head=gear.Relic.Head,
        body="Ikenga's Vest",
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet="Ikenga's Clogs",
        neck="Scout's Gorget +2",
        waist="Yemaya Belt",
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back=gear.capes.RNGTP,
    }

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA,{
        left_ear="Beyla Earring",
        right_ear="Crep. Earring",
        left_ring="Crepuscular Ring",
        right_ring="Cacoethic Ring +1",
        waist="K. Kachina Belt +1",
    })
    sets.midcast.RA.DoubleShot = {
        head=gear.Relic.Head,
        body=gear.Relic.Body,
        hands="Ohsosi Gloves +1",
        legs="Osh. Trousers +1",
        feet="Osh. Leggings +1",
        back=gear.capes.RNGTP,
    }
    sets.TrueShot = {
        body="Nisroch Jerkin",
        legs=gear.Empyrean.Legs,
        --feet="Ikenga's Clogs",
        waist="Tellen Belt",
    }
    
    sets.midcast.RA.Critical =  {
        head=gear.Meghanada.Head,
        body="Nisroch Jerkin",
        hands=gear.Mummu.Hands,
        legs=gear.Empyrean.Legs,
        feet="Osh. Leggings +1",
        left_ear="Odr Earring",
        right_ear="Amini Earring",
        left_ring="Mummu Ring",
        right_ring="Begrudging Ring",
        waist="K. Kachina Belt +1",
        back=gear.capes.CritTP,
    }
    sets.midcast.RA.CriticalDoubleShot = {
        head=gear.Meghanada.Head,
        body=gear.Relic.Body,
        hands="Ohsosi Gloves +1",
        legs="Osh. Trousers +1",
        feet="Osh. Leggings +1",
        left_ear="Odr Earring",
        right_ear="Amini Earring",
        left_ring="Mummu Ring",
        right_ring="Begrudging Ring",
        waist="K. Kachina Belt +1",
        back=gear.capes.CritTP,
    }


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        head=gear.Empyrean.Head,
        body="Nyame Mail",
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Artifact.Feet,
        neck="Bathy Choker +1",
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back=gear.capes.DexTP,
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
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet="Tatena. Sune. +1",
        neck="Scout's Gorget +2",
        waist="Sailfi Belt +1",
        back=gear.capes.DexTP,
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Epona's Ring",
    }
    sets.engaged.Acc = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands=gear.Empyrean.Hands,
        feet="Malignance Boots",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })

    sets.engaged.Evasion = set_combine(sets.engaged, {})

    sets.engaged.PDT = set_combine(sets.engaged, {
        feet="Malignance Boots",
    })

    sets.engaged.MDT = set_combine(sets.engaged, {
    })

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end