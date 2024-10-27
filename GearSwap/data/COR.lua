-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'PDT', 'Melee', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Buffed' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Regen' )

	include('Mote-TreasureHunter')

	state.Weapons = M{['description'] = 'Weapon Setup', 'Default' }
	gear.weapons = {}
	gear.weapons['Default'] = {
		---main="",
		--sub="",
		--ammo="Staunch Tathlum",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', '' }

	state.AutoBuffMode = M( true, "Automatic Buffs" )

	state.Bullet = M{['description']='Bullet', 'Bronze Bullet'}
	state.QDBullet = M{['description']='Quick Draw Bullet', 'Bronze Bullet'}
	-- Whether to use Luzaf's Ring
    state.LuzafRing = M(true, "Luzaf's Ring")
    -- Whether to use Compensator under a certain threshhold even when weapons are locked.
    state.CompensatorMode = M{['description'] = 'Compensator Mode', 'Never','300','1000','Always'}
	define_roll_values()
	elemental_ws = S{"Aeolian Edge", "Leaden Salute", "Wildfire", "Sanguine Blade"}

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
	send_command('bind %numpad0 input /ra <t>')

	if select_default_macro_book then
		select_default_macro_book()
	end

	send_command('wait 10; input /lockstyle on')

	if user_job_setup then
        user_job_setup()
    end

    flurry = nil
end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
	--send_command('unbind ^b')
	--send_command('unbind @2')
	--send_command('unbind @3')
	 send_command('unbind numpad0')
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

	sets.precast.FC = {}
	sets.precast.FC.Utsusemi = {}

	sets.precast.JA['Triple Shot'] = {
		--body="Navarch's Frac +2"
	}
    sets.precast.JA['Snake Eye'] = {
    	--legs=gear.Relic.Legs
    }
    sets.precast.JA['Wild Card'] = {
    	--feet=gear.Relic.Feet
    }
    sets.precast.JA['Random Deal'] = {
    	--body=gear.Relic.Body
    }

    
    sets.precast.CorsairRoll = {
        --head=gear.Relic.Head,
        --hands=gear.Empyrean.Hands,
        --legs="Desultor Tassets",
        --ring1="Barataria Ring",
        --back=gear.capes.PhantomRoll,
    }
    
    --sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    --sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
    --sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})
    --sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +2"})
    --sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Navarch's Gants +2"})
    
    sets.precast.LuzafRing = set_combine( sets.precast.CorsairRoll, {
    	--ring2="Luzaf's Ring"
    })
    sets.precast.FoldDoubleBust = {
    	--hands=gear.Relic.Hands
    }
    sets.precast.Compensator = {
    	--ranged="Compensator"
    } 

	sets.precast.RA = {}
	sets.precast.RA.Flurry1 = {}
	sets.precast.RA.Flurry2 = {}

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
	sets.FullTP = {};

	-- Midcast Sets
    sets.midcast.FastRecast = sets.precast.FC
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

	-- Ranged gear
    sets.midcast.RA = {
        --head="Malignance Chapeau",
        --body="Malignance Tabard",
        --hands="Malignance Gloves",
        --legs=gear.Adhemar.Legs.C,
        --feet="Malignance Boots",
        --neck="Iskur Gorget",
        --ear1="Telos Earring",
        --ear2="Crep. Earring",
        --ring1="Crepuscular Ring",
        --ring2="Dingir Ring",
        --back=gear.capes.RngLeadenCape,
        --waist="Yemaya Belt",
    }

    sets.midcast.RA.Acc = set_combine( sets.midcast.RA, {
    })
    sets.TripleShot = {}
    sets.TripleShotCritical = {}
    sets.TrueShot = {}
    sets.midcast.RA.Critical = {}

    sets.midcast.CorsairShot = {
        ----head="Blood Mask",
        --body=gear.Relic.Body,
        --hands="Carmine Fin. Ga. +1",
        --legs=gear.Herc.Legs.WSD,
        --feet=gear.Relic.Feet,
        --neck="Stoicheion Medal",
        --ear1="Friomisi Earring",
        --ear2="Hecate's Earring",
        --ring1="Dingir Ring",
        ----ring2="Demon's Ring",
        --back=gear.capes.RngLeadenCape,
        --waist="Eschan Stone"
    }

    sets.midcast.CorsairShot.Acc = set_combine( sets.midcast.CorsairShot, {
    })

    sets.midcast.CorsairShot['Light Shot'] = set_combine( sets.midcast.CorsairShot,{
    })

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']

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
	sets.idle.PDT = set_combine(sets.idle, {
	})
	sets.idle.MDT = set_combine(sets.idle, {
	})
	sets.idle.Regen = set_combine(sets.idle, {
	})

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

	sets.engaged.PDT = set_combine(sets.engaged, {
	})

	sets.engaged.MDT = set_combine(sets.engaged, {
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

    if spell.action_type == 'Ranged Attack' then
        if special_ammo_check() then
        	equip({ammo=state.Bullet.current})
        end
    end

	if spell.type == 'WeaponSkill'  then
		if spell.skill == 'Marksmanship' then
			if special_ammo_check() then
				equip({ammo=state.Bullet.current})
			end
		end
	end

    -- gear sets
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") then
        if state.LuzafRing.value then
            equip(sets.precast.LuzafRing)
        end
        if state.CompensatorMode.value ~= 'Never' and (state.CompensatorMode.value == 'Always' or tonumber(state.CompensatorMode.value) > player.tp) then
            equip(sets.precast.Compensator)
        end
    elseif spell.type == 'CorsairShot' then
        equip({ammo=state.QDBullet.current})
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
        if sets.precast.FoldDoubleBust then
            equip(sets.precast.FoldDoubleBust)
            eventArgs.handled = true
        end
    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill'  then
		if player.tp > 2900 then
			equip(sets.FullTP)
		end
		if elemental_ws:contains(spell.name) then
			elemental_belt_check(spell)
		end
	end
	if spell.action_type == 'Ranged Attack' then
		if flurry == 2 then
            equip(sets.precast.RA.Flurry2)
        elseif flurry == 1 then
            equip(sets.precast.RA.Flurry1)
        end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.type == 'CorsairShot' then
        if (spell.english ~= 'Light Shot' and spell.english ~= 'Dark Shot') then
            elemental_belt_check(spell)
            --if state.QDMode.value == 'Enhance' then
                --equip(sets.midcast.CorsairShot.Enhance)
            --elseif state.QDMode.value == 'TH' then
                --equip(sets.midcast.CorsairShot)
                --equip(sets.TreasureHunter)
            --elseif state.QDMode.value == 'STP' then
                --equip(sets.midcast.CorsairShot.STP)
            --end
        end
    end

	if spell.action_type == 'Ranged Attack' then
        if buffactive['Triple Shot'] then
            equip(sets.TripleShot)
            if buffactive['Aftermath: Lv.3'] and player.equipment.ranged == "Armageddon" then
                equip(sets.TripleShotCritical)
                if (spell.target.distance < (7 + spell.target.model_size)) and (spell.target.distance > (5 + spell.target.model_size)) then
                    equip(sets.TrueShot)
                end
            end
        elseif buffactive['Aftermath: Lv.3'] and player.equipment.ranged == "Armageddon" then
            equip(sets.midcast.RA.Critical)
            if (spell.target.distance < (7 + spell.target.model_size)) and (spell.target.distance > (5 + spell.target.model_size)) then
                equip(sets.TrueShot)
            end
        end
    end
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
    
    if spell.type == 'CorsairShot' then
        local card_count = 0
        equip({ammo=state.Bullet.current})
        if player['inventory']['Trump Card'] then
			card_count = player['inventory']['Trump Card'].count
		end

        if card_count < 15 then
            if player['inventory']['Trump Card Case'] then
                local case_count = player['inventory']['Trump Card Case'].count
                local case_tries = 0
                repeat
                    windower.chat.input('/item "Trump Card Case" <me>')
                    case_tries = case_tries + 1
                    coroutine.sleep(5)
                until case_tries > 4 or player['inventory']['Trump Card Case'].count < case_count
            end
        end
    end

	if spell.type == 'CorsairRoll' and not spell.interrupted then

        if state.CompensatorMode.value ~= 'Never' then
            if ((player.equipment.range and player.equipment.range == 'Compensator') or (player.equipment.ranged and player.equipment.ranged == 'Compensator')) and gear.weapons[state.Weapons.current] and gear.weapons[state.Weapons.current].ranged and gear.weapons[state.Weapons.current].ranged ~= 'Compensator' then
                equip(gear.weapons[state.Weapons.current])
            end
        end

        display_roll_info(spell)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	--update_melee_groups()
	if S{'flurry'}:contains(buff:lower()) then
        if not gain then
            flurry = nil
            --add_to_chat(122, "Flurry status cleared.")
        end
        if not midaction() then
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

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
	--determine_haste_group()
end


function customize_idle_set(idleSet)
    idleSet = set_combine( idleSet, gear.weapons[state.Weapons.current] )
	return idleSet
end

function customize_melee_set(meleeSet)
    meleeSet = set_combine( meleeSet, gear.weapons[state.Weapons.current] )
	return meleeSet
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    --check_range_lock()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    user_self_command( cmdParams, eventArgs )
end

function define_roll_values()
     rolls = T{
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate", id=98,buff=310},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow", id=99,buff=311},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received", id=100,buff=312},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack", id=101,buff=313},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy", id=102,buff=314},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate", id=103,buff=315},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense", id=104,buff=316},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack", id=105,buff=317},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack", id=106,buff=318},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate", id=107,buff=319},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy", id=108,buff=320},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP", id=109,buff=321},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion", id=110,buff=322},
        ["Drachen Roll"]     = {lucky=4, unlucky=8, bonus="Pet Accuracy", id=111,buff=323},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh", id=112,buff=324},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense", id=113,buff=325},
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points", id=114,buff=326},
        ["Puppet Roll"]      = {lucky=3, unlucky=7, bonus="Pet Magic Accuracy/Attack", id=115,buff=327},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen", id=116,buff=328},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP", id=117,buff=329},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed", id=118,buff=330},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast", id=119,buff=331},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot", id=120,buff=332},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay", id=121,buff=333},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain", id=122,buff=334},
        ["Allies' Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage", id=302,buff=335},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP", id=303,buff=336},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen", id=304,buff=337},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate", id=305,buff=338},
        ["Naturalist's Roll"]   = {lucky=3, unlucky=7, bonus="Enhancing Duration", id=390,buff=339},
        ["Runeist's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Evasion", id=391,buff=600},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end

function job_tick()
	if check_buff() then return true end
	return false
end

function check_buff()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
	end

	return false
end

--Read incoming packet to differentiate between Haste/Flurry I and II
windower.register_event('action',
    function(act)
        --check if you are a target of spell
        local actionTargets = act.targets
        playerId = windower.ffxi.get_player().id
        isTarget = false
        for _, target in ipairs(actionTargets) do
            if playerId == target.id then
                isTarget = true
            end
        end
        if isTarget == true then
            if act.category == 4 then
                local param = act.param
                if param == 845 and flurry ~= 2 then
                    --add_to_chat(122, 'Flurry Status: Flurry I')
                    flurry = 1
                elseif param == 846 then
                    --add_to_chat(122, 'Flurry Status: Flurry II')
                    flurry = 2
              end
            end
        end
    end)
