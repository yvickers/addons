--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()
	LowTierNukes = S{
		'Stone',
		'Water',
		'Aero',
		'Fire',
		'Blizzard',
		'Thunder',
        'Stone II',
        'Water II',
        'Aero II',
        'Fire II',
        'Blizzard II',
        'Thunder II',
        'Stonega',
        'Waterga',
        'Aeroga',
        'Firaga',
        'Blizzaga',
        'Thundaga'
    }

    info.addendumNukes = S{
    	"Stone IV",
    	"Water IV",
    	"Aero IV",
    	"Fire IV",
    	"Blizzard IV",
    	"Thunder IV",
        "Stone V",
        "Water V",
        "Aero V",
        "Fire V",
        "Blizzard V",
        "Thunder V"
    }
		
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'Refresh', 'PDT', 'MDT', 'Regen' )
    state.CastingMode:options( 'Normal', 'MagicBurst', 'Proc' )

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', '' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

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
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	--gear.capes.MAB = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--ctrl
	send_command('bind ^%1 gs c elemental skillchain1')
	send_command('bind ^%2 gs c elemental skillchain2')
	send_command('bind ^%3 gs c elemental skillchain3')
	send_command('bind ^%4 gs c buff klimaform')
	--send_command('bind ^%5')
	send_command('bind ^%6 //silence')
	--send_command('bind ^%7')
	--send_command('bind ^%8')
	send_command('bind ^%9 gs c buff invisible')
	send_command('bind ^%0 gs c buff sneak')

	--alt
	send_command('bind !%1 gs c scholar dark')
	send_command('bind !%2 gs c elemental nuke')
	send_command('bind !%3 gs c elemental tier4')
	send_command('bind !%4 gs c elemental tier3')
	send_command('bind !%5 gs c elemental helix')
	--send_command('bind !%6')
	send_command('bind !%7 gs c buff embrava')
	send_command('bind !%8 gs c buff weather')
	send_command('bind !%9 gs c buff regen')
	send_command('bind !%0 gs c scholar light')

	select_default_macro_book()

	send_command('wait 10; input /lockstyle on')

    if user_job_setup then
        user_job_setup()
    end
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	send_command('unbind ^%1')
	send_command('unbind ^%2')
	send_command('unbind ^%3')
	send_command('unbind ^%4')
	send_command('unbind ^%5')
	send_command('unbind ^%6')
	send_command('unbind ^%7')
	send_command('unbind ^%8')
	send_command('unbind ^%9')
	send_command('unbind ^%0')

	send_command('unbind !%1')
	send_command('unbind !%2')
	send_command('unbind !%3')
	send_command('unbind !%4')
	send_command('unbind !%5')
	send_command('unbind !%6')
	send_command('unbind !%7')
	send_command('unbind !%8')
	send_command('unbind !%9')
	send_command('unbind !%0')
end

function init_gear_sets()
	-- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {
    	--legs=gear.Relic.Legs,
    }
	sets.precast.JA['Enlightenment'] = {
		--body=gear.Relic.Body
	}

    -- Fast cast sets for spells

    sets.precast.FC = {
		--main=gear.grioavolr_fc_staff,
		--sub="Clerisy Strap +1",
		--ammo="Impatiens",
		--head=gear.Relic.Head,
		--neck="Voltsurge Torque",
		--ear1="Loquac. Earring",
		--ear2="Malignance Earring",
		--body="Agwu's Robe",
		--hands=gear.Artifact.Hands,
		--ring1="Prolix Ring",
		--ring2="Weather. Ring +1",
		--back="Perimede Cape",
		--waist="Witful Belt",
		--legs="Psycloth Lappas",
		--feet=gear.Artifact.Feet,
    }
		
	sets.precast.FC.Arts = {
		--head=gear.Relic.Head,
		--feet=gear.Artifact.Feet,
	}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		--waist="Siegel Sash"
	})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    	--ear1="Malignance Earring"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    	--main="Serenity",
    	--sub="Clerisy Strap +1",
    	--body="Heka's Kalasiris"
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
    	--head=empty,
    	--body="Twilight Cloak"
    })
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		--main="Daybreak",
	})

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    	--main="Mpaca's Staff",
    	--sub="Enki Strap",
    	--neck="Mizu. Kubikazari",
    	--ring1="Mujin Band",
    	--ring2="Freke Ring",
    	--head="Agwu's Cap",
    	--body="Agwu's Robe",
    	--hands="Amalric Gages +1",
    	--legs="Agwu's Slops",
    	--feet="Agwu's Pigaches",
	}
	
	-- Gear for specific elemental nukes.
	sets.element = {}
	sets.element.Dark = {
		--head="Pixie Hairpin +1",
		--ring2="Archon Ring"
	}

    sets.midcast.FastRecast = set_combine( sets.precast.FC, {
    	--main=gear.grioavolr_fc_staff,
    	--sub="Clerisy Strap +1",
    	--ammo="Hasty Pinion +1",
    	--head="Amalric Coif +1",
	} )
		
	sets.midcast.Cure = {
		--main="Daybreak",
		--sub="Sors Shield",
		--ammo="Hasty Pinion +1",
		--head="Vanya Hood",
		--neck="Incanter's Torque",
		--ear1="Meili Earring",
		--ear2="Malignance Earring",
		--body="Kaykaus Bliaut",
		--hands="Telchine Gloves",
		--ring1="Janniston Ring",
		--ring2="Lebeche Ring",
		--back="Fi Follet Cape +1",
		--waist="Hachirin-no-obi",
		--legs="Chironic Hose",
		--feet="Medium's Sabots"
	}

	sets.midcast.LightWeatherCure = set_combine( sets.midcast.Cure, {
		--main="Chatoyant Staff",
	} )

	sets.midcast.LightDayCure = set_combine( sets.midcast.Cure, {
	} )

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna = {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip",
		--ammo="Hasty Pinion +1",
		--head="Vanya Hood",
		--neck="Debilis Medallion",
		--ear1="Meili Earring",
		--ear2="Malignance Earring",
		--body=gear.Relic.Body,
		--hands="Hieros Mittens",
		--ring1="Haoma's Ring",
		--ring2="Menelaus's Ring",
		--back="Oretan. Cape +1",
		--waist="Witful Belt",
		--legs=gear.Artifact.Legs,
		--feet="Vanya Clogs"
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		--main=gear.grioavolr_fc_staff,
		--sub="Clemency Grip"
	})

	sets.midcast['Enhancing Magic'] = {
		--main=gear.gada_enhancing_club,
		--sub="Ammurapi Shield",
		--ammo="Savant's Treatise",
		--head="Telchine Cap",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Gifted Earring",
		--body=gear.Relic.Body,
		--hands=gear.Empyrean.Hands,
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
		--back="Fi Follet Cape +1",
		--waist="Embla Sash",
		--legs="Telchine Braconi",
		--feet="Telchine Pigaches"
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
    	--main="Bolelabunga",
	    --head=gear.Empyrean.Head,
	    --body="Telchine Chas.",
	    --back=gear.capes.MAB,
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    	--neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		--waist="Siegel Sash",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		--head="Amalric Coif +1"
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		--main="Vadose Rod",
		--sub="Genmei Shield",
		--head="Amalric Coif +1",
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",
		--legs="Shedir Seraweels"
	})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		--legs="Shedir Seraweels"
	})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
    	--feet=gear.Relic.Feet
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
    	---ring2="Sheltered Ring"
	})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
    	--ring2="Sheltered Ring"
    })
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
		--main="Daybreak",
		--sub="Ammurapi Shield",
		--ammo="Ghastly Tathlum +1",
		--head=gear.Artifact.Head,
        --neck="Erra Pendant",
        --ear1="Arbatel Earring +1",
        --ear2="Malignance Earring",
		--body=gear.Artifact.Body,
        --hands=gear.Artifact.Hands,
        --ring1="Metamor. Ring +1",
        --ring2="Kishar Ring",
        --back=gear.capes.MAB,
        --waist="Acuity Belt +1",
        --legs=gear.Artifact.Legs,
        --feet=gear.Artifact.Feet
    }
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
    	--head="Amalric Coif +1",
    })
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		--head="Amalric Coif +1",
	})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		--head="",
		--body="Cohort Cloak +1"
	})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
		--ring2="Stikini Ring +1",
	})

    sets.midcast['Dark Magic'] = {
    	--main="Bunzi's Rod",
    	--sub="Ammurapi Shield",
    	--ammo="Ghastly Tathlum +1",
    	--head="Pixie Hairpin +1",
        --neck="Erra Pendant",
        --ear1="Arbatel Earring +1",
        --ear2="Malignance Earring",
        --body=gear.Artifact.Body,
        --hands=gear.Artifact.Hands,
        --ring1="Freke Ring",
        --ring2="Archon Ring",
        --back=gear.capes.MAB,
        --waist="Acuity Belt +1",
        --legs=gear.Relic.Legs,
        --feet="Agwu's Pigaches"
    }

    sets.midcast.Kaustra = set_combine(sets.midcast['Dark Magic'], {
        --neck="Saevus Pendant +1",
        --ear1="Crematio Earring",
        --body=gear.merlinic_nuke_body,
        --hands="Amalric Gages +1",
        --ring1="Freke Ring",
        --waist="Refoccilation Stone",
        --legs="Merlinic Shalwar",
        --feet=gear.merlinic_nuke_feet
    })
		

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    })
		
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
    	--main=gear.grioavolr_fc_staff,
    	--sub="Clerisy Strap +1",
    	--ammo="Hasty Pinion +1",
        --head=gear.Artifact.Head,
        --neck="Voltsurge Torque",
        --ear1="Enchntr. Earring +1",
        --ear2="Malignance Earring",
        --body=gear.Artifact.Body,
        --hands=gear.Artifact.Hands,
        --ring1="Metamor. Ring +1",
        --ring2="Stikini Ring +1",
        --back=gear.capes.MAB,
        --waist="Witful Belt",
        --legs=gear.Artifact.Legs,
        --feet=gear.Relic.Feet,
    }

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
    	--main="Bunzi's Rod",
    	--sub="Ammurapi Shield",
    	--ammo="Ghastly Tathlum +1",
        --head="Agwu's Cap",
        --neck="Mizu. Kubikazari",
        --ear1="Friomisi Earring",
        --ear2="Malignance Earring",
        --body="Agwu's Robe",
        --hands="Amalric Gages +1",
        --ring1="Metamor. Ring +1",
        --ring2="Freke Ring",
        --back=gear.capes.MAB,
        --waist="Hachirin-no-Obi",
        --legs="Agwu's Slops",
        --feet="Agwu's Pigaches"
    }
		
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.precast.FC, {
    })
		
	sets.midcast.Helix = {
		--main="Bunzi's Rod",
		--sub="Ammurapi Shield",
		--ammo="Ghastly Tathlum +1",
        --head="Agwu's Cap",
        --neck="Mizu. Kubikazari",
        --ear1="Crep. Earring",
        --ear2="Malignance Earring",
        --body="Agwu's Robe",
        --hands="Amalric Gages +1",
        --ring1="Metamor. Ring +1",
        --ring2="Freke Ring",
        --back=gear.capes.MAB,
        --waist="Acuity Belt +1",
        --legs="Agwu's Slops",
        --feet="Amalric Nails +1"
    }
		
	sets.midcast.Helix.Proc = set_combine(sets.precast.FC,{
	})

	sets.midcast.Impact = {
		--main="Daybreak",
		--sub="Ammurapi Shield",
		--ammo="Pemphredo Tathlum",
		--head=empty,
		--neck="Erra Pendant",
		--ear1="Regal Earring",
		--ear2="Malignance Earring",
		--body="Twilight Cloak",
		--hands="Acad. Bracers +3",
		--ring1="Metamor. Ring +1",
		--ring2="Stikini Ring +1",
		--back=gear.capes.MAB,
		--waist="Acuity Belt +1",
		--legs="Merlinic Shalwar",
		--feet=gear.merlinic_nuke_feet
	}
	
	sets.buff['Ebullience'] = {
		--head=gear.Empyrean.Head,
	}
	sets.buff['Rapture'] = {
		--head=gear.Empyrean.Head,
	}
	sets.buff['Perpetuance'] = {
		--hands=gear.Empyrean.Hands,
	}
	sets.buff['Immanence'] = {
		--hands=gear.Empyrean.Hands,
	}
	sets.buff['Penury'] = {
		--legs=gear.Empyrean.Legs,
	}
	sets.buff['Parsimony'] = {
		--legs=gear.Empyrean.Legs,
	}
	sets.buff['Celerity'] = {
		--feet=gear.Relic.Feet,
	}
	sets.buff['Alacrity'] = {
		--feet=gear.Relic.Feet,
	}
	sets.buff['Klimaform'] = {
		--feet=gear.Empyrean.Feet,
	}

	sets.buff.Doom = set_combine(sets.AutoBuff.Doom, {})
	sets.buff['Light Arts'] = {
		--legs=gear.Artifact.Legs,
	}
	sets.buff['Dark Arts'] = {
		--body=gear.Artifact.Body,
	}

    sets.buff.Sublimation = {
    	--head=gear.Artifact.Head,
    	--body=gear.Relic.Body,
    	--left_ear="Savant's Earring",
    	--waist="Embla Sash",
    }
    sets.buff.DTSublimation = {
    	--waist="Embla Sash"
    }

	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		-- body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.WS = {
		--ammo="Staunch Tathlum",
		--head="Pixie Hairpin +1",
		--neck="Sanctity Necklace",
		--ear1="Evans Earring",
		--ear2="Etiolation Earring",
		--body="Amalric Doublet",
		--hands="Regal Cuffs",
		--ring1="Mephitas's Ring +1",
		--ring2="Mephitas's Ring",
		--back="Aurist's Cape +1",
		--waist="Yamabuki-no-Obi",
		--legs="Psycloth Lappas",
		--feet="Medium's Sabots"
	}

	sets.resting = {
		--main="Chatoyant Staff",
		--sub="Oneiros Grip",
		--ammo="Homiliary",
		--head="Befouled Crown",
		--neck="Chrys. Torque",
		--ear1="Etiolation Earring",
		--ear2="Ethereal Earring",
		--body="Amalric Doublet",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Defending Ring",
		--ring2="Dark Ring",
		--back="Umbra Cape",
		--waist="Fucho-no-obi",
		--legs="Assid. Pants +1",
		--feet=gear.chironic_refresh_feet
	}

	sets.idle = {
		--main="Daybreak",
		--sub="Genmei Shield",
		--ammo="Crepuscular Pebble",
		--head=gear.Empyrean.Head,
		--body="Nyame Mail",
		--hands="Nyame Gauntlets",
		--legs="Nyame Flanchard",
		--feet="Nyame Sollerets",
		--neck="Loricate Torque +1",
		--waist="Hachirin-no-Obi",
		--left_ear="Genmei Earring",
		--right_ear="Odnowa Earring +1",
		--left_ring="Defending Ring",
		--right_ring="Warp Ring",
		--back="Solemnity Cape",
	}

	sets.idle.PDT = set_combine(sets.idle, {
	})

	sets.idle.MDT = set_combine(sets.idle, {
	})

	sets.idle.Regen = set_combine(sets.idle, {
	})

    sets.idle.Refresh = set_combine(sets.idle, {
	})

	sets.engaged = {
		--ammo="Staunch Tathlum",
		--head="Malignance Chapeau",
		--body="Malignance Tabard",
		--hands=gear.Adhemar.Hands.TP,
		--legs="Malignance Tights",
		--feet="Malignance Boots",
		--neck="Warder's Charm +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Gelatinous Ring +1",
		--back=gear.capes.MAB,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {
		--head="Befouled Crown",
		--body="Jhakri Robe +2",
	}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	--local abil_recasts = windower.ffxi.get_ability_recasts()
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if arts_active() and sets.precast.FC.Arts then
			equip(sets.precast.FC.Arts)
		end
	elseif spell.type == 'WeaponSkill' then
	end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, spellMap, eventArgs)

    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end

	if spell.skill == 'Elemental Magic' and elemental_belt_check then
		elemental_belt_check(spell)
	end
	
	if spell.skill == 'Enfeebling Magic' then
		if (buffactive['Light Arts'] or buffactive['Addendum: White']) and sets.buff['Light Arts'] then
			equip(sets.buff['Light Arts'])
		elseif (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and sets.buff['Dark Arts'] then
			equip(sets.buff['Dark Arts'])
		end
	elseif default_spell_map == 'ElementalEnfeeble' and (buffactive['Dark Arts']  or buffactive['Addendum: Black']) and sets.buff['Dark Arts'] then
		equip(sets.buff['Dark Arts'])
    elseif spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
		if not state.CastingMode.value:contains('Proc') then
			if spell.element == world.weather_element or spell.element == world.day_element then
				if buffactive.Klimaform and spell.element == world.weather_element then
					equip(sets.buff['Klimaform'])
				end
			end
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			if buffactive.Ebullience then
				equip(sets.buff['Ebullience'])
			end
		end
		
        if buffactive['Immanence'] then
            equip(sets.buff['Immanence'])
        end
		
		if state.RecoverMode.value ~= 'Never' and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
			if state.MagicBurstMode.value ~= 'Off' then
				if sets.RecoverBurst then
					equip(sets.RecoverBurst)
				elseif sets.RecoverMP then
					equip(sets.RecoverMP)
				end
			elseif sets.RecoverMP then
				equip(sets.RecoverMP)
			end
		end
    end
	
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
		if spell.type == 'Scholar' then
			windower.send_command:schedule(1,'gs c showcharge')
		elseif spell.action_type == 'Magic' then
			if spell.english == 'Sleep' or spell.english == 'Sleepga' then
				windower.send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
			elseif spell.english == 'Sleep II' then
				windower.send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
			elseif spell.skill == 'Elemental Magic' and state.MagicBurstMode.value == 'Single' then
				state.MagicBurstMode:reset()
				update_job_states()
			end
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
end


function job_status_change(new_status, old_status)
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
	if user_state_change then
		user_state_change( stateField, newValue, oldValue )
	end

	if new_status == 'Engaged' then
	end

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
		if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
			if world.weather_element == 'Light' then
					return 'LightWeatherCure'
			elseif world.day_element == 'Light' then
					return 'LightDayCure'
			end
		elseif spell.skill == "Enfeebling Magic" then
			if spell.english:startswith('Dia') then
				return "Dia"
            elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
end


function customize_idle_set(idleSet)
	if buffactive['Sublimation: Activated'] then
        if (state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere')) and sets.buff.Sublimation then
            idleSet = set_combine(idleSet, sets.buff.Sublimation)
        elseif state.IdleMode.value:contains('DT') and sets.buff.DTSublimation then
            idleSet = set_combine(idleSet, sets.buff.DTSublimation)
        end
    end

    if state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere') then
		if player.mpp < 51 then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
		end
	end

	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-- Called for custom player commands.
function job_self_command(commandArgs, eventArgs)
    user_self_command( commandArgs, eventArgs )
    if type(commandArgs) == 'string' then
        commandArgs = T(commandArgs:split(' '))
        if #commandArgs == 0 then
            return
        end
    end
    if commandArgs[1]:lower() == 'scholar' then
        handle_strategems(commandArgs)
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'elemental' then
        handle_elemental(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'buff' then
		handle_buffing(commandArgs)
		eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'showcharge' then
		add_to_chat(204, '~~~Current Stratagem Charges Available: ['..get_current_strategem_count()..']~~~')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if buffactive.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if buffactive.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end

    if buffactive.Penury then
		equip(sets.buff['Penury'])
    elseif buffactive.Parsimony then
		equip(sets.buff['Parsimony'])
	end
	
	if spell.element == world.weather_element then
		if buffactive.Celerity then
			equip(sets.buff['Celerity'])
		elseif buffactive.Alacrity then
			equip(sets.buff['Alacrity'])
		end
	end
end

-- Handling Elemental spells within Gearswap.
-- Format: gs c elemental <nuke, helix, skillchain1, skillchain2, weather>
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()

		
	local immactive = 0
		
	if buffactive['Immanence'] then
		immactive = 1
	end
	
	if command == 'spikes' then
		windower.chat.input('/ma "'..data.elements.spikes_of[state.ElementalMode.value]..' Spikes" <me>')
		return
	elseif command == 'enspell' then
		windower.chat.input('/ma "En'..data.elements.enspell_of[state.ElementalMode.value]..'" <me>')
		return
	--Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[data.elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
			windower.chat.input('/ma "Klimaform" <me>')
		elseif player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..' II"')
		else
			windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
		end
		return
	end
	
	local target = '<t>'
	if cmdParams[3] then
		if tonumber(cmdParams[3]) then
			target = tonumber(cmdParams[3])
		else
			target = table.concat(cmdParams, ' ', 3)
			target = get_closest_mob_id_by_name(target) or '<t>'
		end
	end
	
    if command == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Light' then
			if spell_recasts[29] < spell_latency and actual_cost(get_spell_table_by_name('Banish II')) < player.mp then
				windower.chat.input('/ma "Banish II" '..target..'')
			elseif spell_recasts[28] < spell_latency and actual_cost(get_spell_table_by_name('Banish')) < player.mp then
				windower.chat.input('/ma "Banish" '..target..'')
			else
				add_to_chat(123,'Abort: Banishes on cooldown or not enough MP.')
			end

		else
			local tiers = {' V',' IV',' III',' II',''}
			for k in ipairs(tiers) do
				if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp and (buffactive['Addendum: Black'] or not tiers[k]:endswith('V')) then
					windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
					return
				end
			end
			add_to_chat(123,'Abort: All '..data.elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		end
		
	elseif command == 'ninjutsu' then
		windower.chat.input('/ma "'..data.elements.ninjutsu_nuke_of[state.ElementalMode.value]..': Ni" '..target..'')
			
	elseif command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		local tiers = {' II',''}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
				windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
				return
			end
		end
		add_to_chat(123,'Abort: All '..data.elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		
	elseif command:contains('tier') then
		local tierlist = {['tier1']='',['tier2']=' II',['tier3']=' III',['tier4']=' IV',['tier5']=' V',['tier6']=' VI'}
		
		windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..tierlist[command]..'" '..target..'')
		
	elseif command == 'ara' then
		windower.chat.input('/ma "'..data.elements.nukera_of[state.ElementalMode.value]..'ra" '..target..'')
		
	elseif command == 'aga' then
		windower.chat.input('/ma "'..data.elements.nukega_of[state.ElementalMode.value]..'ga" '..target..'')
		
	elseif command == 'helix' then
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 1199 then
			windower.chat.input('/ma "'..data.elements.helix_of[state.ElementalMode.value]..'helix II" '..target..'')
		else
			windower.chat.input('/ma "'..data.elements.helix_of[state.ElementalMode.value]..'helix" '..target..'')
		end
		
	elseif command == 'enfeeble' then
		windower.chat.input('/ma "'..data.elements.elemental_enfeeble_of[state.ElementalMode.value]..'" '..target..'')
	
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..data.elements.threnody_of[state.ElementalMode.value]..' Threnody" '..target..'')
		
	elseif command == 'skillchain1' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			windower.chat.input('/item "remedy" <me>')
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' then
				windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Stone" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[281] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Pyrohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Fire" <t>')
				end
			elseif state.ElementalMode.value == 'Wind' then
				windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Stone" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[280] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Anemohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Aero" <t>')
				end
			elseif state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Water" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[283] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Ionohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Thunder" <t>')
				end
			elseif state.ElementalMode.value == 'Light' then
				local spell_recasts = windower.ffxi.get_spell_recasts()
				if spell_recasts[284] > spell_latency or spell_recasts[285] > spell_latency + 7 then
					add_to_chat(123,'Abort: Noctohelix or Luminohelix on cooldown.')
				else
					windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
					windower.chat.input:schedule(1.3,'/ma "Noctohelix" <t>')
					windower.chat.input:schedule(6.6,'/ja "Immanence" <me>')
					windower.chat.input:schedule(7.9,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
					windower.chat.input:schedule(7.9,'/ma "Luminohelix" <t>')
				end
			elseif state.ElementalMode.value == 'Earth' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Fire" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[278] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Geohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Stone" <t>')
				end
			elseif state.ElementalMode.value == 'Ice' then
				windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Water" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[282] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Cryohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Blizzard" <t>')
				end
			elseif state.ElementalMode.value == 'Water' then
				windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Stone" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[279] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Hydrohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Water" <t>')
				end
			elseif state.ElementalMode.value == 'Dark' then
				if windower.ffxi.get_spell_recasts()[284] > (spell_latency + 6) then
					add_to_chat(123,'Abort: Noctohelix on cooldown.')
				else
					windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
					windower.chat.input:schedule(1.3,'/ma "Blizzard" <t>')
					windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
					windower.chat.input:schedule(6.9,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
					windower.chat.input:schedule(6.9,'/ma "Noctohelix" <t>')
				end
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
		end
	
	elseif command == 'skillchain2' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
			
			
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' or state.ElementalMode.value == 'Light' then
				windower.chat.input('/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Fire" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[283] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Ionohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Thunder" <t>')
				end
			elseif state.ElementalMode.value == 'Wind' or state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1.3,'/ma "Blizzard" <t>')
				windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6.9,'/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> CLOSE!')
				if windower.ffxi.get_spell_recasts()[279] < (spell_latency + 6) then
					windower.chat.input:schedule(6.9,'/ma "Hydrohelix" <t>')
				else
					windower.chat.input:schedule(6.9,'/ma "Water" <t>')
				end
			elseif state.ElementalMode.value == 'Earth' or state.ElementalMode.value == 'Dark' then
				if windower.ffxi.get_spell_recasts()[284] > (spell_latency + 6) then
					add_to_chat(123,'Abort: Noctohelix on cooldown.')
				else
					windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
					windower.chat.input:schedule(1.3,'/ma "Aero" <t>')
					windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
					windower.chat.input:schedule(6.9,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
					windower.chat.input:schedule(6.9,'/ma "Noctohelix" <t>')
				end
			elseif state.ElementalMode.value == 'Ice' or state.ElementalMode.value == 'Water' then
				if windower.ffxi.get_spell_recasts()[285] > spell_latency then
					add_to_chat(123,'Abort: Luminohelix on cooldown.')
				else
					windower.chat.input('/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> OPEN!')
					windower.chat.input:schedule(1.3,'/ma "Luminohelix" <t>')
					windower.chat.input:schedule(6.6,'/ja "Immanence" <me>')
					windower.chat.input:schedule(7.9,'/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> CLOSE!')
					if windower.ffxi.get_spell_recasts()[278] < (spell_latency + 6) then
						windower.chat.input:schedule(7.9,'/ma "Geohelix" <t>')
					else
						windower.chat.input:schedule(7.9,'/ma "Stone" <t>')
					end
				end
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
			

		end
		
	elseif command == 'skillchain3' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 3 then
			add_to_chat(123,'Abort: You have less than three stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input:schedule(1.3,'/ma "Stone" <t>')
			windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6.9,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6.9,'/ma "Fire" <t>')
			windower.chat.input:schedule(13,'/ja "Immanence" <me>')
			windower.chat.input:schedule(14.3,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
			if windower.ffxi.get_spell_recasts()[283] < (spell_latency + 12) then
				windower.chat.input:schedule(14.3,'/ma "Ionohelix" <t>')
			else
				windower.chat.input:schedule(14.3,'/ma "Thunder" <t>')
			end
		else
			add_to_chat(123,'Abort: Fire is the only element with a consecutive 3-step skillchain.')
		end
	
	elseif command == 'skillchain4' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 4 then
			add_to_chat(123,'Abort: You have less than four stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		else 
			state.CastingMode:set('Proc')
			windower.chat.input('/p Starting 4-Step '..auto_translate('Skillchain')..' -<t>-')
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/ma "Aero" <t>')
			windower.chat.input:schedule(5.6,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6.9,'/ma "Stone" <t>')
			windower.chat.input:schedule(11.2,'/ja "Immanence" <me>')
			windower.chat.input:schedule(12.5,'/ma "Water" <t>')
			windower.chat.input:schedule(17.8,'/ja "Immanence" <me>')
			windower.chat.input:schedule(19.1,'/ma "Thunder" <t>')
		end
		
	elseif command == 'skillchain6' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif get_current_strategem_count() < 5 then
			add_to_chat(123,'Abort: You have less than five stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif not buffactive['Immanence'] then
			add_to_chat(123,'Immanence not active, wait for stratagem cooldown. - Activating Immanence.')
			windower.chat.input('/ja "Immanence" <me>')
		else
			state.CastingMode:set('Proc')
			if state.DisplayMode.value then update_job_states()	end
			windower.chat.input('/p Starting 6-Step '..auto_translate('Skillchain')..' -<t>-')
			windower.chat.input('/ma "Aero" <t>')
			windower.chat.input:schedule(4.3,'/ja "Immanence" <me>')
			windower.chat.input:schedule(5.6,'/ma "Stone" <t>')
			windower.chat.input:schedule(9.9,'/ja "Immanence" <me>')
			windower.chat.input:schedule(11.2,'/ma "Water" <t>')
			windower.chat.input:schedule(15.5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(16.8,'/ma "Thunder" <t>')
			windower.chat.input:schedule(21.1,'/ja "Immanence" <me>')
			windower.chat.input:schedule(22.4,'/ma "Fire" <t>')
			windower.chat.input:schedule(26.7,'/ja "Immanence" <me>')
			windower.chat.input:schedule(28,'/ma "Thunder" <t>')
		end
	
	elseif command == 'wsskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif player.tp < 1000 then
			add_to_chat(123,'Abort: You don\'t have enough TP for this skillchain.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 1 then
			add_to_chat(123,'Abort: You have less than one stratagems available.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			else
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Shell Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			end
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
			windower.chat.input('/ws "Omniscience" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			else
				windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Omniscience" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			end
		end
		
	elseif command == 'endskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif not (buffactive['Dark Arts']  or buffactive['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Stone" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1.3,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1.3,'/ma "Noctohelix" <t>')
		end
	
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end

function handle_buffing(cmdParams)
	-- cmdParams[1] == 'buff'
    -- cmdParams[2] == ability to use
	-- cmdParams[3] == optional target

    if not cmdParams[2] then
        add_to_chat(123,'Error: No buff command given.')
        return
    end
    local command = cmdParams[2]:lower()

	if buffactive.silence or buffactive.mute or buffactive.paralysis then
		add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling buff.')
		return
	end

	-- determine target
	local target = '<me>'
	if player.target.type ~= "MONSTER" then
		target = '<t>'
	end
	if cmdParams[3] then
		target = cmdParams[3]
	end

	-- default to long, party wide buffs
	local params = {
		needs_addendum = false,
		accession = true,
		perpetuance = true,
		target = target,
	}

	if command == 'regen' then
		params.spell = 'Regen V'
		buff_helper(params)
	elseif command == 'tp' then
		params.spell = 'Adloquium'
		buff_helper(params)
	elseif command == 'klimaform' then
		local schedule = 0.1
		if not (buffactive['Dark Arts'] or buffactive['Addendum: Black']) then
			windower.chat.input('/ja "Dark Arts" <me>')
			schedule = schedule + 2
		end
		if not (buffactive['Manifestation']) then
			windower.chat.input:schedule(schedule,'/ja "Manifestation" <me>')
			schedule = schedule + 2
		end
		windower.chat.input:schedule(schedule,'/ma "Klimaform" <me>')
	elseif command == 'weather' then
		params.perpetuance = false
		params.target = '<me>'
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			params.spell = data.elements.storm_of[state.ElementalMode.value]..' II'
		else
			params.spell = data.elements.storm_of[state.ElementalMode.value]
		end
		buff_helper(params)
	elseif command == 'embrava' then
		if not buffactive['Tabula Rasa'] then
			add_to_chat(123,'Abort: You need to tabula rasa.')	
		else
			params.spell = 'Embrava'
			buff_helper(params)
		end
	elseif command == 'protect' then
		params.spell = 'Protect V'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'shell' then
		params.spell = 'Shell V'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'sneak' then
		params.spell = 'Sneak'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'invisible' then
		params.spell = 'Invisible'
		params.perpetuance = false
		buff_helper(params)
	elseif command == 'reraise' then
			params.spell = 'Reraise III'
			params.perpetuance = false
			params.accession = false
			params.needs_addendum = true
			params.target = '<me>'
			buff_helper(params)
		else				
		add_to_chat(123,'Unrecognized buffing command.')
	end
end

-- normalize buffing
function buff_helper(params)
	local schedule = .1
	local strats_needed = 0

	-- base art activation needed
	if not (buffactive['Light Arts'] or buffactive['Addendum: White']) then
		windower.chat.input('/ja "Light Arts" <me>')
		schedule = schedule + 2
	end

	if params.needs_addendum and not buffactive['Addendum: White'] then
		windower.chat.input:schedule(schedule,'/ja "Addendum: White" <me>')
		schedule = schedule + 2
	end

	--determine strat requirements
	if params.accession then
		strats_needed = strats_needed + 1
	end

	if params.perpetuance then
		strats_needed = strats_needed + 1
	end

	--abort if we don't have required strats
	if (get_current_strategem_count()) < strats_needed then
		add_to_chat(123,'Abort: You have less than the required stratagems available.')
		return
	end
	
	--apply ja modifiers and schedule out casting
	if params.accession and not buffactive['Accession'] then
		windower.chat.input:schedule(schedule,'/ja "Accession" <me>')
		schedule = schedule + 2
	end

	if params.perpetuance and not buffactive['Perpetuance'] then
		windower.chat.input:schedule(schedule,'/ja "Perpetuance" <me>')
		schedule = schedule + 2
	end

	windower.chat.input:schedule(schedule,'/ma "' .. params.spell .. '" ' .. params.target)

end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['Light Arts'] then
            windower.chat.input('/ja "Addendum: White" <me>')
        elseif buffactive['Addendum: White'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            windower.chat.input('/ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['Dark Arts'] then
            windower.chat.input('/ja "Addendum: Black" <me>')
        elseif buffactive['Addendum: Black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            windower.chat.input('/ja "Dark Arts" <me>')
        end
    elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
        if strategem == 'cost' then
            windower.chat.input('/ja "Penury" <me>')
        elseif strategem == 'speed' then
            windower.chat.input('/ja "Celerity" <me>')
        elseif strategem == 'aoe' then
            windower.chat.input('/ja "Accession" <me>')
        elseif strategem == 'power' then
            windower.chat.input('/ja "Rapture" <me>')
        elseif strategem == 'duration' then
            windower.chat.input('/ja "Perpetuance" <me>')
        elseif strategem == 'accuracy' then
            windower.chat.input('/ja "Altruism" <me>')
        elseif strategem == 'enmity' then
            windower.chat.input('/ja "Tranquility" <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            windower.chat.input('/ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['Dark Arts']  or buffactive['Addendum: Black'] then
        if strategem == 'cost' then
            windower.chat.input('/ja "Parsimony" <me>')
        elseif strategem == 'speed' then
            windower.chat.input('/ja "Alacrity" <me>')
        elseif strategem == 'aoe' then
            windower.chat.input('/ja "Manifestation" <me>')
        elseif strategem == 'power' then
            windower.chat.input('/ja "Ebullience" <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            windower.chat.input('/ja "Focalization" <me>')
        elseif strategem == 'enmity' then
            windower.chat.input('/ja "Equanimity" <me>')
        elseif strategem == 'skillchain' then
            windower.chat.input('/ja "Immanence" <me>')
        elseif strategem == 'addendum' then
            windower.chat.input('/ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


function job_tick()
	if check_arts() then return true end
	if check_buff() then return true end
	return false
end

function check_arts()
	if not arts_active() then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] < latency then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = os.clock() + jatickdelay
			return true
		end

	end
	
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
	end

	return false
end

function get_spell_table_by_name(name)
	spells = require('resources').spells
	for k,v in pairs(spells) do
        if v.en:lower() == name:lower() then
            return v
        end
    end
    return nil
end

function actual_cost(spell)
	return spell.mp_cost
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end