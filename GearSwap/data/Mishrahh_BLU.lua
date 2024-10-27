-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()

	state.OffenseMode:options( 'PDT', 'Evasion', 'Melee', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Buffed' )
	state.IdleMode:options( 'Normal', 'Evasion', 'PDT', 'MDT', 'Regen', 'Zeni' )
	state.CastingMode         = M{['description'] = 'Casting Mode', 'Normal', 'Evasion' }

	include('Mote-TreasureHunter')
	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}

	state.Weapons = M{['description'] = 'Weapon Setup', 'Casting', 'Accuracy', 'Melee', 'Evasion', }
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Chant du Cygne', 'Savage Blade', }
	gear.weapons = {}
	gear.weapons['Casting'] = {
		main="Maxentius",
		sub="Bunzi's Rod",
	}
	gear.weapons['Accuracy'] = {
		main="Naegling",
		sub="Zantetsuken",
	}
	gear.weapons['Melee'] = {
		main="Naegling",
		sub="Thibron",
	}
	gear.weapons['Evasion'] = {
		main="Naegling",
		sub="Sakpata's Sword",
	}	
	
	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = "Assim. Keffiyeh +2"
	gear.Artifact.Body = "Assim. Jubbah +3"
	gear.Artifact.Hands = "Assim. Bazu. +1"
	gear.Artifact.Legs = "Assim. Shalwar +2"
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Luhlaza Jubbah +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Luhlaza Shalwar +3"
	gear.Relic.Feet = "Luhlaza Charuqs +2"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Hashishin Kavuk +3"
	gear.Empyrean.Body = "Hashishin Mintan +3"
	gear.Empyrean.Hands = "Hashishin Bazubands +3"
	gear.Empyrean.Legs = "Hashishin Tayt +3"
	gear.Empyrean.Feet = "Hashi. Basmak +3"

	gear.capes = {}
	gear.capes.TP = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.CritWS = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.capes.STRWSD = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.MAB = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	blu_spell_map()

	state.AutoMagicBuffs = M{['description'] = 'Automatic Magic Buffs', 'Auto', 'Basics', 'Manual', 'Cleave', }

	automatic_magic_buffs = {
		Manual = {
		},

		Basics = {
			{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle', Wait = 6 },
		},

		Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
			{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always', Wait = 6 },
			{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle', Wait = 6 },
			{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle', Wait = 6 },
			{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged', Wait = 5 },
			--{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Idle', Wait = 5 },			
		},
		
		Cleave = {
			{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Idle', Wait = 5 },
			{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle', Wait = 5 },
			{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	When='Idle', Wait = 5 },
			{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	When='Idle', Wait = 5 },
			{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		When='Idle', Wait = 6 },
			{Name='Diamondhide',		Buff='Stoneskin',		SpellID=54,		When='Idle', Wait = 6 },
			{Name='Occultation',		Buff='Blink',			SpellID=679,	When='Idle', Wait = 6 },
			{Name='Blink',				Buff='Blink',			SpellID=53,		When='Idle', Wait = 5 },
			{Name='Aquaveil',			Buff='Blink',			SpellID=53,		When='Idle', Wait = 5 },
			--{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	When='Idle', Wait = 5 },
			--{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	When='Idle', Wait = 5 },
		},
	}

	select_default_macro_book()

	send_command('wait 10; input /lockstyle on')

end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Herc.Hands.TH,
		body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.Empyrean = {
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
	}

--JA SETS
	sets.buff['Burst Affinity'] = {
		feet=gear.Empyrean.Feet
	}
	sets.buff['Chain Affinity'] = {
		--feet=gear.Artifact.Feet
	}
	sets.buff.Convergence = {
		--head=gear.Relic.Head
	}
	sets.buff.Diffusion = {
		feet=gear.Relic.Feet
	}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {
		--back=gear.da_jse_back,
		legs=gear.Empyrean.Legs
	}
	sets.buff.Doom = set_combine(sets.AutoBuff.Doom, {})

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {
		--hands=gear.Relic.Hands
	}

--WS SETS
	sets.precast.WS = {
		ammo="Aurgelmir Orb",
		head=gear.Adhemar.Head.B,
		body="Gleti's Cuirass",
		hands=gear.Adhemar.Hands.B,
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Mirage Stole +2",
		waist="Fotia Belt",
		left_ear="Mache Earring +1",
		right_ear="Odr Earring",
		left_ring="Epona's Ring",
		right_ring="Begrudging Ring",
		back=gear.capes.CritWS,
	}

	sets.precast.WS['Chant Du Cygne'] = set_combine( sets.precast.WS, {

	} )

	sets.precast.WS['Requiescat'] = set_combine( sets.precast.WS, {
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Gorget",
		left_ear="Moonshade Earring",
		right_ear="Brutal Earring",
		left_ring="Sroda Ring",
		right_ring="Metamor. Ring +1",
	} )
	sets.precast.WS['Realmrazer'] = set_combine( sets.precast.WS['Requiescat'], {

	} )

	sets.precast.WS['Sanguine Blade'] = set_combine( sets.precast.WS['Requiescat'], {
		head="Pixie Hairpin +1",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Medada's Ring",
		back=gear.capes.MAB,
	} )

	sets.precast.WS['Savage Blade'] = set_combine( sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head=gear.Empyrean.Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		waist="Sailfi Belt +1",
		back=gear.capes.STRWSD,
	} )
	sets.precast.WS['Savage Blade'].Buffed = set_combine( sets.precast.WS['Savage Blade'], {
		body="Gleti's Cuirass",
	} )
	sets.precast.WS['Black Halo'] = set_combine( sets.precast.WS['Savage Blade'], {} )
	sets.precast.WS['Black Halo'].Buffed = set_combine( sets.precast.WS['Savage Blade'].Buffed, {} )

--CASTING SETS
	sets.precast.FC = {
		main="Vampirism",
		--sub="Vampirism",
		ammo="Impatiens",
		--head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body=gear.Relic.Body,
		hands="Leyline Gloves",
		ring1="Weather. Ring +1",
		ring2="Medada's Ring",
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Carmine Greaves +1"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
	})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {
		body=gear.Empyrean.Body
	})

	sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		--ammo="Hasty Pinion +1",
		--ring2="Prolix Ring",
		--back="Swith Cape +1",
	} )

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = set_combine( sets.Empyrean, {
		main="Vampirism",
		sub="Iris",
		ammo="Coiste Bodhar",
		neck="Mirage Stole +2",
		body=gear.Relic.Body,
		hands="Gleti's Gauntlets",
		ring1="Chirich Ring +1",
		ring2="Ilabrat Ring",
		left_ear="Mache Earring +1",
		right_ear="Hashi. Earring +2",
		back=gear.capes.STRWSD,
		waist="Grunfeld Rope",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
	})

	--Can do attribute specific stuff, idc
	sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = set_combine( sets.Empyrean, {
		main="Maxentius",
		sub="Bunzi's Rod",
		ammo="Ghastly Tathlum +1",
		legs=gear.Relic.Legs,
		neck="Sibyl Scarf",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		ring1="Metamor. Ring +1",
		ring2="Medada's Ring",		
		back=gear.capes.MAB,
		waist="Orpheus's Sash",
	})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {
		main="Sakpata's Sword",
		ammo="Pemphredo Tathlum",
		body=gear.Relic.Body,
		neck="Mirage Stole +2",
		left_ear="Digni. Earring",
		right_ear="Hashi. Earring +2",
		left_ring="Stikini Ring +1",
		right_ring="Medada's Ring",
		back=gear.capes.MAB,
		waist="Acuity Belt +1",
	} )
	sets.midcast['Blue Magic']['Feather Tickle'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {
		head="Carmine Mask +1",
		feet="Malignance Boots",
		waist="Witful Belt",
	})
	sets.midcast['Blue Magic']['Reaving Wind'] = sets.midcast['Blue Magic']['Feather Tickle']
	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		ammo="Pemphredo Tathlum",
		neck="Mirage Stole +2",
		--ear1="Regal Earring",
		ear2="Digni. Earring",
		--hands="Regal Cuffs",
		ring2="Stikini Ring +1",
		--waist="Luminary Sash",
		legs="Psycloth Lappas",
		--feet="Skaoi Boots"
	} )

	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		ammo="Pemphredo Tathlum",
		neck="Erra Pendant",
		--ear1="Regal Earring",
		ear2="Digni. Earring",
		ring2="Stikini Ring +1",
		--waist="Luminary Sash",
	} )

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		main="Vampirism",
		--sub="Vampirism",
		--ammo="Hasty Pinion +1",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Gifted Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Perimede Cape",
		--waist="Olympus Sash",
	} )
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"
	})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"
	})

	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {
	} )

	sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		hands="Amalric Gages +1",
		waist=gear.ElementalObi,
	} )

	sets.midcast.diaga = sets.TreasureHunter
	sets.midcast['Poisonga'] = sets.TreasureHunter
	sets.midcast['Poisonga II'] = sets.TreasureHunter

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element = {}
	sets.element.Dark = {
		head="Pixie Hairpin +1",
		ring1="Archon Ring"
	}
	sets.element.Light = {
		ring1="Weather. Ring +1",
	}

	sets.midcast.Cure = set_combine(sets.midcast['Blue Magic'].Magical, {
		ammo="Pemphredo Tathlum",
		--head="Carmine Mask +1",
		--neck="Incanter's Torque",
		--ear1="Etiolation Earring",
		--ear2="Mendi. Earring",
		--body="Vrikodara Jupon",
		--hands="Telchine Gloves",
		--ring1="Janniston Ring",
		--ring2="Menelaus's Ring",
		--back=gear.ElementalCape,
		waist=gear.ElementalObi,
		--legs="Carmine Cuisses +1",
		feet="Medium's Sabots"
	} )

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",
		--hands="Hieros Mittens",
		--back="Oretan. Cape +1",
		--ring1="Haoma's Ring",
		--ring2="Menelaus's Ring",
		--waist="Witful Belt"
	})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = set_combine( sets.Empyrean, {
		ammo="Mavi Tathlum",
		--head=gear.Relic.Head,
		neck="Mirage Stole +2",
		--ear1="Regal Earring",
		--ear2="Digni. Earring",
		body=gear.Artifact.Body,
		--hands=gear.Relic.Hands,
		--ring1="Kunaji Ring",
		--ring2="Meridian Ring",
	})

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = set_combine( sets.Empyrean, {
		ammo="Pemphredo Tathlum",
		neck="Mirage Stole +2",
		--ear1="Regal Earring",
		ear2="Digni. Earring",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring +1",
		back="Cornflower Cape",
		waist="Acuity Belt +1",
	})

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Mavi Tathlum",
		--head="Carmine Mask +1",
		neck="Bathy Choker +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Telchine Gloves",
		ring1="Gelatinous Ring +1",
		ring2="Lebeche Ring",
		--back="Moonlight Cape",
		waist=gear.ElementalObi,
		legs="Nyame Flanchard",
		feet="Medium's Sabots"
	}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
		ammo="Mavi Tathlum",
		--head="Carmine Mask +1",
		--neck="Incanter's Torque",
		--ear1="Etiolation Earring",
		--ear2="Mendi. Earring",
		--body="Vrikodara Jupon",
		hands="Telchine Gloves",
		--ring1="Janniston Ring",
		--ring2="Menelaus's Ring",
		--back=gear.ElementalCape,
		waist=gear.ElementalObi,
		legs="Carmine Cuisses +1",
		feet="Medium's Sabots"
	}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {
		--back="Tempered Cape +1",
		--waist="Luminary Sash"
	}

	sets.midcast['Blue Magic'].SkillBasedBuff = {
		main="Iris",
		sub="Iris",
		ammo="Mavi Tathlum",
		--head=gear.Relic.Head,
		neck="Mirage Stole +2",
		left_ear="Njordr Earring",
		right_ear="Hashi. Earring +1",
		body=gear.Artifact.Body,
		hands="Rawhide Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Cornflower Cape",
		legs=gear.Empyrean.Legs,
		feet=gear.Relic.Feet,
	}

	sets.midcast['Blue Magic'].Buff = {
		--main="Vampirism",
		--sub="Vampirism",
		ammo="Mavi Tathlum",
		--head=gear.Relic.Head,
		--neck="Incanter's Torque",
		ear1="Gifted Earring",
		ear2="Loquac. Earring",
		body=gear.Artifact.Body,
		hands=gear.Empyrean.Hands,
		--ring1="Kishar Ring",
		--ring2="Dark Ring",
		--back="Aurist's Cape +1",
		--waist="Witful Belt",
		--legs="Lengo Pants",
		--feet="Carmine Greaves +1"
	}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {
		head="Amalric Coif +1",
		--back="Grapevine Cape",
		waist="Gishdubar Sash"
	})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {
		head="Amalric Coif +1",
		--hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})


--IDLE SETS
	sets.idle = {
		ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body=gear.Empyrean.Body,
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Carmine Cuisses +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Bathy Choker +1",
		waist="Svelt. Gouriz +1",
        back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
        left_ear="Eabani Earring",
		right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
	}
	
	sets.idle.Evasion = {
		ammo="Staunch Tathlum",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Bathy Choker +1",
		waist="Svelt. Gouriz +1",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
		left_ring="Ilabrat Ring",
		right_ring="Vengeful Ring",
		back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
	}
	
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})
	sets.idle.Zeni = set_combine(sets.idle, {
		range="Soultrapper 2000",
		ammo="Blank Soulplate",
	})

--ENGAGED SETS
	sets.engaged = {
		ammo="Coiste Bodhar",
		head=gear.Adhemar.Head.B,
		body=gear.Adhemar.Body.A,
		hands=gear.Adhemar.Hands.A,
		legs="Samnuha Tights",
		feet=gear.Adhemar.Feet.B,
		neck="Mirage Stole +2",
		waist="Kentarch Belt +1",
		left_ear="Suppanomimi",
		right_ear="Hashi. Earring +2",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=gear.capes.TP,
	}

	sets.engaged.Evasion = {
		ammo="Staunch Tathlum",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Bathy Choker +1",
		waist="Svelt. Gouriz +1",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
		left_ring="Ilabrat Ring",
		right_ring="Defending Ring",
		back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
	}
	
	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

	sets.latent_refresh = {
		head="Rawhide Mask",
		body=gear.Empyrean.Body,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if spell.skill == 'Blue Magic' and 'Evasion' == state.CastingMode.current then
		eventArgs.handled = true
		equip(sets.idle.Evasion)
		return
	end

	if spell.skill == 'Blue Magic' and unbridled_spells:contains(spell.english) and not (buffactive['Unbridled Learning'] or buffactive['Unbridled Wisdom']) then
		if (state.AutoBuffMode.current == 'on') and (abil_recasts[81] < latency) then
			eventArgs.cancel = true
			windower.chat.input('/ja "Unbridled Learning" <me>')
			windower.chat.input:schedule(1.5,'/ma "'..spell.english..'" '..spell.target.raw..'')
			return
		else
			eventArgs.cancel = true
			add_to_chat(123,'Abort: Unbridled Learning not active.')
		end
	end
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == "WeaponSkill" then
	end
end

function job_midcast(spell,action,spellMap,eventArgs)
	if spell.skill == 'Blue Magic' and 'Evasion' == state.CastingMode.current then
		eventArgs.handled = true
		equip(sets.idle.Evasion)
		return
	end
end
function job_post_midcast( spell, action, spellMap, eventArgs)
	-- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end


function job_status_change(new_status, old_status)
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
	if user_state_change then
		user_state_change( stateField, newValue, oldValue )
	end

	if new_status == 'Engaged' then
		--determine_haste_group()
	end

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
	--determine_haste_group()
end


function customize_idle_set(idleSet)
	idleSet = set_combine( idleSet, gear.weapons[state.Weapons.current] )

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
	meleeSet = set_combine( meleeSet, gear.weapons[state.Weapons.current] )
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()
end

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
	user_self_command( cmdParams, eventArgs )
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and player.in_combat then
		local abil_recasts = windower.ffxi.get_ability_recasts()

	end

	return false
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 7)
end

function blu_spell_map()

	blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods, if only for pDif.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave',
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Sickle Slash','Smite of Rage','Thrashing Assault','Vanity Dive',
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum',
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Helldive','Jet Stream',
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite',
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tearing Gust','Tem. Upheaval','Water Bomb','Molting Plumage',
		'Nectarous Deluge','Searing Tempest','Blinding Fulgor','Spectral Floe','Scouring Spate',
		'Anvil Lightning','Silent Storm','Entomb','Tenebral Crush','Palling Salvo'
    }

    -- Magical spells with a primary Mnd mod 
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }

    -- Magical spells with an Agi stat mod
    blue_magic_maps.MagicalAgi = S{
        'Crashing Thunder'
    }

    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Bad Breath', 'Blank Gaze','Blistering Roar','Blitzstrahl','Blood Drain','Blood Saber','Cesspool','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Cruel Joke','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Frost Breath','Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Radiant Breath','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Temporal Shift','Thunderbolt','Venom Shell','Voracious Trunk',
		'Yawn', 'Atra. Libations'
    }
        
    -- Breath-based spells that we don't care about the added effect of.
    blue_magic_maps.Breath = S{
        'Flying Hip Press','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Physical stun spells and physical added effect spells.
    blue_magic_maps.Stun = S{
        'Barbed Crescent','Battle Dance','Benthic Typhoon','Bilgestorm',
		'Feather Storm','Frypan','Head Butt','Hydro Shot','Pinecone Bomb','Queasyshroom',
		'Saurian Slide','Seedspray','Spiral Spin','Sprout Smack','Sub-zero Smash',
		'Sudden Lunge','Sweeping Gouge','Tail Slap','Terror Touch','Wild Oats','Whirl of Rage',
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Exuviation','Healing Breeze','Magic Fruit','Plenilune Embrace',
		'Pollen','Restoral','White Wind','Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill that don't cap very low.
    blue_magic_maps.SkillBasedBuff = S{
        'Diamondhide','Magic Barrier','Occultation','Plasma Charge','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Barrier Tusk','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Fantod','Feather Barrier','Harden Shell','Memento Mori','Metallic Body',
		'Mighty Guard','Nat. Meditation','Orcish Counterstance','Pyric Bulwark',
		'Refueling','Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promy.',
        'Zephyr Mantle'
    }
    
    aoe_blue_magic_healing = S{
        'Healing Breeze','White Wind'
    }
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool',
        'Crashing Thunder','Cruel Joke','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar',
        'Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'
    }


end