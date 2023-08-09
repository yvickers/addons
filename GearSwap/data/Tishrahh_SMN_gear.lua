function user_job_setup()

	state.OffenseMode:options( 'Melee' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal' )
	state.IdleMode:options( 'Normal', 'PDT', 'Refresh' )


	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Daybreak",
		sub="Culminus",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Realmrazer' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
    state.AutoFightMode = M( true, "Auto Pet Fight" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = ""
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Beckoner's Horn +2"
	gear.Empyrean.Body = "Beck. Doublet +2"
	gear.Empyrean.Hands = "Beck. Bracers +2"
	gear.Empyrean.Legs = "Beck. Spats +2"
	gear.Empyrean.Feet = "Beck. Pigaches +2"

	gear.capes = {}
    gear.capes.SMNSkill = "Conveyance Cape"
	gear.capes.PetMAB = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.PetPhysical = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}}

end

function init_gear_sets()
	sets.TreasureHunter = {}

	-- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {
		--head=gear.Relic.Head
	}
    
    sets.precast.JA['Elemental Siphon'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe",
        hands="Baayami Cuffs",
        legs="Baayami Slops",
		feet=gear.Empyrean.Feet,
		neck="Caller's Pendant",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}

    sets.precast.JA['Mana Cede'] = {
		hands=gear.Empyrean.Hands
	}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe",
        hands="Baayami Cuffs",
        legs="Baayami Slops",
		feet=gear.Empyrean.Feet,
		neck="Caller's Pendant",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

	sets.precast.FC = {
        main="Gada",
        sub="Chanter's Shield",
        ammo="Impatiens",
        head="Amalric Coif +1",
        body="Inyanga Jubbah +2",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Lengo Pants", augments={'INT+6','"Mag.Atk.Bns."+13',}},
        feet="Regal Pumps +1",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Malignance Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Medada's Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash"
    })

	sets.precast.WS = {
		--ammo="Knobkierrie",
		--head="Ken. Jinpachi +1",
		--body="Ken. Samue +1",
		--hands=gear.Artifact.Hands,
		--legs="Ken. Hakama +1",
		--feet="Ken. Sune-Ate +1",
		--neck="Mnk. Nodowa +1",
		--waist="Moonbow Belt",
		--left_ear="Sherida Earring",
		--right_ear="Moonshade Earring",
		--left_ring="Epona's Ring",
		--right_ring="Rajas Ring",
		--back=gear.capes.StrDA,
	}

	sets.midcast.Cure = {
        main={ name="Gada", augments={'Attack+15','"Fast Cast"+5','Pet: "Mag.Atk.Bns."+24','DMG:+16',}},
        sub="Sors Shield",
        ammo="Impatiens",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Lengo Pants", augments={'INT+6','"Mag.Atk.Bns."+13',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Nodens Gorget",
        waist="Witful Belt",
        left_ear="Mendi. Earring",
        right_ear="Meili Earring",
        left_ring="Menelaus's Ring",
        right_ring="Lebeche Ring",
        back="Solemnity Cape",
    }
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
        neck="Debilis Medallion",
        --hands="Hieros Mittens",
		back="Oretan. Cape +1",
        right_ring="Haoma's Ring",
        left_ring="Menelaus's Ring",
    })

	sets.midcast['Summoning Magic'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
        head=gear.Empyrean.Head,
        body="Baayami Robe",
        hands="Baayami Cuffs",
        legs="Baayami Slops",
		feet=gear.Empyrean.Feet,
		neck="Caller's Pendant",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",	
	}

	sets.midcast['Enhancing Magic'] = {
		--main=gear.gada_enhancing_club,
		--sub="Ammurapi Shield",
		--ammo="Hasty Pinion +1",
		--head="Telchine Cap",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Gifted Earring",
		--body="Telchine Chas.",
		--hands="Telchine Gloves",
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
		--back="Perimede Cape",
		--waist="Embla Sash",
		--legs="Telchine Braconi",
		--feet="Telchine Pigaches"
	}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		--sub="Genmei Shield",
		head="Amalric Coif +1",
		--hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"
	})

	-- Avatar pact sets.  All pacts are Ability type.
    sets.midcast.Pet.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		--head="Convoker's Horn +3",
		head=gear.Empyrean.Head,
        body="Baayami Robe",
        hands="Baayami Cuffs",
        legs="Baayami Slops",
		feet=gear.Empyrean.Feet,
		--neck="Incanter's Torque",
		neck="Caller's Pendant",
		left_ear="Andoaa Earring",
		right_ear="Lodurr Earring",        
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
        back=gear.capes.SMNSkill,
		waist="Lucidity Sash",
	}

    sets.midcast.Pet.DebuffBloodPactWard = set_combine( sets.midcast.Pet.BloodPactWard, {
        --head="C. Palug Crown",
		neck="Adad Amulet",
		left_ear="Lugalbanda Earring",
		--ear2="Enmerkar Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring2="C. Palug Ring",
        --back=gear.magic_jse_back,
		--waist="Incarnation Sash",
		--legs="Tali'ah Sera. +2",
		--feet="Convo. Pigaches +3"
	} )
            
    sets.midcast.Pet.PhysicalBloodPactRage = set_combine( sets.midcast.Pet.BloodPactWard, {
		--main="Gridarvor",
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Helios Band",
		--neck="Shulmanu Collar",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_physpact_hands,
		--ring1="Varar Ring +1",
		--ring2="C. Palug Ring",
        --back=gear.phys_jse_back,
		--waist="Incarnation Sash",
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    	sub="Khonsu",
    	ammo="Sancus Sachet +1",
    	head=gear.Empyrean.Head,
    	body=gear.Empyrean.Body,
    	hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+17 Pet: "Mag.Atk.Bns."+17','Mag. Acc.+20 "Mag.Atk.Bns."+20','Accuracy+10 Attack+10',}},
   		legs=gear.Empyrean.Legs,
    	feet=gear.Empyrean.Feet,
    	neck="Adad Amulet",
    	waist="Lucidity Sash",
    	left_ear="Lugalbanda Earring",
    	right_ear="Rimeice Earring",
    	left_ring="Varar Ring +1",
    	right_ring="Varar Ring +1",
    	back=gear.capes.PetPhysical,
	} )

    sets.midcast.Pet.MagicalBloodPactRage = set_combine( sets.midcast.Pet.BloodPactWard, {
		--main=gear.grioavolr_pet_staff,
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		--neck="Adad Amulet",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring1="Varar Ring +1",
		--ring2="Varar Ring +1",
        --back=gear.magic_jse_back,
		--waist="Regal Belt",
		--legs="Enticer's Pants",
		--feet="Apogee Pumps +1"
		back=gear.capes.PetMAB,
	} )

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
    
	sets.midcast.Pet['Flaming Crush'] = {
		--main=gear.grioavolr_pet_staff,
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		--neck="Adad Amulet",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring1="Varar Ring +1",
		--ring2="Varar Ring +1",
        --back=gear.phys_jse_back,
		--waist="Regal Belt",
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
	}
			
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})

	sets.idle = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Crepuscular Pebble",
        head=gear.Empyrean.Head,
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Stikini Ring +1",
        back="Solemnity Cape",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	-- Aim for -14 perp, and refresh in other slots.
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",
		body="Beck. Doublet +2",
		hands={ name="Asteria Mitts +1", augments={'Path: A',}},
		legs={ name="Assid. Pants +1", augments={'Path: A',}},
		feet="Baayami Sabots",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back=gear.capes.PetPhysical,
	}
		
    sets.idle.Spirit = set_combine( sets.idle.Avatar, {
        --head="Convoker's Horn +3",
        back="Conveyance Cape",
	})
		
	sets.engaged = {
		ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Shulmanu Collar",
        waist="Grunfeld Rope",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Cacoethic Ring +1",
        back="Solemnity Cape",
	}
end