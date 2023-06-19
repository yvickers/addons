-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Buffed' )
	state.IdleMode:options( 'Normal', 'Refresh', 'Regen' )
	state.CastingMode:options( 'Normal', 'MagicBurst', 'Recover', 'Resistant', 'Proc' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Savage Blade' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

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
	--gear.capes.Nuke = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    --gear.capes.FastCast = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}

--[[
^   Ctrl
!   Alt
@   Win
#   Apps
~	Shift
--]]
	--send_command('bind ^b gs c cycle AutoBoost')
	--send_command('bind @2 gs c cycle altstep')
	--send_command('bind @3 gs c cycle Samba')

	if select_default_macro_book then
		select_default_macro_book()
	end

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

	sets.precast.JA['Manafont'] = {
        body=gear.Relic.Body,
    }
    sets.precast.JA['Elemental Seal'] = {}
    sets.precast.JA['Mana Wall'] = {
        feet=gear.Empyrean.Feet,
    }
    sets.precast.JA['Cascade'] = {}
    sets.precast.JA['Enmity Douse'] = {}
    sets.precast.JA['Manawell'] = {}
    sets.precast.JA['Subtle Sorcery'] = {}

	sets.precast.FC = {
        back=gear.capes.FastCast,
    }
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		--head=empty,
		--body="Twilight Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		--main="Daybreak",
		--sub="Sacro Bulwark"
	})

	sets.precast.WS = {
		--ammo="Knobkierrie",
		--head="Ken. Jinpachi +1",
		--body="Ken. Samue +1",
		--hands=gear.Artifact.Hands,
		--legs="Ken. Hakama +1",
		--feet="Ken. Sune-Ate +1",
		--neck="Mnk. Nodowa +1",
		--waist="Moonbow Belt",
		--left_ear="Sherida Earring",
		--right_ear="Moonshade Earring",
		--left_ring="Epona's Ring",
		--right_ring="Rajas Ring",
		--back=gear.capes.StrDA,
	}
    sets.precast.WS.Buffed = set_combine(sets.precast.WS,{})

    sets.midcast.FastRecast = {}
    sets.midcast.Cure = {}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {})
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Enfeebling Magic'] = {}
    sets.midcast['Elemental Magic'] = {}
    sets.midcast['Elemental Magic'].Proc = {}
    sets.midcast['Elemental Magic'].MagicBurst = {}
    sets.midcast['Elemental Magic'].Recover = {}
    sets.midcast.Impact = {}
    sets.midcast['Dark Magic'] = {}

    sets.idle = {}
    sets.idle.Regen = set_combine(sets.idle,{})
    sets.idle.Refresh = set_combine(sets.idle,{})

    sets.engaged = {}
    sets.engaged.PDT = set_combine(sets.engaged,{})

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
end

function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_midcast(spell,action,spellMap,eventArgs)
    elemental_belt_check(spell)
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		--elseif data.spells.enspells:contains(spell.english) then
		--	enspell = spell.english
		--	update_melee_groups()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == enspell and not gain then
		enspell = ''
	end
	update_melee_groups()
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
end


function customize_idle_set(idleSet)
    idleSet = set_combine( idleSet, gear.weapons[state.Weapons.current] )

    if state.IdleMode.value == 'Normal' then
		if player.mpp < 51 then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.idle.Refresh)
			end
		end
   end
    
    return idleSet
end

function customize_melee_set(meleeSet)
    meleeSet = set_combine( meleeSet, gear.weapons[state.Weapons.current] )
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
end

function update_melee_groups()
	classes.CustomMeleeGroups:clear()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
	end

	return false
end