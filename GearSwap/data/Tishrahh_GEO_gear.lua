function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		main="Bolelabunga",
		sub="Culminus",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexa Strike', 'Black Halo', 'Exudation', 'Moonlight' }

	gear.Artifact = {}
	gear.Artifact.Head = "Geo. Galero +1"
	gear.Artifact.Body = "Geo. Tunic +1"
	gear.Artifact.Hands = "Geo. Mitaines +3"
	gear.Artifact.Legs = "Geo. Pants +1"
	gear.Artifact.Feet = "Geo. Sandals +2"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bagua Tunic +1"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Bagua Pants +1"
	gear.Relic.Feet = "Bagua Sandals +2"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +2"
	gear.Empyrean.Body = "Azimuth Coat"
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = "Azimuth Gaiters +2"

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +7','Indi. eff. dur. +17','Pet: Damage taken -3%',}}

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
		legs=gear.Relic.Legs,
	}
	sets.precast.JA['Full Circle'] = {
		head=gear.Empyrean.Head,
		hands=gear.Relic.Hands
	}

	sets.precast.FC = {
		head="Nahtirah Hat",
		hands=gear.Jhakri.Hands,
		legs=gear.Artifact.Legs,
		feet=gear.Jhakri.Feet,
		neck="Voltsurge Torque",
    	waist="Embla Sash",
		left_ear="Enchntr. Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Weather. Ring",
    	right_ring="Lebeche Ring",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Geomancy = {
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Empyrean.Feet,
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Bolelabunga",
		sub="Sors Shield",
		head=gear.Vanya.Head.B,
		body=gear.Vanya.Body.B,
		hands=gear.Vanya.Hands.B,
		feet=gear.Vanya.Feet.B,
		neck="Debilis Medallion",
		waist="Gishdubar Sash",
		left_ear="Meili Earring",
		right_ear="Mendi. Earring",
		left_ring="Lebeche Ring",
		right_ring="Haoma's Ring",
	}
	sets.midcast.Curaga = set_combine( sets.midcast.Cure, {
	})
	sets.midcast.Cursna = set_combine( sets.midcast.Cure, {
		back="Oretan. Cape +1",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
	})
	sets.midcast['Elemental Magic'] = {}
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
		head=gear.Empyrean.Head,
		body="Shamash Robe",
		hands=gear.Artifact.Hands,
		legs=gear.Artifact.Legs,
		feet=gear.Artifact.Feet,
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back=gear.capes.PetRegen,
	}
	sets.idle.PDT = set_combine( sets.idle, {
		main="Mafic Cudgel",
		right_ring="Vertigo Ring",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		legs=gear.Telchine.Legs.GEO,
		feet=gear.Relic.Feet,
		neck="Bagua Charm +2",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		right_ring="Purity Ring",
	})
	sets.idle.PDT.Pet = set_combine( sets.idle.Pet, {
		main="Mafic Cudgel",
	})

	sets.latent_refresh = {
	}

	sets.engaged = {
	    sub="Sors Shield",
		head=gear.Empyrean.Head,
	    hands=gear.Jhakri.Hands,
	    feet=gear.Jhakri.Feet,
	    --neck="Sanctity Necklace",
	    waist="Eschan Stone",
	    left_ear="Crep. Earring",
	    left_ring="Crepuscular Ring",
	    right_ring="Rajas Ring",
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 11)
end