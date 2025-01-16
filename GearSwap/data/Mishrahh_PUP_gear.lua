function user_job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', 'Pet', 'Tank' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		main="Godhands",
		ranged="Neo Animator",
		ammo="Automat. Oil +3"
	}
	gear.weapons['Pet'] = {
		main="Xiucoatl",
		ranged="Animator P +1",
		ammo="Automat. Oil +3"
	}
	gear.weapons['Tank'] = {
		main="Ohtas",
		ranged="Animator P +1",
		ammo="Automat. Oil +3"
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Shijin Spiral' }

	gear.Artifact = {}
	gear.Artifact.Head = ""
	gear.Artifact.Body = ""
	gear.Artifact.Hands = "Foire Dastanas +1"
	gear.Artifact.Legs = ""
	gear.Artifact.Feet = ""

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = "Pitre Tobe +1"
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = "Kara. Farsetto +2"
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.BothTP = { name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Accuracy+10','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.capes.MasterTP = gear.capes.BothTP
	gear.capes.MasterWS = { name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	gear.capes.MasterSTRWS = { name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}
	gear.capes.AutomatonTP = gear.capes.BothTP

end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		-- body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.precast.JA['Overdrive'] = {
		body=gear.Relic.Body,
	}
	sets.precast.JA['Tactical Switch'] = {
		--feet=gear.Empyrean.Feet,
	}
    sets.precast.JA['Repair'] = {
		ammo="Automat. Oil +3"
		--feet=gear.Artifact.Feet,
	}
	sets.precast.JA['Maintenance'] = sets.precast.JA['Repair']
	sets.precast.JA.Maneuver = {
		body=gear.Empyrean.Body,
		hands=gear.Artifact.Hands,
		right_ear="Burana Earring",
	}

	sets.precast.FC = {
		head={ name="Herculean Helm", augments={'"Fast Cast"+5','STR+1','Mag. Acc.+14',}},
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands="Malignance Gloves",
		legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
		feet="Regal Pumps +1",
		neck="Baetyl Pendant",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Medada's Ring",
		right_ring="Weather. Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}

	sets.precast.WS = {
		head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Cessance Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back=gear.capes.MasterWS,
	}
	sets.precast.WS['Victory Smite'] = set_combine( sets.precast.WS, {
		legs="Mpaca's Hose",
		back=gear.capes.MasterSTRWS,
		left_ear="Moonshade Earring",
	})

	sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Hermes' Sandals",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
        back=gear.capes.BothTP,
	}

	sets.idle.Pet = set_combine(sets.idle,{
		waist="Isa Belt",
		right_ear="Burana Earring",
	})
	
	sets.idle.Pet.Engaged = {
		head=gear.Taeon.Head.Automaton,
        body=gear.Taeon.Body.Automaton,
        hands=gear.Taeon.Hands.Automaton,
        legs=gear.Taeon.Legs.Automaton,
        feet=gear.Taeon.Feet.Automaton,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring +1",
		right_ring="Tali'ah Ring",
		back=gear.capes.AutomatonTP,
	}
	--'Overdrive', 'Ranger', 'BruiserTank', 'TurtleTank', 'HarlequinTank', 'SharpshotTank', 'BoneSlayer', 'WhiteMage', 'RedMage', 'BlackMage' }
	sets.idle.Pet.Engaged.Overdrive = set_combine( sets.idle.Pet.Engaged, {
		feet="Mpaca's Boots",
		waist="Klouskap Sash +1",
		right_ear="Rimeice Earring",
		back=gear.capes.BothTP,
	})
	sets.idle.Pet.Engaged.Ranger = set_combine( sets.idle.Pet.Engaged, {

	})
	sets.idle.Pet.Engaged.BruiserTank = set_combine( sets.idle.Pet.Engaged, {
		head="Anwig Salade",
		waist="Isa Belt",
		right_ear="Rimeice Earring",
	})
	sets.idle.Pet.Engaged.TurtleTank = sets.idle.Pet.Engaged.BruiserTank
	sets.idle.Pet.Engaged.HarlequinTank = sets.idle.Pet.Engaged.BruiserTank
	sets.idle.Pet.Engaged.SharpshotTank = sets.idle.Pet.Engaged.BruiserTank

	sets.engaged = {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's Hose",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back=gear.capes.MasterTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.Pet = set_combine(sets.engaged, {
		head=gear.Taliah.Head,
		body=gear.Taliah.Body,
		hands=gear.Taliah.Hands,
		legs=gear.Taliah.Legs,
		feet=gear.Taliah.Feet,
		back=gear.capes.BothTP,
	})
	sets.engaged.PDT.Pet = set_combine(sets.engaged.Pet, {
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 20)
end