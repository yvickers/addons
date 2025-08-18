-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Melee' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Daybreak",
		sub="Culminus",
	}
    gear.weapons['Melee'] = {
		main="Maxentius",
		sub="Sindri",
	}
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Hexa Strike' }

    gear.Artifact = {}
    gear.Artifact.Head = "Theo. Cap +1"
    gear.Artifact.Body = "Theo. Bliaut +1"
    gear.Artifact.Hands = "Theophany Mitts +3"
    gear.Artifact.Legs = "Th. Pant. +3"
    gear.Artifact.Feet = "Theo. Duckbills"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Ebers Cap +1"
    gear.Empyrean.Body = "Ebers Bliaut +1"
    gear.Empyrean.Hands = "Ebers Mitts +3"
    gear.Empyrean.Legs = "Ebers Pant. +3"
    gear.Empyrean.Feet = "Ebers Duckbills +1"

    gear.Relic = {}
    gear.Relic.Head = "Piety Cap +1"
    gear.Relic.Body = "Piety Bliaut +3"
    gear.Relic.Hands = "Piety Pantaln. +3"
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.capes = {}
    gear.capes.MNDWS = { name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}}
    gear.capes.STRCRIT = { name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}
    gear.capes.CurePotency = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%',}}

    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

    send_command('bind ^g gs c cycle Weapons')
--]]
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    sets.AutoBuff.sleep = {
		main="Prime Maul",
	}
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
   		body=gear.Relic.Body,
	}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        main="C. Palug Hammer",--7
        sub="Sors Shield",
        ammo="Impatiens",
        head="Bunzi's Hat",--8
        body="Inyanga Jubbah +2",--14
        hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -3%',}},
        legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},--7
        feet="Volte Gaiters",--6
        neck={ name="Clr. Torque +2", augments={'Path: A',}},--10
        waist="Witful Belt",
        left_ear="Malignance Earring",--4
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring +1",--6
        right_ring="Medada's Ring",--10
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},--10
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {
        head="",
        body="Crepuscular Cloak",
    })
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main="Daybreak",
    })

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Grunfeld Rope",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ebers Earring +2",
        left_ring="Epaminondas's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.capes.MNDWS,
    }

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
        neck="Clr. Torque +2",
        waist="Fotia Belt",
    })

    sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Begrudging Ring",
        right_ring="Rufescent Ring",
        back=gear.capes.STRCRIT,
    })
    
    -- Midcast Sets
    sets.midcast.FastRecast = {}
        
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    sets.midcast['Full Cure'] = sets.midcast.FastRecast
    sets.midcast.Cure = {
		main="Raetic Rod +1",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1",
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Empyrean.Legs,
		feet="Kaykaus Boots +1",
		neck="Clr. Torque +2",
		waist="Hachirin-no-Obi",
		left_ear="Glorious Earring",
		right_ear="Magnetic Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Lebeche Ring",
		back=gear.capes.CurePotency
	}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        body=gear.Artifact.Body,
    })

	sets.midcast.Cursna = {}
	sets.midcast.StatusRemoval = {}
	sets.midcast.Erase = {}
	sets.midcast['Enhancing Magic'] = {
        main="Gada",
        sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=gear.Telchine.Head.Enhancing,
		body=gear.Telchine.Body.Enhancing,
		hands=gear.Telchine.Hands.Enhancing,
		legs=gear.Telchine.Legs.Enhancing,
		feet=gear.Artifact.Feet,
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring=gear.rings['Stikini L'],
		right_ring=gear.rings['Stikini R'],
		back="Perimede Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
        feet=gear.Empyrean.Feet,
    })
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main="Vadose Rod",
        --head="Chironic Hat",
        --hands="Regal Cuffs",
        waist="Emphatikos Rope",
        legs="Shedir Seraweels",
    })
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        head=gear.Inyanga.Head,
        body=gear.Relic.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Artifact.Legs,
        feet="Bunzi's Sabots",
    })
	--sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
        main="Beneficus",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Relic.Legs,
        feet=gear.Empyrean.Feet,
    })

    sets.midcast['Enfeebling Magic'] = {}
    sets.midcast['Divine Magic'] = {}
    sets.midcast['Impact'] = {}

    -- Sets to return to when not performing an action.
    
	-- Resting sets
	sets.resting = {}
    
	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum +1",
        head="Null Masque",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Bunzi's Pants",
        feet="Herald's Gaiters",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Warp Ring",
        right_ring="Defending Ring",
        back="Null Shawl",
	}

    sets.idle.Town = set_combine( sets.idle, {} )
    sets.idle.PDT = set_combine( sets.idle, {} )
    sets.idle.Refresh = set_combine( sets.idle, {
        ammo="Homiliary",
        body=gear.Relic.Body,
        legs="Chironic Hose",
        feet="Volte Gaiters",
        left_ring=gear.rings['Stikini L'],
        right_ring=gear.rings['Stikini R'],
    } )
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = { }
    
    sets.Kiting = set_combine( sets.PDT, {})

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        ammo="Oshasha's Treatise",
        head="Null Masque",
        body=gear.Ayanmo.Body,
        hands="Gazu Bracelets +1",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring=gear.rings['Chririch L'],
        right_ring=gear.rings['Chririch R'],
        back="Null Shawl",
    }
    
    sets.engaged.Acc = set_combine( sets.engaged, {
    })

    sets.engaged.DW = set_combine( sets.engaged, {
    })
    
    sets.engaged.Acc.DW = set_combine( sets.engaged.DW, {
    })

    sets.engaged.Ranged = set_combine( sets.engaged, {
    })
end