function user_job_setup()
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Seraph Blade', 'Savage Blade', 'Sanguine Blade', 'Evisceration', }

    state.Weapons = M{['description'] = 'Weapon Setup', 'Mage', 'Seraph', 'Savage', 'Dagger', }
    gear.weapons = {}
	gear.weapons['Mage'] = {
		main="Daybreak",
		sub="Sacro Bulwark",
	}
    --match key to state.weapons options
	gear.weapons['Seraph'] = {
		main="Crocea Mors",
		sub="Daybreak",
	}
    gear.weapons['Savage'] = {
        main="Naegling",
        sub="Thibron",
    }
    gear.weapons['Dagger'] = {
        main="Tauret",
        sub="Gleti's Knife",
    }

	gear.Artifact = {}
	gear.Artifact.Head = "Atrophy Chapeau +3"
	gear.Artifact.Body = "Atrophy Tabard +3"
	gear.Artifact.Hands = "Atrophy Gloves +3"
	gear.Artifact.Legs = "Atrophy Tights +2"
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Viti. Chapeau +3"
	gear.Relic.Body = { name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}
	gear.Relic.Hands = "Viti. Gloves +3"
	gear.Relic.Legs = "Viti. Tights +3"
	gear.Relic.Feet = "Vitiation Boots +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Leth. Chappel +3"
	gear.Empyrean.Body = "Lethargy Sayon +3"
	gear.Empyrean.Hands = "Leth. Ganth. +3"
	gear.Empyrean.Legs = "Leth. Fuseau +3"
	gear.Empyrean.Feet = "Leth. Houseaux +3"

	gear.capes = {}
	gear.capes.MNDEnfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.capes.FC = gear.capes.MNDEnfeeble
	gear.capes.INTEnfeeble = gear.capes.MNDEnfeeble --{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	gear.capes.DRKMagic = gear.capes.INTEnfeeble
	gear.capes.DexTP = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.capes.DexDW = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}--{ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}}
	gear.capes.MagicMndWS = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	gear.capes.MagicINTWS = gear.capes.MagicMndWS--{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
	gear.capes.StrWS =  { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+1','Weapon skill damage +10%',}}

end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		-- body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.Empyrean = {
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	}

	sets.precast.JA['Chainspell'] = {
		body=gear.Relic.Body
	}

	sets.precast.FC = {
		head=gear.Artifact.Head,
		body=gear.Relic.Body,
		back=gear.capes.FC,
		waist="Witful Belt",
		right_ear="Lethargy Earring +1",
		left_ring="Weather. Ring +1",
	}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		--head=empty,
		--body="Twilight Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Sacro Bulwark"
	})

	sets.precast.WS = {
		main="",
		sub="",
		range="",
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Empyrean.Feet,
		neck="Rep. Plat. Medal",
		back=gear.capes.StrWS,
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
	}

	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS,{
		ammo="Sroda Tathlum",
		head=gear.Empyrean.Head,
		hands=gear.Jhakri.Hands,
		neck="Dls. Torque +2",
		back=gear.capes.MagicMndWS,
		waist="Orpheus's Sash",
		right_ear="Malignance Earring",
		left_ring="Weather. Ring +1",
		right_ring="Medada's Ring",
	})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS,{
		ammo="Sroda Tathlum",
		head="Pixie Hairpin +1",
		hands=gear.Jhakri.Hands,
		legs=gear.Empyrean.Legs,
		neck="Dls. Torque +2",
		back=gear.capes.MagicMndWS,
		waist="Orpheus's Sash",
		right_ear="Malignance Earring",
		left_ring="Archon Ring",
		right_ring="Medada's Ring",
	})

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		ammo="Sroda Tathlum",
		hands=gear.Jhakri.Hands,
		legs=gear.Empyrean.Legs,
		neck="Sibyl Scarf",
		back=gear.capes.MagicMndWS,
		waist="Orpheus's Sash",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Medada's Ring",
	})
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS,{
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body=gear.Empyrean.Body,
		hands="Malignance Gloves",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Malignance Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Mache Earring +1",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back=gear.capes.DexTP,
	})

	sets.midcast.FastRecast = {
		main="",
		sub="",
		range="",
		ammo="",
		head=gear.Artifact.Head,
		body=gear.Relic.Body,
		hands="Gende. Gages +1",
		legs="Psycloth Lappas",
		feet="Carmine Greaves +1",
		neck="Voltsurge Torque",
		back=gear.capes.FC,
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Lethargy Earring +1",
		left_ring="Weather. Ring +1",
		right_ring="Medada's Ring",
	}

    sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		range="",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		body=gear.Relic.Body,
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'Healing magic skill +18','"Cure" spellcasting time -6%','Magic dmg. taken -2',}},
		neck="Yngvi Choker",
		back="Solemnity Cape",
		right_ear="Gifted Earring",
		left_ring="Menelaus's Ring",
		right_ring="Stikini Ring +1",		

		--main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        --head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        --body="Viti. Tabard +3",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        --back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"
	}		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",
		--hands="Hieros Mittens",
		back="Oretan. Cape +1",
		--ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"
	})

	--When you really want to min/max @TODO
	--sets.Cure.Targets['Self'] = {}

	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		range=empty,
		ammo="Staunch Tathlum +1",
		head=gear.Telchine.Head.Enhancing,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Telchine.Legs.Enhancing,
		feet=gear.Empyrean.Feet,
		neck="Dls. Torque +2",
		back=gear.capes.FC,
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Lethargy Earring +1",
		left_ring=gear.rings['Stikini L'],
		right_ring=gear.rings['Stikini R'],
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = set_combine(sets.Empyrean,{
		hands=gear.Artifact.Hands,
	})
	
	sets.buff.ComposureSelf = {}
	
	sets.EnhancingSkill = set_combine(sets.midcast['Enhancing Magic'],{
		--main="Pukulatmuj +1",
		head="Befouled Crown",
		hands=gear.Relic.Hands,
		legs=gear.Artifact.Legs,
		--neck="Incanter's Torque",
		back="Perimede Cape",
		waist="Olympus Sash",
		right_ear="Mimir Earring",
	})
	sets.midcast.Refresh = {
		head="Amalric Coif +1",
		body=gear.Artifact.Body,
		legs=gear.Empyrean.Legs
	}
	sets.midcast.Aquaveil = {
		head="Amalric Coif +1",
		--hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast['Temper II'] = sets.midcast.Temper
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.BoostStat = {hands=gear.Relic.Hands}
	sets.midcast.Stoneskin = {
		neck="Nodens Gorget",
		--right_ear="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	}
	
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range=empty,
		ammo="Pemphredo Tathlum",
		head=gear.Relic.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Relic.Feet,
		neck="Dls. Torque +2",
		back=gear.capes.MNDEnfeeble,
		waist="Obstin. Sash",
		left_ear="Malignance Earring",
		right_ear="Snotra Earring",
		right_ring="Metamor. Ring +1",
		left_ring="Stikini Ring +1",
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
		range="Ullr",
		ammo="",
		back="Aurist's Cape +1",
		waist="Acuity Belt +1",
		right_ring="Stikini Ring +1",
	}) --accuracy
	sets.midcast['Enfeebling Magic'].Skill = set_combine(sets.midcast['Enfeebling Magic'], {
		body=gear.Artifact.Body,
		legs="Psycloth Lappas",
		waist="Rumination Sash",
		left_ear="Vor Earring",
		left_ring="Stikini Ring +1",
	})
	sets.midcast['Enfeebling Magic'].Duration = set_combine(sets.midcast['Enfeebling Magic'], {
		head=gear.Empyrean.Head,
		right_ring="Kishar Ring",
	})
				
	sets.midcast.Silence = sets.midcast['Enfeebling Magic'].Duration
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = sets.midcast['Enfeebling Magic'].Duration
	sets.midcast.Sleep.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Bind = sets.midcast['Enfeebling Magic'].Duration
	sets.midcast.Bind.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Break = sets.midcast['Enfeebling Magic'].Duration
	sets.midcast.Break.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast['Enfeebling Magic'].Skill
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Distract III'] = sets.midcast['Enfeebling Magic'].Skill
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], {
		right_ring="Kishar Ring",
	})
	sets.midcast.Diaga = sets.midcast.Dia
	sets.midcast['Dia II'] = sets.midcast.Dia
	sets.midcast['Dia III'] = sets.midcast.Dia
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Bio II'] = sets.midcast.Bio
	sets.midcast['Bio III'] = sets.midcast.Bio

    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		range="",
		ammo="Ghastly Tathlum +1",
		head="Ea Hat +1",
		body="Ea Houppe. +1",
		hands="Bunzi's Gloves",
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Sibyl Scarf",
		back="Aurist's Cape +1",
		waist="Skrymir Cord +1",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		left_ring="Freke Ring",
		right_ring="Medada's Ring",
	}

    sets.midcast['Elemental Magic'].Proc = set_combine(sets.precast.FC, {})
		
	sets.midcast.Impact = {}

	sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		range="Ullr",
		ammo="",
		head="Pixie Hairpin +1",
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet="Merlinic Crackows",
		neck="Erra Pendant",
		back="Aurist's Cape +1",
		waist="Acuity Belt +1",
		left_ear="Malignance Earring",
		right_ear="Digni. Earring",
		left_ring="Archon Ring",
		right_ring="Evanescence Ring",
	}

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
	})
	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		main="Daybreak",
		neck="Dls. Torque +2",
		left_ring="Weather. Ring +1",
		right_ring="Medada's Ring",
	})

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {
		hands=gear.Empyrean.Hands,
	}

	sets.idle = {
		ammo="Homiliary",
		head=gear.Relic.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Carmine Cuisses +1",
		feet=gear.Empyrean.Feet,
		neck="Yngvi Choker",
		back=gear.capes.FC,
		waist="Plat. Mog. Belt",
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Warp Ring",
		right_ring="Stikini Ring +1",
	}
	sets.idle.Normal = set_combine(sets.idle, {
	})
	sets.idle.Turtle = set_combine(sets.idle, {
	})
	--must augment chironic, several weapon choices
	sets.idle.Refresh = set_combine(sets.idle, {
		hands="Merlinic Dastanas",
		legs="Chironic Hose",
		feet="Merlinic Crackows",
		left_ring="Stikini Ring +1",
	})
	sets.latent_refresh = {}

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Bunzi's Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		back=gear.capes.DexTP,
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
	}

	sets.engaged.Melee = set_combine(sets.engaged, {
	})

	sets.engaged.Enspell = set_combine(sets.engaged, {
		ammo="Sroda Tathlum",
		hands=gear.Ayanmo.Hands,
		legs=gear.Relic.Legs,
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
		hands="Malignance Gloves",
		neck="Sanctity Necklace",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})
end

function select_default_macro_book()
end