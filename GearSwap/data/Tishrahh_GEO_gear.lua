function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		main="Idris",
		sub="Culminus",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexa Strike', 'Black Halo', 'Exudation', 'Moonlight' }

	gear.Artifact = {}
	gear.Artifact.Head = "Geo. Galero +1"
	gear.Artifact.Body = "Geo. Tunic +1"
	gear.Artifact.Hands = "Geo. Mitaines +3"
	gear.Artifact.Legs = "Geomancy Pants +2"
	gear.Artifact.Feet = "Geo. Sandals +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Bagua Tunic +1"
	gear.Relic.Hands = ""
	gear.Relic.Legs = "Bagua Pants +3"
	gear.Relic.Feet = "Bagua Sandals +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +3"
	gear.Empyrean.Body = "Azimuth Coat +3"
	gear.Empyrean.Hands = "Azimuth Gloves +3"
	gear.Empyrean.Legs = "Azimuth Tights +3"
	gear.Empyrean.Feet = "Azimuth Gaiters +3"

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +7','Indi. eff. dur. +17','Pet: Damage taken -3%',}}

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
    	right_ring="Kishar Ring",
		back=gear.capes.GeoSkill,
	}
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})

	sets.midcast.Geomancy = {
		main="Idris",
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Empyrean.Feet,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Daybreak",
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
	sets.midcast['Elemental Magic'] = {
		sub="Ammurapi Shield",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs=gear.Empyrean.Legs,
		feet=gear.Empyrean.Feet,
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		--back="",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}
	sets.midcast['Dark Magic'] = {}
	sets.midcast.Stun = {}

	sets.midcast['Enfeebling Magic'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs={ name="Psycloth Lappas", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
		feet=gear.Relic.Feet,
		neck="Sanctity Necklace",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Vor Earring",
		right_ear="Malignance Earring",
		left_ring="Medada's Ring",
		right_ring="Stikini Ring +1",
		back=gear.capes.GeoSkill,
	}
	sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'],{
		main="Daybreak",
	})
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic']

	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Stoneskin = {
		waist="Siegel Sash",
	}
	sets.midcast.Aquaveil = {}
	sets.midcast.BarElement = {}

	sets.idle = {
		main="Idris",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Nyame Flanchard",
		feet=gear.Artifact.Feet,
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		waist="Carrier's Sash",
		back=gear.capes.PetRegen,
	}
	sets.idle.PDT = set_combine( sets.idle, {
		right_ring="Vertigo Ring",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		main="Idris",
		body="Shamash Robe",
		hands=gear.Artifact.Hands,
		legs=gear.Telchine.Legs.GEO,
		feet=gear.Relic.Feet,
		neck="Bagua Charm +2",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		right_ring="Purity Ring",
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