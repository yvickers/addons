-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Melee' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Daybreak",
		sub="Culminus",
	}
    gear.weapons['Melee'] = {
		main="C. Palug Hammer",
		sub="Maxentius",
	}
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexastrike', 'Realmrazer' }

    gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = "Ebers Cap +1"
    gear.Empyrean.Body = "Ebers Bliaut +1"
    gear.Empyrean.Hands = "Ebers Mitts +1"
    gear.Empyrean.Legs = "Ebers Pant. +1"
    gear.Empyrean.Feet = "Ebers Duckbills +1"

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.capes = {}
    --gear.capes.TP = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Magic dmg. taken-6%',}}
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
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
   		body="Piety Bliaut +1"
	}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        --ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
   		ammo="Impatiens",
        head="Bunzi's Hat",
        body="Zendik Robe",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


    sets.precast.RA = {
    }

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Telos Earring",
        right_ear="Mache Earring +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Rufescent Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        --ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
    }
        
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
    })

    sets.midcast['Full Cure'] = sets.midcast.FastRecast
    sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Hydrocera",
		head={ name="Vanya Hood", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		body=gear.Empyrean.Body,
		hands=gear.Inyanga.Hands,
		legs=gear.Empyrean.Legs,
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Cleric's Torque",
		waist="Hachirin-no-Obi",
		left_ear="Glorious Earring",
		right_ear="Nourish. Earring +1",
		--left_ring="",
		--right_ring="",
		back=gear.capes.CurePotency
	}
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
	})

	sets.midcast.Cursna = {}
	sets.midcast.StatusRemoval = {}
	sets.midcast.Erase = {}
	sets.midcast['Enhancing Magic'] = {
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		waist="Embla Sash",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	}
	--sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	--sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})
	--sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	--sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +1",legs="Th. Pant. +3",})
	--sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.BarElement = {}

    -- Sets to return to when not performing an action.
    
	-- Resting sets
	sets.resting = {
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	}
    
	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Bunzi's Pants",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Yngvi Choker",
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Warp Ring",
        right_ring="Defending Ring",
        back="Solemnity Cape",
	}

    sets.idle.Town = set_combine( sets.idle, {} )
    sets.idle.PDT = set_combine( sets.idle, {
        head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
    } )
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = { }
    
    sets.Kiting = set_combine( sets.PDT, {
    })

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        ammo="Crepuscular Pebble",
        head="Bunzi's Hat",
        body=gear.Ayanmo.Body,
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sanctity Necklace",
        waist="Grunfeld Rope",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Petrov Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
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