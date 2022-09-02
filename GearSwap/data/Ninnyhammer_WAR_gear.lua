function user_job_setup()
	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Mace', }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Naegling",
		sub="Blurred Shield +1",
	}
	gear.weapons['Mace'] = {
		main="Loxotic Mace +1",
		sub="Blurred Shield +1",
	}

	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', }

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = ""
	gear.Artifact.Hands = ""
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = "Agoge Mask +3"
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.capes = {}
	gear.capes.DexTP = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.capes.StrWS = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	--gear.capes.VitWS = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

end

function init_gear_sets()
	sets.TreasureHunter = {}

	sets.precast.JA['Aggressor'] = {
		--head=gear.Artifact.Head,
	}
	sets.precast.JA['Berserk'] = {
		--body=gear.Artifact.Body,
	}
	sets.precast.JA['Warcry'] = {
		head=gear.Relic.Head,
	}
	sets.precast.JA['Jump'] = {
		feet="Ostro Greaves"
	}
	sets.precast.JA['High Jump'] = {
		feet="Ostro Greaves"
	}

	sets.precast.WS = {
		--ammo="Knobkierrie",
		head=gear.Relic.Head,
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet=gear.Sulevia.Feet,
		neck="Sanctity Necklace",
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear="Ishvara Earring",
		left_ring="Rajas Ring",
		right_ring="Karieyh Ring",
		back=gear.capes.StrWS,
	}

	sets.idle = {
		--ammo="Crepuscular Pebble",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Sanctity Necklace",
		waist="Ioskeha Belt",
		left_ear="Steelflash Earring",
		right_ear="Mache Earring +1",
		left_ring="Warp Ring",
		right_ring="Karieyh Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged = {
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Sanctity Necklace",
		waist="Ioskeha Belt",
		left_ear="Steelflash Earring",
		right_ear="Mache Earring +1",
		left_ring="Rajas Ring",
		right_ring="Karieyh Ring",
		back=gear.capes.DexTP,
	}
end

function select_default_macro_book()
	set_macro_page(1, 1)
end