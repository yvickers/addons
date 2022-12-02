function user_job_setup()

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'AE', 'Arma', 'Ranged', }
    gear.weapons = {}
    gear.weapons['AE'] = {
        main='Malevolence',
        sub='Crepuscular Knife',
        range="Anarchy +2",
        ammo="Hauksbok Bullet",
    }
    gear.weapons['Ranged'] = {
        main='Malevolence',
        sub='Malevolence',
        range="Doomsday",
        ammo="Devastating Bullet",
    }
    gear.weapons['Arma'] = {
        main='Perun +1',
        sub='Nusku Shield',
        ranged="Armageddon",
        ammo="Devastating Bullet",
    }
    gear.weapons['Savage'] = {
        main='Naegling',
        sub='Crepuscular Knife',
        range="Sparrowhawk +2",
        ammo="Hauksbok Arrow",
    }
    
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Evisceration', 'Aeolian Edge',' }

    gear.Artifact = {}
    gear.Artifact.Head = "Orion Beret +3"
    gear.Artifact.Body = "Orion Jerkin +1"
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Relic = {}
    gear.Relic.Head = "Arcadian Beret +3"
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = "Arc. Braccae +3"
    gear.Relic.Feet = "Arcadian Socks +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = "Amini Caban +2"
    gear.Empyrean.Hands = "Amini Glove. +2"
    gear.Empyrean.Legs = "Amini Bragues +2"
    gear.Empyrean.Feet = ""

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
        --feet=gear.Artifact.Feet
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
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- Ranged snapshot gear
    sets.precast.RA = {
        head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body=gear.Empyrean.Body,
        hands="Carmine Fin. Ga. +1",
        legs=gear.Adhemar.Legs.D,
        --legs=gear.Artifact.Legs,
        feet=gear.Meghanada.Feet,
        neck="Scout's Gorget +2",
        waist="Impulse Belt",
        back=gear.capes.Snapshot,
        left_ring="Crepuscular Ring",
    }

    sets.precast.RA.Flurry1 = set_combine(sets.precast.RA, {
        head=gear.Artifact.Head,
        legs=gear.Adhemar.Legs.D,
    })

    sets.precast.RA.Flurry2 = set_combine(sets.precast.RA.Flurry1, {
        feet=gear.Relic.Feet,
        waist="Yemaya Belt",
    })


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=gear.Artifact.Head,
        body="Nyame Mail",
        hands="Carmine Fin. Ga. +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Scout's Gorget +2",
        waist="Eschan Stone",
        back=gear.capes.MagicalRangedWS,
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Dingir Ring",
        right_ring="Ilabrat Ring",
    }
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    } )
    sets.precast.WSPhysical = set_combine(sets.precast.WS, {
        hands=gear.Meghanada.Hands,
        legs=gear.Relic.Legs,
        waist="K. Kachina Belt +1",
        back=gear.capes.PhysicalRangedWS,
        left_ear="Telos Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Sroda Ring",
    } )

    sets.precast.WS["Apex Arrow"] = set_combine(sets.precast.WSPhysical, {  
    } )
    sets.precast.WS["Empyreal Arrow"] = set_combine(sets.precast.WSPhysical, {  
    } )
    sets.precast.WS["Sidewinder"] = set_combine(sets.precast.WSPhysical, {  
    } )
    sets.precast.WS["Last Stand"] = set_combine(sets.precast.WSPhysical, {
        left_ear="Ishvara Earring",
        right_ring="Dingir Ring",
        waist="Fotia Belt",
    } )
    sets.precast.WS["Trueflight"] = set_combine(sets.precast.WS, {
        right_ring="Weather. Ring +1",
    } )

    sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {
        head=gear.Artifact.Head,
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs=gear.Relic.Legs,
		feet="Nyame Sollerets",
        neck="Sybil Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Dingir Ring",
        right_ring="Metamor. Ring +1",		
    } )

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WSPhysical, {
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        back=gear.capes.PhysicalMeleeWS,
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
    sets.precast.WS["Decimation"] = set_combine(sets.precast.WS, {
        head=gear.Adhemar.Head.B,
        body=gear.Mummu.Body,
        hands=gear.Adhemar.Hands.B,
        legs=gear.Meghanada.Legs,
        feet=gear.Adhemar.Feet.B,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Regal Ring",
        right_ring="Epona's Ring",
        back=gear.capes.PhysicalMeleeWS,
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
        body="Nisroch Jerkin",
        hands="Malignance Gloves",
        legs=gear.Adhemar.Legs.C,
        feet="Malignance Boots",
        neck="Scout's Gorget +2",
        waist="K. Kachina Belt +1",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Regal Ring",
        right_ring="Crepuscular Ring",
        back=gear.capes.RNGTP,
    }

    sets.midcast.RA.Acc = {}
    sets.TrueShot = {}
    sets.midcast.RA.Critical = set_combine(sets.midcast.RA, {
        head=gear.Meghanada.Head,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet="Osh. Leggings +1",
        right_ring="Begrudging Ring",
        back=gear.capes.CritTP,
    })


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Carmine Cuisses +1",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        back=gear.capes.DexTP,
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
        body="Malignance Tabard",
        hands=gear.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Scout's Gorget +2",
        waist="Sailfi Belt +1",
        back=gear.capes.DexTP,
        left_ear="Sherida Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
    }
    sets.engaged.Acc = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands=gear.Empyrean.Hands,
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })

    sets.engaged.Evasion = set_combine(sets.engaged, {})

    sets.engaged.PDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
    })

    sets.engaged.MDT = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        right_ear="Crep. Earring",
        left_ring="Defending Ring",
        right_ring="Crepuscular Ring",
    })

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 14)
end