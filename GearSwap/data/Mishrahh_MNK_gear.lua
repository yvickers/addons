function user_job_setup()

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Ranged' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Godhands",
		ammo="Crepuscular Pebble",
	}
	gear.weapons['Ranged'] = {
		main="Godhands",
		ranged="Trollbane",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Victory Smite', 'Howling Fist', 'Shijin Spiral', "Ascetic's Fury", 'Dragon Kick' }

	gear.Artifact = {}
	gear.Artifact.Head = "Temple Crown"
	gear.Artifact.Body = "Anch. Cyclas +1"
	gear.Artifact.Hands = "Anchor. Gloves +3"
	gear.Artifact.Legs = "Temple Hose"
	gear.Artifact.Feet = "Anch. Gaiters +3"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = ""
	gear.Relic.Hands = "Hes. Gloves +1"
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = "Bhikku Cyclas +2"
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = "Bhikku Hose +2"
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.DexTP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrDA = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	gear.capes.VitWS = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}

	sets.buff.Impetus = {body=gear.Empyrean.Body}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = set_combine( gear.TH.Herc, {} )

	sets.precast.JA['Boost'] = {
		hands=gear.Artifact.Hands,
	}

	sets.precast.JA['Focus'] = {
		--head=gear.Artifact.Head,
	}

	sets.precast.JA['Dodge'] = {
		body=gear.Artifact.Feet,
	}

	sets.precast.JA['Chakra'] = {
		ammo="Crepuscular Pebble",
		body=gear.Artifact.Body,
		hands=gear.Relic.Hands,
	}

	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Mnk. Nodowa +1",
		waist="Moonbow Belt",
		left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=gear.capes.StrDA,
	}

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {
		hands=gear.Adhemar.Hands.B,
	})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		right_ring="Gelatinous Ring +1",
		back=gear.capes.VitWS,
	})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {
		hands=gear.Adhemar.Hands.B,
		back=gear.capes.VitWS,
	})
	sets.precast.WS["Ascetic's Fury"]    = set_combine(sets.precast.WS, {
		head=gear.Adhemar.Head.B,
		hands=gear.Adhemar.Hands.B,
	})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {
		head=gear.Adhemar.Head.B,
		hands=gear.Adhemar.Hands.B,
		right_ear="Odr Earring",
	})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
		hands=gear.Adhemar.Hands.TP,
		back=gear.capes.DexTP,
		right_ear="Mache Earring +1",
	})

	sets.precast.WS['Cataclysm']   = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Pixie Hairpin +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Archon Ring",
	})

	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs=gear.Empyrean.Legs,
		feet="Hermes' Sandals",
		neck="Loricate Torque +1",
		waist="Moonbow Belt",
		left_ear="Odnowa Earring +1",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Warp Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged = {
		ammo="Coiste Bodhar",
		head=gear.Adhemar.Head.B,
		body="Mpaca's Doublet",
		hands=gear.Adhemar.Hands.A,
		legs=gear.Empyrean.Legs,
		feet=gear.Artifact.Feet,
		neck="Mnk. Nodowa +1",
		waist="Moonbow Belt",
		left_ear="Sherida Earring",
		--right_ear="Schere Earring",
		right_ear="Mache Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		ammo="Crepuscular Pebble",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		feet="Malignance Boots",
		--left_ring="Defending Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		feet="Malignance Boots",
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 19)
    else
        set_macro_page(1, 19)
    end
end