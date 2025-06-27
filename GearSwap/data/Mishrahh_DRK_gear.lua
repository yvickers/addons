function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Calad', 'Sword', 'Mace' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Apocalypse",
		sub="Utu Grip",
	}
	gear.weapons['Calad'] = {
		main="Caladbolg",
		sub="Utu Grip",
	}

	gear.weapons['Sword'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}
	gear.weapons['Mace'] = {
		main="Loxotic Mace +1",
		sub="Blurred Shield +1",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Catastrophe', 'Torcleaver', 'Savage Blade', 'Mace' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = "Ig. Burgeonet +3"
	gear.Artifact.Body = "Ignominy Cuirass +3"
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = "Ig. Flanchard +3"
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Fall. Burgeonet +3"
	gear.Relic.Body = ""
	gear.Relic.Hands = "Fall. Fin. Gaunt. +3"
	gear.Relic.Legs = "Fall. Flanchard +3"
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = "Heath. Bur. +3"
	gear.Empyrean.Body = "Heath. Cuirass +1"
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = "Heath. Flanchard +1"
	gear.Empyrean.Feet = "Heath. Sollerets +3"

	gear.capes = {}
	gear.capes.VITWS = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	gear.capes.StrWS = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

end

function init_gear_sets()
	sets.TreasureHunter = gear.TH.Val

	sets.buff['Souleater'] = {}
	sets.buff['Nether Void'] = {}
	sets.precast['Nether Void'] = {
		legs=gear.Empyrean.Legs,
	}
	sets.buff['Dark Seal'] = {}
	sets.precast['Dark Seal'] = {
		head=gear.Relic.Head,
	}

	sets.Enmity = {
		ammo="Sapience Orb",
		body="Emet Harness +1",
		feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
	}

	sets.precast.FC = {
		ammo="Impatiens",
		head="Carmine Mask +1",
		body="Sacro Breastplate",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		feet="Carmine Greaves +1",
		neck="Baetyl Pendant",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Weather. Ring +1",
		right_ring="Medada's Ring",
	}
	sets.precast.FC['Impact'] = set_combine( sets.precast.FC, {
		head="",
		body="Crepuscular Cloak",
	})

	sets.precast.WS = {
		ammo="Knobkierrie",
        head=gear.Empyrean.Head,
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet=gear.Empyrean.Feet,
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear="Heath. Earring +1",
        left_ring="Epaminondas's Ring",
        right_ring="Niqmaddu Ring",
        back=gear.capes.StrWS,
	}

	sets.precast.WS['Cross Reaper'] = set_combine( sets.precast.WS, {
		right_ear="Moonshade Earring",
	})
	sets.precast.WS['Catastrophe'] = set_combine( sets.precast.WS, {
		ammo="Knobkierrie",
		head=gear.Empyrean.Head,
		body="Sakpata's Plate",
		legs="Sakpata's Cuisses",
		feet=gear.Empyrean.Feet,
		waist="Fotia Belt",
		left_ear="Lugra Earring +1",
		right_ring="Sroda Ring",
	})
	
	sets.precast.WS['Insurgency'] = set_combine( sets.precast.WS, {
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
	})
	sets.precast.WS['Quietus'] = set_combine( sets.precast.WS, {
		left_ear="Schere Earring",
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
	})
	sets.precast.WS['Entropy'] = set_combine( sets.precast.WS, {
		ammo="Coiste Bodhar",
		left_ear="Schere Earring",
		right_ear="Moonshade Earring",
		left_ring="Metamor. Ring +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
	})
	sets.precast.WS['Torcleaver'] = set_combine( sets.precast.WS, {
		back=gear.capes.VITWS,
	})

	sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head=gear.Artifact.Head,
		neck="Erra Pendant",
		ear1="Mani Earring",
		ear2="Dark Earring",
		body="Carm. Sc. Mail +1",
		hands=gear.Relic.Hands,
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		back="Niht Mantle",
		--waist="Casso Sash",
		legs=gear.Empyrean.Legs,
		feet="Rat. Sollerets +1"
	}

	sets.midcast['Bio'] = sets.Enmity
           
	sets.midcast['Enfeebling Magic'] = {}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {
		main="Crepuscular Scythe",
		--ammo="Egoist's Tathlum",
		head="Ratri Sallet +1",
		neck="Unmoving Collar +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
		body=gear.Empyrean.Body,
		hands="Rat. Gadlings +1",
		ring1="Moonlight Ring",
		ring2="Gelatinous Ring +1",
		back="Moonlight Cape",
		waist="Plat. Mog. Belt",
		legs="Ratri Cuisses +1",
		feet="Rat. Sollerets +1"
	})

	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
		ammo="Pemphredo Tathlum",
		head=gear.Artifact.Head,
		neck="Erra Pendant",
		--ear1="Mani Earring",
		--ear2="Dark Earring",
		body="Carm. Sc. Mail +1",
		--hands="Pavor Gauntlets",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
		--back="Chuparrosa Mantle",
		--waist="Casso Sash",
		legs=gear.Empyrean.Legs,
		feet="Rat. Sollerets +1"
	})
	sets.midcast.Absorb.Resistant = set_combine(sets.midcast['Dark Magic'], {
		main="Liberator",
		sub="Khonsu",
		range="Ullr",
	})
           
	sets.midcast.Stun = {}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Crepuscular Cloak"})

	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Carmine Cuisses +1",
        feet="Sakpata's Leggings",
        neck="Null Loop",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back="Null Shawl",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Coiste Bodhar",
		head=gear.Flamma.Head,
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs=gear.Artifact.Legs,
		feet=gear.Flamma.Feet,
		neck="Vim Torque +1",
		waist="Ioskeha Belt +1",
		left_ear="Dedition Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back="Null Shawl",

	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Hjarrandi Helm",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		right_ring="Moonlight Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 20)
end