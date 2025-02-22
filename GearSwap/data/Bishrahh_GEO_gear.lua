function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Judgment', 'Black Halo', 'Hexa Strike', 'Exudation', }

	gear.Artifact = {}
	gear.Artifact.Head = "Geomancy Galero"
	gear.Artifact.Body = "Geomancy Tunic +3"
	gear.Artifact.Hands = "Geo. Mitaines +3"
	gear.Artifact.Legs = "Geomancy Pants +3"
	gear.Artifact.Feet = "Geo. Sandals +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bagua Tunic +3"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Bagua Pants +3"
	gear.Relic.Feet = "Bagua Sandals +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +3"
	gear.Empyrean.Body = "Azimuth Coat +3"
	gear.Empyrean.Hands = "Azimuth Gloves +3"
	gear.Empyrean.Legs = "Azimuth Tights +3"
	gear.Empyrean.Feet = "Azimuth Gaiters +3"

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20','Pet: Damage taken -1%',}}
	--gear.capes.DexTP = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Pet: "Regen"+10',}}
	--gear.capes.MNDWS = { name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.capes.MAB = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

end

function init_gear_sets()
	sets.AutoBuff.sleep = {
		main="Lorg Mor",
	}
	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {
		body=gear.Relic.Body,
	}
	sets.precast.JA['Life Cycle'] = {
		body=gear.Artifact.Body,
	}
	sets.precast.JA['Radial Arcana'] = {
		feet=gear.Relic.Feet,
	}
	sets.precast.JA['Mending Halation'] = {
		legs=gear.Relic.Legs,
	}
	sets.precast.JA['Full Circle'] = {
		head=gear.Empyrean.Head,
		--hands=gear.Relic.Hands
	}

	sets.precast.WS = {}

    sets.precast.FC = {
		main="Solstice",
		range="Dunna",
        head="Amalric Coif +1",
        body="Ros. Jaseran +1",
        --hands="Agwu's Gages",
        legs=gear.Artifact.Legs,
        --feet="Amalric Nails +1",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        --left_ear="Enchntr. Earring +1",
        right_ear="Loquac. Earring",
		left_ring="Weather. Ring",
        right_ring="Kishar Ring",
        back="Fi Follet Cape +1",
    }
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		--main="Daybreak",
	})

	sets.midcast.Geomancy = {
		main="Idris",
		sub="Genmei Shield",
		ranged="Dunna",
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Empyrean.Feet,
		neck="Bagua Charm +2",
		--left_ring="Stikini Ring +1",
		--right_ring="Stikini Ring +1",
		right_ear="Azimuth Earring +2",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Gada",
		sub="Sors Shield",
		head="Vanya Hood",
		body="Vanya Robe",
		--hands=gear.Vanya.Hands.B,
		feet="Vanya Clogs",
		left_ring="Lebeche Ring",
		right_ring="Haoma's Ring",
	}
	sets.midcast.Curaga = set_combine( sets.midcast.Cure, {
	})
	sets.midcast.Cursna = set_combine( sets.midcast.Cure, {
		left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
	})
	sets.midcast['Elemental Magic'] = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Sibyl Scarf",
		back=gear.capes.MAB,
		waist="Acuity Belt +1",
		left_ring="Jhakri Ring",
		right_ring="Metamor. Ring +1",
		left_ear="Friomisi Earring",
		right_ear="Azimuth Earring +2",
	}
	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Elemental Magic'],{
		waist="Fucho-no-Obi",
	})
	sets.midcast.Stun = {}

	sets.midcast['Banish'] = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Null Loop",
		back=gear.capes.MAB,
		waist="Acuity Belt +1",
		left_ring="Weather. Ring",
		right_ring="Metamor. Ring +1",
		left_ear="Friomisi Earring",
		right_ear="Azimuth Earring +2",
	}
	sets.midcast['Banish II'] = sets.midcast['Banish']

	sets.midcast['Enfeebling Magic'] = {
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		--legs={ name="Psycloth Lappas", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
		legs=gear.Empyrean.Legs,
		feet=gear.Relic.Feet,
		neck="Null Loop",
		back="Aurist's Cape +1",
		waist="Eschan Stone",
		left_ring="Weather. Ring",
		right_ring="Metamor. Ring +1",
		--left_ear="Friomisi Earring",
		right_ear="Azimuth Earring +2",
	}
	sets.midcast.Dispel = {}

	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		legs="Shedir Seraweels",
		waist="Embla Sash",
	}
	sets.midcast.Stoneskin = set_combine( sets.midcast['Enhancing Magic'],{
		waist="Siegel Sash",
	})
	sets.midcast.Aquaveil = set_combine( sets.midcast['Enhancing Magic'],{
		main="Vadose Rod",
		head="Amalric Coif +1",
	})
	sets.midcast.BarElement = set_combine( sets.midcast['Enhancing Magic'], {
	})

	sets.idle = {
		main="Idris",
		sub="Genmei Shield",
		ranged="Dunna",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Artifact.Feet,
		neck="Null Loop",
		left_ear="Eabani Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Solemnity Cape",
		waist="Carrier's Sash",
	}
	sets.idle.PDT = set_combine( sets.idle, {
		--main="Mafic Cudgel",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		head=gear.Empyrean.Head,
		body="Shamash Robe",
		hands=gear.Artifact.Hands,
		legs=gear.Telchine.Legs.PetRegen,
		feet=gear.Relic.Feet,
		neck="Bagua Charm +2",
		waist="Isa Belt",
		back=gear.capes.PetRegen,
	})
	sets.idle.PDT.Pet = set_combine( sets.idle.Pet, {
		--main="Mafic Cudgel",
	})

	sets.latent_refresh = {
	}

	sets.engaged = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end