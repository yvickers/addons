-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()
	state.OffenseMode:options( 'Melee', 'PDT', 'MDT' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')
	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="Godhands",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Blade: Shun' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
	state.NINStance = M{['description'] = 'Ninja Stance',  'Yonin', 'None', 'Innin', }
	state.AutoUtsu = M( true, "Automatic Utsusemi" )
	state.AutoUtsuBuffer = M{['description'] = 'Images for recast', 0, 1, 2, }

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
	gear.Empyrean.Feet = "Hattori Kyahan +1"

	gear.capes = {}
	gear.capes.DexTP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Evasion+9',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	select_default_macro_book()

	send_command('wait 10; input /lockstyle on')

end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		head='Volte Cap',
		hands=gear.Herc.Hands.TH,
		body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	 sets.precast.FC = {
	 	ammo="Impatiens",
		--head=gear.herculean_fc_head,
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		--body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		--legs="Rawhide Trousers",
		--feet="Mochi. Kyahan +1"
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
    	--neck="Magoraga Beads",
    	--body="Passion Jacket",
    	feet=gear.Empyrean.Feet,
    } )


	sets.precast.WS = {
		ammo="Voluspa Tathlum",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands=gear.Adhemar.Hands.B,
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear="Lugra Earring +1",
		left_ring="Rajas Ring",
		right_ring="Ilabrat Ring",
		--back=gear.capes.StrDA,
	}

	sets.precast.WS['Savage Blade'] = {
		ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
		left_ring="Regal Ring",
		right_ring="Gere Ring",
		--back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Evasion+9',}},
	}

	sets.idle = {
		ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        back=gear.capes.TP,
        left_ear="Odnowa Earring +1",
        right_ear="Genmei Earring",
        left_ring="Defending Ring",
        right_ring="Warp Ring",
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		ammo="Ginsen",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands=gear.Adhemar.Hands.A,
		legs="Samnuha Tights",
		feet=gear.Hiza.Feet,
		neck="Sanctity Necklace",
		waist="Patentia Sash",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Mummu Ring",
		right_ring="Ilabrat Ring",
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        left_ring="Defending Ring",
	})

	sets.engaged.Acc = set_combine(sets.engaged, {
	})

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	--if state.AutoBuffMode.current == 'on' and spell.type == 'WeaponSkill' and player.sub_job == 'WAR' and abil_recasts[2] < latency and not buffactive.Berserk then
	--	cast_delay(1.1)
	--	send_command('@input /ja "Warcry" <me>')
	--end
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == "WeaponSkill" then
	end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	--update_melee_groups()
end


function job_status_change(new_status, old_status)
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
	if user_state_change then
		user_state_change( stateField, newValue, oldValue )
	end

	if new_status == 'Engaged' then
		--determine_haste_group()
	end

	--equip(gear.weapons[state.Weapons.current])

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
	--determine_haste_group()
end


function customize_idle_set(idleSet)
	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()
end

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
end

function job_tick()
	if check_utsusemi() then return true end
	if check_buff() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.NINStance.current == 'Yonin' and not buffactive.Yonin and abil_recasts[146] < latency then
			windower.chat.input('/ja "Yonin" <me>')
			tickdelay = os.clock() + jatickdelay
			return true
		elseif state.NINStance.current == 'Innin' and not buffactive.Innin and abil_recasts[147] < latency then
			windower.chat.input('/ja "Innin" <me>')
			tickdelay = os.clock() + jatickdelay
			return true
		end
	end

	return false
end

function check_utsusemi()
	if state.AutoBuffMode.current == 'on' and state.AutoUtsu.current == 'on' then
		if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
			return false
		elseif buffactive['Copy Image (2)'] and tonumber( state.AutoUtsuBuffer.current ) >= 2 then
			windower.chat.input('/p '.. state.AutoUtsuBuffer.current )
			windower.chat.input('//utsusemiichi')
			tickdelay = os.clock() + wstickdelay
			return true
		elseif buffactive['Copy Image'] and tonumber( state.AutoUtsuBuffer.current ) >= 1 then
			windower.chat.input('//utsusemiichi')
			tickdelay = os.clock() + wstickdelay
			return true
		elseif buffactive['Copy Image'] == nil and buffactive['Copy Image (2)'] == nil then
			windower.chat.input('//utsusemiichi')
			tickdelay = os.clock() + wstickdelay
			return true
		end
	end
	return false
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end