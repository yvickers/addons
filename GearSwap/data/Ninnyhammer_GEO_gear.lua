function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons['Default'] = {
		--main="Bolelabunga",
		--sub="Sors Shield",
		range="Dunna",
		--ammo="Staunch Tathlum",
	}
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Black Halo', 'Hexa Strike', 'Exudation', }

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

	gear.capes.PetRegen = ""
	gear.capes.GeoSkill = ""
	gear.capes.DexTP = ""
	gear.capes.MNDWS = ""
	gear.capes.MAB = ""

end

function init_gear_sets()
	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {
		body=gear.Relic.Body,
	}
	sets.precast.JA['Life Cycle'] = {
		--body=gear.Artifact.Body,
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

	sets.precast.WS = {}

	sets.precast.FC = {}

	sets.midcast.Geomancy = {
		head=gear.Empyrean.Head,
		body=gear.Relic.Body,
		hands=gear.Artifact.Hands,
		legs=gear.Relic.Legs,
		--feet="Medium's Sabots",
		neck="Bagua Charm +2",
		--left_ring="Stikini Ring +1",
		--right_ring="Stikini Ring +1",
		--back=gear.capes.GeoSkill,
	}

	sets.midcast.Cure = {}
	sets.midcast.Curaga = set_combine( sets.midcast.Cure, {
	})
	sets.midcast.Cursna = set_combine( sets.midcast.Cure, {
		--left_ring="Haoma's Ring",
		--right_ring="Haoma's Ring",
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
		--main="Bolelabunga",
		--sub="Genmei Shield",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		right_ring="Warp Ring",
		back="Solemnity Cape",
	}
	sets.idle.PDT = set_combine( sets.idle, {
		--main="Mafic Cudgel",
	})
	sets.idle.Pet = set_combine( sets.idle, {})
	sets.idle.PDT.Pet = set_combine( sets.idle.Pet, {
		--main="Mafic Cudgel",
	})

	sets.latent_refresh = {
	}

	sets.engaged = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	--set_macro_page(1, 11)
end