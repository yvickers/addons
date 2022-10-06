function user_job_setup()
    state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexastrike' }

    gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = "Ebers Bliaut +2"
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = "Ebers Pant. +2"
    gear.Empyrean.Feet = "Orsn. Duckbills +1"

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = ""
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
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
   		--body="Piety Bliaut +1"
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
        --main="Bolelabunga",
        --sub="Sors Shield",
        --ammo="Quartz Tathlum +1",
        head="Nahtirah Hat",
        body="Inyanga Jubbah +2",
        hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -4%',}},
        legs="Aya. Cosciales +2",
        --feet="Inyan. Crackows +2",
        neck="Voltsurge Torque",
        waist="Embla Sash",
        left_ear="Enchntr. Earring +1",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Lebeche Ring",
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
		main="Bolelabunga",
        sub="Sors Shield",
		ammo="Quartz Tathlum +1",
        head=gear.Vanya.Head.B,
        body=gear.Empyrean.Body,
        hands="Kaykaus Cuffs +1",
        legs=gear.Empyrean.Legs,
        feet=gear.Vanya.Feet.B,
        neck="Cleric's Torque",
        waist="Gishdubar Sash",
        left_ear="Mendi. Earring",
        right_ear="Etiolation Earring",
        left_ring="Weather. Ring",
        right_ring="Lebeche Ring",
        back=gear.capes.CurePotency,
     }
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
	})

	sets.midcast.Cursna = {
        head=gear.Vanya.Head.B,
        body=gear.Empyrean.Body,
        hands="Fanatic Gloves",
        feet="Gende. Galosh. +1",
        neck="Debilis Medallion",
        waist="Gishdubar Sash",
        left_ear="Meili Earring",
        right_ear="Etiolation Earring",
        left_ring="Haoma's Ring",
        right_ring="Haoma's Ring",
        back=gear.capes.CurePotency,
    }
	sets.midcast.StatusRemoval = {}
	sets.midcast.Erase = {}
	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
        head="Umuthi Hat",
        body=gear.Empyrean.Head,
        hands=gear.Inyanga.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        --neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Meili Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring",
        right_ring="Stikini Ring",
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
		--ammo="Staunch Tathlum",
		head=gear.Inyanga.Head,
		body="Shamash Robe",
		hands=gear.Inyanga.Hands,
		legs=gear.Inyanga.Legs,
		feet=gear.Inyanga.Feet,
		neck="Loricate Torque +1",
		--waist="Hachirin-no-Obi",
		--left_ear="Genmei Earring",
		--right_ear="Ethereal Earring",
		left_ring="Inyanga Ring",
		right_ring="Defending Ring",
		--back="Solemnity Cape",
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