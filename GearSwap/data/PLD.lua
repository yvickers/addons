-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	blue_magic_maps = {}

	blue_magic_maps.Enmity = S{
		'Blank Gaze', 
		'Jettatura', 
		'Soporific',
		'Poison Breath', 
		'Blitzstrahl', 
		'Sheep Song', 
		'Chaotic Eye'
	}

	state.OffenseMode:options( 'Tank', 'Melee' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
	state.IdleMode:options('Normal', 'Refresh', 'Phlx' )
	state.PhysicalDefenseMode:options('PDT', 'Cleave')
    state.MagicalDefenseMode:options('MDT')
	state.CastingMode:options('Normal', 'SIRD', 'Enmity' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', '' }
	elemental_ws = S{ "Aeolian Edge", 'Cataclysm', }

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
	--gear.capes.DexTP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	--gear.capes.StrWS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

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
	sets.TreasureHunter = {
		--ammo="Per. Lucky Egg",
		--head='Volte Cap',
		--hands=gear.Relic.Hands,
		--body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	sets.Enmity = {
		--ammo={name="Sapience orb",priority=} --2
		--head={name="Loess barbuta +1",priority=} --24
		--body={name="Souv. Cuirass +1",priority=} --20
		--hands={name="Souv. Handsch. +1",priority=} --9
		--legs={name="Souv. Diechlings +1",priority=} --9
		--feet={name="Eschite Greaves",priority=} --15
		--neck={name="Unmoving collar +1",priority=} --10
		--left_ear={name="Cryptic Earring",priority=} --4
		--right_ear={name="Odnowa Earring +1",priority=} --0
		--left_ring={name="Apeile Ring +1",priority=} --5
		--right_ring={name="Eihwaz ring",priority=} --9
		--back={ name={name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',},priority=60}, --10
		--waist={name="Creed Baudrier",priority=} --5
    } --122 +23 burtgang 145

	sets.SIRD = {
		
	}

    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{
    	--body=gear.Relic.Body,
    })
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{
		--feet=gear.Relic.Feet,
	})
	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity,{
		--hands=gear.Relic.Hands,
	})
	sets.precast.JA['Chivalry'] = set_combine(sets.Enmity,{
		--hands=gear.Relic.Hands,
	})
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{
		--legs=gear.Relic.Legs,
	})
	sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{
		--head=gear.Relic.Head,
	})
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{
		--feet=gear.Artifact.Feet,
	})
	sets.precast.JA['Majesty'] = sets.Enmity
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Last Resort'] = sets.Enmity
	sets.precast.JA['Defender'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity
	sets.precast.JA['Vallation'] = sets.Enmity
	sets.precast.JA['Pflug'] = sets.Enmity
	sets.precast.JA['Swordplay'] = sets.Enmity
	sets.precast.JA['Valiance'] = sets.Enmity

	sets.precat.FC = {}
	sets.precast.FC.DT = set_combine(sets.precast.FC, {
    })
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		--waist="Siegel sash",
    })
		
	sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {
		--waist="Siegel Sash",
	})
	sets.precast.FC['Cure IV'] = set_combine(sets.precast.FC , {
		--left_ear="Nourish. Earring +1",
	})
	sets.precast.FC.Enlight = sets.precast.FC.Phalanx
	sets.precast.FC['Enlight II'] = sets.precast.FC.Phalanx
	sets.precast.FC.Protect = sets.precast.FC.Phalanx
	sets.precast.FC.Shell = sets.precast.FC.Phalanx
	sets.precast.FC.Crusade = sets.precast.FC.Phalanx

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
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Atonement'] = set_combine(sets.enmity,	{
	})
	sets.precast.WS['Aeolian Edge'] = {
	}

	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.SpellInterrupt = {
		--ammo="Staunch Tathlum +1", --11
		--head="Souv. Schaller +1", --20
		--body="Nyame mail",
		--legs="Founder's Hose", --30
		--hands="Regal Gauntlets", --10
		--feet="Odyssean Greaves", --20
		--neck="Unmoving collar +1",
		--left_ear={name="Tuisto Earring", priority=2},
		--right_ear={name="Odnowa Earring +1", priority=3},
		--left_ring={name="Moonbeam Ring", bag="wardrobe3", priority=1},
		--right_ring={name="Moonbeam Ring", bag="wardrobe4", priority=4},
		--waist="Audumbla sash", --10
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
    } --101 +10% from merit points 112sird
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    sets.midcast.Cure = set_combine(sets.Enmity, {})
	sets.midcast.Protect = set_combine(sets.Enmity, {})
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Poisonga = set_combine(sets.Enmity, {})
	sets.midcast['Sheep Song'] = set_combine(sets.Enmity, {})
    sets.midcast['Reprisal'] = set_combine(sets.Enmity, {})

    sets.midcast.Utsusemi = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Divine Magic'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Phalanx'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Banishga'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Raise'] = set_combine(sets.midcast.SpellInterrupt,{})
    sets.midcast['Cursna'] = set_combine(sets.midcast.SpellInterrupt, {})
    sets.midcast['Geist Wall'] = set_combine(sets.midcast.SpellInterrupt,{})
	sets.midcast['Cocoon'] = set_combine(sets.midcast.SpellInterrupt,{})
	sets.midcast['Crusade'] = set_combine(sets.midcast.SpellInterrupt, {})
	sets.midcast['Haste'] = set_combine(sets.midcast.SpellInterrupt, {})
	sets.midcast['Refresh'] = set_combine(sets.midcast.SpellInterrupt, {}) 

	sets.idle = {
		--ammo="Staunch Tathlum",
		--head="Malignance Chapeau",
		--body="Malignance Tabard",
		--hands=gear.Adhemar.Hands.TP,
		--legs="Malignance Tights",
		--feet="Malignance Boots",
		--neck="Warder's Charm +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Gelatinous Ring +1",
		--back=gear.capes.DexTP,
	}
	sets.idle.Refresh = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Phlx = set_combine(sets.idle, {
	})

	sets.latent_refresh = {}

	sets.engaged = {
		--ammo="Staunch Tathlum",
		--head="Malignance Chapeau",
		--body="Malignance Tabard",
		--hands=gear.Adhemar.Hands.TP,
		--legs="Malignance Tights",
		--feet="Malignance Boots",
		--neck="Warder's Charm +1",
		--waist="Moonbow Belt",
		--left_ear="Odnowa Earring +1",
		--right_ear="Genmei Earring",
		--left_ring="Defending Ring",
		--right_ring="Gelatinous Ring +1",
		--back=gear.capes.DexTP,
	}

	sets.engaged.Melee = set_combine(sets.engaged, {
	})

	sets.AutoBuff.Doom = {
		--neck="Nicander's Necklace", --20
		--left_ring={name="Saida Ring", bag="wardrobe3"}, --20
		--right_ring={name="Purity Ring", bag="wardrobe1"}, --20
		--waist="Gishdubar Sash", --10
    }
	
	sets.AutoBuff.Sleep = {}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if spell.english == "Flash" or spell.english == "Holy II" then

		if abil_recasts[80] and abil_recasts[80] < 1 then
			cast_delay(1.1)
			send_command('input /ja "Divine Emblem" <me>')
		end
	end

	if  not buffactive['Majesty'] and ( spellMap == "Cure" or spellMap == 'Protect' ) then

		if abil_recasts[150] and abil_recasts[150] < 1 then
			cast_delay(1.1)
			send_command('input /ja "Majesty" <me>')
		end
	end

	if spell.english == "Reprisal" and buffactive['Ice Spikes'] then
		windower.send_command('cancel Ice Spikes')
	end

	refine_cure(spell, spellMap, eventArgs)
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == "WeaponSkill" then
		if elemental_ws:contains(spell.name) then
			elemental_belt_check(spell)
		end
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
	--user_announce_ailments(buff,gain)
	if buff == "terror" then
		if gain then
			equip(sets.idle.DT)
		end
	end
	if buff == "doom" then
		if gain then
			equip(sets.buff.Doom)
			send_command('@input /p Doooooooomed')
			disable('neck','legs','left_ring','right_ring','waist')
		else
			enable('neck','legs','left_ring','right_ring','waist')
			handle_equipping_gear(player.status)
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

	--equip(gear.weapons[state.Weapons.current])

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Blue Magic' then
		for category,spell_list in pairs(blue_magic_maps) do
			if spell_list:contains(spell.english) then
				return category
			end
		end
	end
end

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
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive.Reprisal and spell_recasts[97] < spell_latency then
			windower.chat.input('/ma "Reprisal" <me>')
			return true
		end

		if player.hpp < 50 then
			windower.chat.input('/ma "Cure" <me>')
			return true
		end

		if player.mpp < 50 then
			windower.chat.input('/echo SAVE TP FOR CHIVALRY')
			return true
		end
	end

	return false
end