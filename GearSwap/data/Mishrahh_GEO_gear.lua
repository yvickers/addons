function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		main="Idris",
		sub="Sors Shield",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Hexa Strike', 'Exudation', }

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
	gear.Relic.Legs = "Bagua Pants +3"
	gear.Relic.Feet = "Bagua Sandals +3"

	gear.Empyrean = {}
	gear.Empyrean.Head = "Azimuth Hood +3"
	gear.Empyrean.Body = "Azimuth Coat +2"
	gear.Empyrean.Hands = "Azimuth Gloves +3"
	gear.Empyrean.Legs = "Azimuth Tights +1"
	gear.Empyrean.Feet = "Azimuth Gaiters +2"

	gear.capes.PetRegen = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.capes.GeoSkill = { name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -1%',}}
	gear.capes.DexTP = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Pet: "Regen"+10',}}
	gear.capes.MNDWS = { name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.capes.MAB = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

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

	sets.precast.WS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Prosilio Belt +1",
		left_ear="Malignance Earring",
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back=gear.capes.MNDWS,
	}

	sets.precast.FC = {
		head="Merlinic Hood",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		legs=gear.Artifact.Legs,
		feet="Amalric Nails +1",
		neck="Voltsurge Torque",
    	waist="Embla Sash",
		left_ear="Enchntr. Earring +1",
		right_ear="Loquac Earring",
		left_ring="Weather. Ring +1",
    	right_ring="Medada's Ring",
		back=gear.capes.GeoSkill,
	}
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
	})

	sets.midcast.Geomancy = {
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		feet=gear.Empyrean.Feet,
		neck="Bagua Charm +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		hands="Vanya Cuffs",
		legs="Vanya Slops",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Yngvi Choker",
		waist="Gishdubar Sash",
		--left_ear="Malignance Earring",
		--right_ear="Barkaro. Earring",
		left_ring="Weather. Ring +1",
		right_ring="Lebeche Ring",
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
	    back=gear.capes.MAB,
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
		main="Idris",
		sub="Genmei Shield",
		head=gear.Empyrean.Head,
		body=gear.Empyrean.Body,
		hands=gear.Empyrean.Hands,
		legs="Nyame Flanchard",
		feet=gear.Artifact.Feet,
		neck="Loricate Torque +1",
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Solemnity Cape",
		waist="Carrier's Sash",
	}
	sets.idle.PDT = set_combine( sets.idle, {
		--main="Mafic Cudgel",
	})
	sets.idle.Pet = set_combine( sets.idle, {
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		legs="Psycloth Lappas",
		feet=gear.Relic.Feet,
		neck="Bagua Charm +1",
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
		back=gear.capes.DexTP,
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end