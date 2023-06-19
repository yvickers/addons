function user_job_setup()
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexastrike' }

    gear.Artifact = {}
    gear.Artifact.Head = "Theophany Cap +2"
    gear.Artifact.Body = "Theo. Bliaut +2"
    gear.Artifact.Hands = "Theophany Mitts +3"
    gear.Artifact.Legs = "Th. Pant. +3"
    gear.Artifact.Feet = "Theo. Duckbills +3"

    gear.Empyrean = {}
    gear.Empyrean.Head = "Ebers Cap +3"
    gear.Empyrean.Body = "Ebers Bliaut +3"
    gear.Empyrean.Hands = "Ebers Mitts +3"
    gear.Empyrean.Legs = "Ebers Pant. +3"
    gear.Empyrean.Feet = "Ebers Duckbills +3"

    gear.Relic = {}
    gear.Relic.Head = "Piety Cap +1"
    gear.Relic.Body = "Piety Bliaut +3"
    gear.Relic.Hands = ""
    gear.Relic.Legs = "Piety Pantaln. +3"
    gear.Relic.Feet = ""

    gear.capes = {}
    --gear.capes.TP = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Magic dmg. taken-6%',}}
    gear.capes.CurePotency = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}}

    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

    send_command('bind ^g gs c cycle Weapons')
--]]
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    sets.AutoBuff.sleep = {
		main="Lorg Mor",
	}

    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
   	    body=gear.Relic.Body
	}

    sets.precast.JA.Devotion = {
        head=gear.Relic.Head
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
        main="Gada",
        sub="Chanter's Shield",
        ammo="Impatiens",
        head=gear.Empyrean.Head,
        body=gear.Inyanga.Body,
        hands="Fanatic Gloves",
        legs="Kaykaus Tights +1",
        feet="Regal Pumps +1",
        neck="Cleric's Torque",
        waist="Witful Belt",
        left_ear="Loquac. Earring",
        right_ear="Malignance Earring",
        left_ring="Weather. Ring",
        right_ring="Medada's Ring",
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
        main="Queller Rod",
        sub="Chanter's Shield",
        ammo="Homiliary",
        head="Kaykaus Mitra +1",
        body=gear.Empyrean.Body,
        hands=gear.Artifact.Hands,
        legs=gear.Empyrean.Legs,
        feet="Kaykaus Boots +1",
        neck="Cleric's Torque",
        waist="Luminary Sash",
        left_ear="Nourish. Earring +1",
        right_ear="Mendi. Earring",
        left_ring="Weather. Ring",
        right_ring="Lebeche Ring",
        back=gear.capes.CurePotency,
     }
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        body=gear.Artifact.Body,
	})

	sets.midcast.Cursna = {
        head=gear.Vanya.Head.B,
        body=gear.Empyrean.Body,
        hands="Fanatic Gloves",
        legs=gear.Artifact.Legs,
        feet=gear.Vanya.Feet.B,
        neck="Debilis Medallion",
        waist="Bishop's Sash",
        left_ear="Meili Earring",
        right_ear="Eber's Earring +1",
        left_ring="Menelaus's Ring",
        right_ring="Haoma's Ring",
        back=gear.capes.CurePotency,
    }
	sets.midcast.StatusRemoval = {}
	sets.midcast.Erase = {}
	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
        head=gear.Empyrean.Head,
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Cleric's Torque",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        right_ear="Mimir Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back=gear.capes.CurePotency,
	}
    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast['Boost-Str'] = set_combine(sets.midcast['Enhancing Magic'], {
        main="Gada",
        head=gear.Telchine.Head.Enhancing,
        body=gear.Telchine.Body.Enhancing,
        hands=gear.Telchine.Hands.Enhancing,
        legs=gear.Telchine.Legs.Enhancing,
        feet=gear.Artifact.Feet,
        back="Solemnity Cape",
    })
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Nodens Gorget",
        --ear2="Earthcry Earring",
        waist="Siegel Sash",
        --legs="Shedir Seraweels"
        back="Solemnity Cape",
    })
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {

    })
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main="Vadose Rod",
        sub="Ammurapi Shield",
        head="Chironic Hat",
        body=gear.Telchine.Body.Enhancing,
        --hands="Regal Cuffs",
        feet=gear.Artifact.Feet,
        waist="Emphatikos Rope",
        --legs="Shedir Seraweels"
        back="Solemnity Cape",
    })
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        head=gear.Inyanga.Head,
        body=gear.Relic.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Artifact.Legs,
        feet=gear.Artifact.Feet,
        back="Solemnity Cape",
    })
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        --ring2="Sheltered Ring",
        --feet="Piety Duckbills +1",
        --ear1="Gifted Earring",
        --waist="Sekhmet Corset"
    })
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
        --ring2="Sheltered Ring",
        --feet="Piety Duckbills +1",
        --ear1="Gifted Earring",
        --waist="Sekhmet Corset"
    })
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        --ring2="Sheltered Ring",
        legs=gear.Relic.Legs,
        --ear1="Gifted Earring",
        --waist="Sekhmet Corset",
    })
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
        --ring2="Sheltered Ring",
        legs=gear.Relic.Legs,
        --ear1="Gifted Earring",
        --waist="Sekhmet Corset",
    })

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
        main="Daybreak",
        sub="Sors Shield",
        ammo="Homiliary",
        head="Nyame Helm",
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back=gear.capes.CurePotency,
	}

    sets.idle.Town = set_combine( sets.idle, {} )
    sets.idle.PDT = set_combine( sets.idle, {} )
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}
    
    sets.Kiting = set_combine( sets.PDT, {
    })

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {
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
    
    sets.engaged.Acc = set_combine( sets.engaged.Melee, {
    })

    sets.engaged.Melee.DW = set_combine( sets.engaged.Melee, {
    })
    
    sets.engaged.Acc.DW = set_combine( sets.engaged.Melee.DW, {
    })

    sets.engaged.Ranged = set_combine( sets.engaged.Melee, {
    })
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	--set_macro_page(1, 8)
end