-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F9 ]              Cycle Offense Modes
--              [ CTRL+F9 ]         Cycle Hybrid Modes
--              [ ALT+F9 ]          Cycle Ranged Modes
--              [ WIN+F9 ]          Cycle Weapon Skill Modes
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--              [ WIN+L ]           Toggle use of Luzaf Ring.
--              [ WIN+Q ]           Quick Draw shot mode selector.
--
--  Abilities:  [ CTRL+- ]          Quick Draw primary shot element cycle forward.
--              [ CTRL+= ]          Quick Draw primary shot element cycle backward.
--              [ ALT+- ]           Quick Draw secondary shot element cycle forward.
--              [ ALT+= ]           Quick Draw secondary shot element cycle backward.
--              [ CTRL+[ ]          Quick Draw toggle target type.
--              [ CTRL+] ]          Quick Draw toggle use secondary shot.

-------------------------------------------------------------------------------------------------------------------
--  Custom Commands (preface with /console to use these in macros)
-------------------------------------------------------------------------------------------------------------------

--  gs c qd                         Uses the currently configured shot on the target, with either <t> or
--                                  <stnpc> depending on setting.
--  gs c qd t                       Uses the currently configured shot on the target, but forces use of <t>.
--
--  gs c cycle mainqd               Cycles through the available steps to use as the primary shot when using
--                                  one of the above commands.
--  gs c cycle altqd                Cycles through the available steps to use for alternating with the
--                                  configured main shot.
--  gs c toggle selectqdtarget      Toggles whether or not to use <stnpc> (as opposed to <t>) when using a shot.
--
--  gs c toggle LuzafRing           Toggles use of Luzaf Ring on and off
--  gs c toggle CP                  Toggles locking of CP cape

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
    state.Bullet = M{['description']='Bullet', 'Devastating Bullet'}
    state.QDBullet = M{['description']='Quick Draw Bullet', 'Hauksbok Bullet'}

    state.Weapons = M{['description'] = 'Weapon Setup', 'Savage', 'Doomsday', 'Arma', 'Aeolian' }
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Leaden Salute', 'Aeolian Edge' }

    gear.Artifact = {}
    gear.Artifact.Head = {}
    gear.Artifact.Body = "Laksa. Frac +3"
    gear.Artifact.Hands = {}
    gear.Artifact.Legs = "Lak. Trews +1"
    gear.Artifact.Feet = {}

    gear.Relic = {}
    gear.Relic.Head = "Lanun Tricorne +1"
    gear.Relic.Body = "Lanun Frac +3"
    gear.Relic.Hands = "Lanun Gants +1"
    gear.Relic.Legs = "Lanun Trews +1"
    gear.Relic.Feet = "Lanun Bottes +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = "Chasseur's Gants +2"
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = ""

    gear.capes = {}
    gear.capes.MeleeTPCapeDW = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
    gear.capes.MeleeTPCapeDA = gear.capes.MeleeTPCapeDW   --also evisceration
    gear.capes.MeleeWSCape = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.capes.PhantomRoll = gear.capes.MeleeTPCapeDW
    gear.capes.RngLeadenCape = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
    gear.capes.RngTPCape = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Critical hit rate +10%',}}
    gear.capes.RngWFCape = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
    gear.capes.QDTPCape = gear.capes.RngLeadenCape
    gear.capes.FastCast = {}
    gear.capes.RngCrit = gear.capes.RngTPCape

    gear.weapons = {}
    --match key to state.weapons options
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Glet's Knife",
        ranged="Anarchy +2",
        ammo="Devastating Bullet",
    }
    gear.weapons['Doomsday'] = {
        main="Naegling",
        sub="Kustawi +1",
        ranged="Doomsday",
        ammo="Devastating Bullet",
    }
    gear.weapons['Arma'] = {
        main="Naegling",
        sub="Gleti's Knife",
        ranged="Armageddon",
        ammo="Devastating Bullet",
    }
    gear.weapons['Aeolian'] = {
        main="Tauret",
        sub="Gleti's Knife",
        ranged="Anarchy +2",
        ammo="Hauksbok Bullet"
    }

    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    sets.TreasureHunter = gear.TH.Herc
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    --sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +2"}
    sets.precast.JA['Snake Eye'] = {legs=gear.Relic.Legs}
    sets.precast.JA['Wild Card'] = {feet=gear.Relic.Feet}
    sets.precast.JA['Random Deal'] = {body=gear.Relic.Body}

    
    sets.precast.CorsairRoll = {
        head=gear.Relic.Head,
        hands=gear.Empyrean.Hands,
        legs="Desultor Tassets",
        neck="Regal Necklace",
        ring2="Luzaf's Ring",
        back=gear.capes.PhantomRoll,
    }
    
    --sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    --sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
    --sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})
    --sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +2"})
    --sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Navarch's Gants +2"})
    
    --sets.precast.LuzafRing = set_combine( sets.precast.CorsairRoll, {ring2="Luzaf's Ring"})
    sets.precast.FoldDoubleBust = {hands=gear.Relic.Hands}    
    sets.precast.Compensator = { ranged = "Compensator" } 

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        --head="Whirlpool Mask",
        --body="Iuitl Vest",
        --hands="Iuitl Wristbands",
        --legs="Nahtirah Trousers",
        --feet="Iuitl Gaiters +1"
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head=gear.Herc.Head.TH,
        ear2="Loquacious Earring",
        ear1="Etiolation Earring",
        hands="Leyline Gloves",
        legs="Rawhide Trousers",
        feet="Crimson Greaves",
        neck="Voltsurge Torque",
        ring1="Prolix Ring",
        ring2="Kishar Ring",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {
        head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body=gear.Artifact.Body,
        hands=gear.Relic.Hands,
        back="Navarch's Mantle",
        waist="Yemaya Belt",
        legs=gear.Adhemar.Legs.D,
        feet=gear.Meghanada.Feet,
        ring1="Crepuscular Ring",
        ring2="Dingir Ring",
    }
    sets.precast.RA.Flurry1 = set_combine( sets.precast.RA, {

    })
    sets.precast.RA.Flurry2 = set_combine( sets.precast.RA.Flurry1, {
        hands="Carmine Fin. Ga. +1",
        feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}},
    })
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Lilitu Headpiece",
        --neck="Fotia Gorget",
        ear1="Ishvara Earring",
        ear2="Moonshade Earring",
        body=gear.Artifact.Body,
        hands=gear.Meghanada.Hands,
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet,
        ring1="Regal Ring",
        ring2="Metamor. Ring +1",
        back=gear.capes.MeleeWSCape,
        waist="Sailfi Belt +1"
    }
    sets.FullTP = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        --legs="Nahtirah Trousers"
    })

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        head=gear.Adhemar.Head.B,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Telos Earring",
    })

    sets.precast.WS['Evisceration'] = set_combine( sets.precast.WS, {
        head=gear.Adhemar.Head.B,
        body=gear.Mummu.Body,
        hands=gear.Mummu.Hands,
        legs=gear.Mummu.Legs,
        feet=gear.Mummu.Feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ring2="Mummu Ring",
        ear1="Odr Earring",
    })

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        head="Nyame Helm",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
        body=gear.Relic.Body,
        hands="Carmine Fin. Ga. +1",
        ring1="Dingir Ring",
        ring2="Metamor. Ring +1",
        back=gear.capes.RngLeadenCape,
        waist="Eschan Stone",
        feet=gear.Relic.Feet
    })

    sets.precast.WS['Leaden Salute'] = {
        head="Pixie Hairpin +1",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Moonshade Earring",
        body=gear.Relic.Body,
        hands="Carmine Fin. Ga. +1",
        --hands="Nyame Gauntlets",
        ring1="Dingir Ring",
        ring2="Archon Ring",
        back=gear.capes.RngLeadenCape,
        waist="Eschan Stone",
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet
    }

    sets.precast.WS['Wildfire'] = set_combine( sets.precast.WS['Leaden Salute'], {
        head=gear.Mummu.Head,
        ear2="Hecate's Earring",
        ring2="Ilabrat Ring",
        back=gear.capes.RngWFCape,
    })

    sets.precast.WS['Last Stand'] = {
        head="Malignance Chapeau",
        body=gear.Artifact.Body,
        hands=gear.Meghanada.Hands,
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet,
        neck="Fotia Gorget",
        ear1="Beyla Earring",
        ear2="Telos Earring",
        left_ring="Regal Ring",
        right_ring="Crepuscular Ring",
        back=gear.capes.RngWFCape,
        waist="Fotia Belt",
    }

    sets.precast.WS['Last Stand'].Acc = set_combine( sets.precast.WS['Last Stand'], {
    })
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        --head="Whirlpool Mask",
        --body="Iuitl Vest",
        --hands="Iuitl Wristbands",
        --legs="Manibozho Brais",
        --feet="Iuitl Gaiters +1"
    }
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {
        head="Nyame Helm",
        body=gear.Relic.Body,
        hands="Carmine Fin. Ga. +1",
        legs="Nyame Flanchard",
        feet=gear.Relic.Feet,
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
        ring1="Dingir Ring",
        ring2="Crepuscular Ring",
        back=gear.capes.RngLeadenCape,
        waist="Eschan Stone"
    }

    sets.midcast.CorsairShot.Acc = set_combine( sets.midcast.CorsairShot, {

    })

    sets.midcast.CorsairShot['Light Shot'] = set_combine( sets.midcast.CorsairShot,{
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        back=gear.capes.QDTPCape,
        ring1="Regal Ring",
        ring2="Crepuscular Ring",
        ear1="Crep. Earring",
        ear2="Telos Earring",
        waist="K. Kachina Belt +1",
    })

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']


    -- Ranged gear
    sets.midcast.RA = {
        head="Ikenga's Hat",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Ikenga's Trousers",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        ear1="Telos Earring",
        ear2="Crep. Earring",
        ring1="Crepuscular Ring",
        ring2="Ilabrat Ring",
        back=gear.capes.RngTPCape,
        waist="Yemaya Belt",
    }

    sets.midcast.RA.Acc = set_combine( sets.midcast.RA, {})
    sets.TripleShot = {}
    sets.TripleShotCritical = {}
    sets.TrueShot = {
        body="Nisroch Jerkin",
    }
    sets.midcast.RA.Critical = set_combine( sets.midcast.RA, {
        head=gear.Meghanada.Head,
        body=gear.Meghanada.Body,
        hands=gear.Mummu.Hands,
        legs="Darraigner's Brais",
        feet="Osh. Leggings +1",
        ear2="Odr Earring",
        left_ring="Begrudging Ring",
        right_ring="Mummu Ring",
        waist="K. Kachina Belt +1",
    })

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets
    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Carmine Cuisses +1",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Genmei Earring",
        back=gear.capes.PhantomRoll,
    }

    sets.idle.Town = set_combine( sets.idle, {

    })
    
    -- Defense sets
    sets.defense.PDT = set_combine( sets.idle, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
    })

    sets.defense.MDT = set_combine( sets.idle, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
    })
    
    --sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {
        head=gear.Meghanada.Head,
        body="Malignance Tabard",
        hands="Adhemar Wrist. +1",
        legs="Samnuha Tights",
        feet=gear.Meghanada.Feet,
        neck="Sanctity Necklace",
        waist="Dynamic Belt",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Epona's Ring",
        right_ring="Regal Ring",
        back=gear.capes.MeleeTPCapeDW,
    }
    
    sets.engaged.Acc = set_combine( sets.engaged.Melee, {
    })

    sets.engaged.Melee.DW = set_combine( sets.engaged.Melee, {
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring"
    })
    
    sets.engaged.Acc.DW = set_combine( sets.engaged.Melee.DW, {
    })

    sets.engaged.Ranged = set_combine( sets.engaged.Melee, {
    })

    sets.engaged.PDT = set_combine( sets.engaged.Melee, {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
    })

    sets.engaged.MDT = set_combine( sets.engaged.Melee, {
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
    set_macro_page(1, 5)
end