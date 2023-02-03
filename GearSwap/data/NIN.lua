-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
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
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade', 'Blade: Ku' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )
	state.NINStance = M{['description'] = 'Ninja Stance',  'Yonin', 'None', 'Innin', }
	state.AutoUtsu = M( false, "Automatic Utsusemi" )
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
	gear.Empyrean.Feet = ""

	gear.capes = {}
	gear.capes.DexTP = ""--{ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	gear.capes.StrWSD = ""--{ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+4','Weapon skill damage +10%',}},
    gear.capes.MagicWSD = ""
    gear.capes.FC = ""
    gear.capes.Ninjutsu = ""

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

    if user_job_setup then
        user_job_setup()
    end
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
end

function init_gear_sets()
	sets.TreasureHunter = {}

	 sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
    	--neck="Magoraga Beads",
    	--body="Passion Jacket",
    	--feet=gear.Empyrean.Feet,
    } )


	sets.precast.WS = {}

    sets.midcast.SpellInterrupt = {
        --ammo="Staunch Tathlum +1", --11
        --body=gear.Taeon_Phalanx_body, --10
        --hands="Rawhide Gloves", --15
        --legs=gear.Taeon_Phalanx_legs, --10
        --feet=gear.Taeon_Phalanx_feet, --10
        --neck="Moonlight Necklace", --15
        --ear1="Halasz Earring", --5
        --ear2="Magnetic Earring", --8
        --ring1="Evanescence Ring", --5
        --back=gear.NIN_FC_Cape, --10
        --waist="Audumbla Sash", --10
    }
    sets.midcast.Utsusemi = set_combine(sets.midcast.SpellInterrupt, {
        --feet=gear.Empyrean.Feet,
    })
    sets.midcast.EnhancingNinjutsu = {}
    sets.midcast.EnfeeblingNinjutsu = {}
    sets.midcast.ElementalNinjutsu = {}

	sets.idle = {}
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

	sets.engaged = {}

	sets.engaged.PDT = set_combine(sets.engaged, {})

	sets.engaged.MDT = set_combine(sets.engaged, {})

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

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
	if type(commandArgs) == 'string' then
		commandArgs = T(commandArgs:split(' '))
		if #commandArgs == 0 then
			return
		end
	end

	if commandArgs[1]:lower() == 'nuke' then
		windower.chat.input:('/ma ' .. data.elements.ninjutsu_nuke_of[state.ElementalMode.value] .. ':San <t>')
		eventArgs.handled = true
	end
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