-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'PDT', 'Melee', 'MDT', 'ACC', 'SB' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')
	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default', }
	gear.weapons = {}
	gear.weapons['Default'] = {
		--main="Naegling",
		--sub="Blurred Shield +1",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', }

	state.RetaliationStance = M( false, "Retaliation Stance" )

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

	gear.capes = {}
	gear.capes.DexTP = {}--{ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.StrWS = {}--{ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.VitWS = {}--{ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	send_command('wait 10; input /lockstyle on')

	if user_job_setup then
        user_job_setup()
    end
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	send_command('unbind ^g')
	send_command('unbind !g')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {}

	sets.buff['Mighty Strikes'] = {}
	sets.buff['Retaliation'] = {}

	sets.precast.JA['Aggressor'] = {
		head=gear.Artifact.Head,
	}
	sets.precast.JA['Berserk'] = {
		body=gear.Artifact.Body,
	}
	sets.precast.JA['Warcry'] = {
		head=gear.Relic.Head,
	}

	sets.precast.WS = {
		--ammo="Knobkierrie",
		--head=gear.Relic.Head,
		--body=gear.Artifact.Body,
		--hands="Sakpata's Gauntlets",
		--legs="Sakpata's Cuisses",
		--feet=gear.Sulevia.Feet,
		--neck="War. Beads +1",
		--waist="Sailfi Belt +1",
		--left_ear="Thrud Earring",
		--right_ear="Moonshade Earring",
		--left_ring="Regal Ring",
		--right_ring="Niqmaddu Ring",
		--back=gear.capes.StrWS,
	}

	sets.precast.GAXEWS = set_combine(sets.precast.WS, {
	})
	sets.precast.WS["Shield Break"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Iron Tempest"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Sturmwind"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Keen Edge"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Raging Rush"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Steel Cyclone"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Upheaval"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Metatron Torment"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["King's Justice"] = set_combine(sets.precast.GAXEWS, {
	})

	sets.precast.WS["Armor Break"] = set_combine(sets.precast.GAXEWS, {
	})
	sets.precast.WS["Weapon Break"] = set_combine(sets.precast.WS["Armor Break"], {
	})
	sets.precast.WS["Full Break"] = set_combine(sets.precast.WS["Armor Break"], {
	})

	sets.idle = {
		--ammo="Crepuscular Pebble",
		--head="Sakpata's Helm",
		--body="Sakpata's Plate",
		--hands="Sakpata's Gauntlets",
		--legs="Sakpata's Cuisses",
		--feet="Hermes' Sandals",
		--neck="Warder's Charm +1",
		--waist="Flume Belt +1",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Warp Ring",
		--back=gear.capes.DexTP,
	}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {
		--ammo="Coiste Bodhar",
		--head="Hjarrandi Helm",
		--body="Hjarrandi Breast.",
		--hands=gear.Sulevia.Hands,
		--legs=gear.Artifact.Legs,
		--feet=gear.Artifact.Feet,
		--neck="War. Beads +1",
		--waist="Ioskeha Belt +1",
		--left_ear="Cessance Earring",
		--right_ear="Telos Earring",
		--left_ring="Petrov Ring",
		--right_ring="Niqmaddu Ring",
		--back=gear.capes.DexTP,
	}

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
	})

	sets.engaged.ACC = set_combine(sets.engaged, {
	})

	sets.engaged.SB = set_combine(sets.engaged, {
	})
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if state.AutoBuffMode.current == 'on' and spell.type == 'WeaponSkill' and not buffactive['Blood Rage'] then
		if abil_recasts[2] < latency then
			cast_delay(1.1)
			send_command('@input /ja "Warcry" <me>')
		end
	end
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
	if sets.buff[buff] then
        if gain then
            equip(sets.buff[buff])
        else
            send_command('gs c update auto')
        end     
    end
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
	if buffactive['Mighty Strikes'] then
		meleeSet = set_combine( meleeSet, sets.buff['Mighty Strikes'] )
	end
	if buffactive['Retaliation'] then
		meleeSet = set_combine( meleeSet, sets.buff['Retaliation'] )
	end
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
	-- Check that ranged slot is locked, if necessary
	check_range_lock()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
	user_self_command( cmdParams, eventArgs )
end

function job_tick()
	if check_buff() then return true end
	if check_stance() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive.Restraint and abil_recasts[9] < latency then
			windower.chat.input('/ja "Restraint" <me>')
			return true		
		elseif not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			return true
		elseif not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			return true
		elseif not buffactive['Blood Rage'] and abil_recasts[11] < latency then
			windower.chat.input('/ja "Blood Rage" <me>')
			return true
		end
	end
	return false
end

function check_stance()
	if state.RetaliationStance.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not buffactive.Retaliation and abil_recasts[8] < latency then
			windower.chat.input('/ja "Retaliation" <me>')
			return true
		end
	end
end