function user_job_setup()
    state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Refresh', }
	gear.weapons = {}
	gear.weapons['Default'] = {
        main="Malignance Pole",
        sub="Khonsu",
    }
    gear.weapons['Refresh'] = {
        main="Mpaca's Staff",
        sub="Khonsu",
    }
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Cataclysm' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = "Spaekona's Coat +3"
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
	gear.Empyrean.Head = "Wicce Petasos +1"
	gear.Empyrean.Body = "Wicce Coat +3"
	gear.Empyrean.Hands = "Wicce Gloves +1"
	gear.Empyrean.Legs = "Wicce Chausses +3"
	gear.Empyrean.Feet = "Wicce Sabots +3"

	gear.capes = {}
	gear.capes.Nuke = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    gear.capes.FastCast = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
end

function init_gear_sets()
    sets.TreasureHunter = {}

	sets.precast.JA['Manafont'] = {
        body=gear.Relic.Body,
    }
    sets.precast.JA['Elemental Seal'] = {}
    sets.precast.JA['Mana Wall'] = {
        feet=gear.Empyrean.Feet,
    }
    sets.AutoBuff['Mana Wall'] = {
        feet=gear.Empyrean.Feet,
    }
    sets.precast.JA['Cascade'] = {}
    sets.precast.JA['Enmity Douse'] = {}
    sets.precast.JA['Manawell'] = {}
    sets.precast.JA['Subtle Sorcery'] = {}

	sets.precast.FC = {
        main="Mpaca's Staff",
        sub="Enki Strap",
        ammo="Impatiens",
        head="Merlinic Hood",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Amalric Nails +1",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Barkaro. Earring",
        right_ear="Malignance Earring",
        left_ring="Medada's Ring",
        right_ring="Weather. Ring +1",
        back=gear.capes.FastCast,    
    }
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		--head=empty,
		--body="Twilight Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Ammurapi Shield"
	})

	sets.precast.WS = {}
    sets.precast.WS.Buffed = set_combine(sets.precast.WS,{})

    sets.midcast.FastRecast = {}
    sets.midcast.Cure = {}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {})
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Enfeebling Magic'] = {
        main="Marin Staff +1",
        sub="Khonsu",
        ammo="Ghastly Tathlum +1",
        body="Cohort Cloak +1",
        hands="Agwu's Gages",
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Src. Stole +2",
        waist="Acuity Belt +1",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Metamor. Ring +1",
        back="Aurist's Cape +1",
    }
    sets.midcast['Elemental Magic'] = {
        main="Marin Staff +1",
        sub="Enki Strap",
        ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body=gear.Empyrean.Body,
        hands=gear.Empyrean.Hands,
        legs=gear.Empyrean.Legs,
        feet=gear.Empyrean.Feet,
        neck="Src. Stole +2",
        waist="Acuity Belt +1",
        left_ear="Barkaro. Earring",
        right_ear="Malignance Earring",
        left_ring="Medada's Ring",
        right_ring="Metamor. Ring +1",
        back=gear.capes.Nuke,
    }
    sets.midcast['Elemental Magic'].Proc = {}
    sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Ghastly Tathlum +1",
        head="Ea Hat +1",
        hands="Amalric Gages +1",
    })
    sets.midcast['Elemental Magic'].Recover = set_combine(sets.midcast['Elemental Magic'].MagicBurst, {
        body=gear.Artifact.Body,
    })
    sets.midcast.Impact = {}
    sets.midcast['Dark Magic'] = {
        main="Rubicundity",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        body=gear.Empyrean.Body,
        hands="Amalric Gages +1",
        legs=gear.Empyrean.Legs,
        feet="Agwu's Pigaches",
        neck="Erra Pendant",
        waist="Acuity Belt +1",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Evanescence Ring",
        right_ring="Archon Ring",
        back="Aurist's Cape +1",
    }

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Agwu's Robe",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Yngvi Choker",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Eabani Earring",
        left_ring="Archon Ring",
        right_ring="Shadow Ring",
        back=gear.capes.Nuke,
    }
    sets.idle.Regen = set_combine(sets.idle,{})
    sets.idle.Refresh = set_combine(sets.idle,{
        body=gear.Empyrean.Body,
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
    })

    sets.engaged = {}
    sets.engaged.PDT = set_combine(sets.engaged,{})

end