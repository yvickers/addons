function user_job_setup()
	state.TicksActive 			= M( true, 'TicksActive' )
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		main="Bolelabunga",
		sub="Sors Shield",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Hexa Strike', 'Exudation', }

	gear.Artifact = {}
	gear.Artifact.Head = "Geo. Galero +1"
	gear.Artifact.Body = "Geo. Tunic +1"
	gear.Artifact.Hands = "Geo. Mitaines +2"
	gear.Artifact.Legs = "Geo. Pants +1"
	gear.Artifact.Feet = "Geo. Sandals +1"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bagua Tunic +1"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = "Bagua Sandals +1"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +1"
	gear.Empyrean.Body = "Azimuth Coat +1"
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -1%',}}

end

function init_gear_sets()
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
		--legs=gear.Relic.Legs,
	}
	sets.precast.JA['Full Circle'] = {
		head=gear.Empyrean.Head,
		--hands=gear.Relic.Hands
	}

	sets.precast.FC = {
		head="Nahtirah Hat",
		hands=gear.Jhakri.Hands,
		legs=gear.Artifact.Legs,
		feet=gear.Jhakri.Feet,
		neck="Voltsurge Torque",
    	waist="Embla Sash",
		left_ear="Enchntr. Earring +1",
		right_ear="Loquac Earring",
		left_ring="Weather. Ring +1",
    	right_ring="Lebeche Ring",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Geomancy = {
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet="Medium's Sabots",
		neck="Bagua Charm +2",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		body="Agwu's Robe",
		hands="Agwu's Gages",
		legs="Agwu's Slops",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Sanctity Necklace",
		waist="Gishdubar Sash",
		--left_ear="Malignance Earring",
		--right_ear="Barkaro. Earring",
		left_ring="Prolix Ring",
		right_ring="Lebeche Ring",
		back="Solemnity Cape",
	}
	sets.midcast.Curaga = set_combine( sets.midcast.Cure, {
	})
	sets.midcast.Cursna = set_combine( sets.midcast.Cure, {
		--left_ring="Haoma's Ring",
		--right_ring="Haoma's Ring",
	})
	sets.midcast['Elemental Magic'] = {
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
	    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	    legs="Jhakri Slops +2",
	    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
	    neck="Sanctity Necklace",
	    waist={ name="Acuity Belt +1", augments={'Path: A',}},
	    left_ear="Malignance Earring",
	    right_ear="Barkaro. Earring",
	    left_ring="Freke Ring",
	    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	    --back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}
	sets.midcast['Dark Magic'] = {}
	sets.midcast.Stun = {}

	sets.midcast['Enfeebling Magic'] = {}
	sets.midcast.Dispel = {}

	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Stoneskin = {
		waist="Siegel Sash",
	}
	sets.midcast.Aquaveil = {}
	sets.midcast.BarElement = {}

	sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet=gear.Artifact.Feet,
		neck="Loricate Torque +1",
		left_ear="Odnowa Earring +1",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Solemnity Cape",
	}
	sets.idle.PDT = set_combine( sets.idle, {
		--main="Mafic Cudgel",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		head=gear.Empyrean.Head,
		body=gear.Artifact.Body,
		hands=gear.Artifact.Hands,
		legs="Psycloth Lappas",
		feet=gear.Relic.Feet,
		neck="Loricate Torque +1",
		waist="Isa Belt",
		--left_ear="Enchntr. Earring +1",
		--right_ear="Loquac Earring",
		--left_ring="Vertigo Ring",
		--right_ring="Warp Ring",
		back=gear.capes.PetRegen,
	})
	sets.idle.PDT.Pet = set_combine( sets.idle.Pet, {
		--main="Mafic Cudgel",
	})

	sets.latent_refresh = {
	}

	sets.engaged = {
		main="Maxentius",
		sub="Genmei Shield",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		--back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 11)
end