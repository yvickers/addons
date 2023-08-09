-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

function job_setup()

	state.OffenseMode:options( 'Melee', 'PDT', 'MDT', 'Acc' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc' )
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
    state.AutoFightMode = M( true, "Auto Pet Fight" )

	avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith", "Siren"}
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
	spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
        ['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}

    magicalRagePacts = S{
		'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Clarsach Call','Impact',
		'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
		'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
		'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
		'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
		'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Tornado II','Sonic Buffet'}


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
		-- body=gear.Herc.Body.TH,
		--waist="Chaac Belt",
		--legs=gear.Herc.Legs.TH,
		--feet=gear.Empyrean.Feet
	}

	-- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {
		--head=gear.Relic.Head
	}
    
    sets.precast.JA['Elemental Siphon'] = {
		--main="Espiritus",
		--sub="Vox Grip",
		--ammo="Esper Stone +1",
        --head="Telchine Cap",
		--neck="Incanter's Torque",
		--left_ear="Andoaa Earring",
		--right_ear="Lodurr Earring",
        --body="Telchine Chasuble",
		--hands="Baayami Cuffs",
		--left_ring="Evoker's Ring",
		--right_ring="Stikini Ring +1",
        --back="Conveyance Cape",
		--waist="Kobo Obi",
		--legs="Telchine Braconi",
		--feet="Beck. Pigaches +1"
	}

    sets.precast.JA['Mana Cede'] = {
		--hands="Beck. Bracers +1"
	}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		--main="Espiritus",
		--sub="Vox Grip",
		--ammo="Sancus Sachet +1",
		--head="Beckoner's Horn +1",
		--neck="Incanter's Torque",
		--left_ear="Andoaa Earring",
		--right_ear="Lodurr Earring",
        --body="Baayami Robe",
		--hands="Baayami Cuffs",
		--left_ring="Evoker's Ring",
		--right_ring="Stikini Ring +1",
        --back="Conveyance Cape",
		--waist="Kobo Obi",
		--legs="Baayami Slops",
		--feet="Baayami Sabots"
	}
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

	sets.precast.FC = {}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

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

	sets.midcast.Cure = {}
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})

	sets.midcast['Summoning Magic'] = {
		--main="Malignance Pole",
		--sub="Umbra Strap",
		--ammo="Sancus Sachet +1",
		--head="Convoker's Horn +3",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Lodurr Earring",
        --body="Baayami Robe",
		--hands="Baayami Cuffs",
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
        --back=gear.magic_jse_back,
		--waist="Emphatikos Rope",
		--legs="Assid. Pants +1",
		--feet="Baayami Sabots"
	}

	sets.midcast['Enhancing Magic'] = {
		--main=gear.gada_enhancing_club,
		--sub="Ammurapi Shield",
		--ammo="Hasty Pinion +1",
		--head="Telchine Cap",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Gifted Earring",
		--body="Telchine Chas.",
		--hands="Telchine Gloves",
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
		--back="Perimede Cape",
		--waist="Embla Sash",
		--legs="Telchine Braconi",
		--feet="Telchine Pigaches"
	}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		--head="Amalric Coif +1"
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		--main="Vadose Rod",
		--sub="Genmei Shield",
		--head="Amalric Coif +1",
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",
		--legs="Shedir Seraweels"
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		--neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		--waist="Siegel Sash",
		--legs="Shedir Seraweels"
	})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		--legs="Shedir Seraweels"
	})

	-- Avatar pact sets.  All pacts are Ability type.
    sets.midcast.Pet.BloodPactWard = {
		--main="Espiritus",
		--sub="Vox Grip",
		--ammo="Sancus Sachet +1",
        --head="Convoker's Horn +3",
		--neck="Incanter's Torque",
		--ear1="Andoaa Earring",
		--ear2="Lodurr Earring",
        --body="Baayami Robe",
		--hands="Baayami Cuffs",
		--ring1="Evoker's Ring",
		--ring2="Stikini Ring +1",
        --back="Conveyance Cape",
		--waist="Kobo Obi",
		--legs="Baayami Slops",
		--feet="Baayami Sabots"
	}

    sets.midcast.Pet.DebuffBloodPactWard = {
		--main="Espiritus",
		--sub="Vox Grip",
		--ammo="Sancus Sachet +1",
        --head="C. Palug Crown",
		--neck="Adad Amulet",
		--ear1="Lugalbanda Earring",
		--ear2="Enmerkar Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring1="Evoker's Ring",
		--ring2="C. Palug Ring",
        --back=gear.magic_jse_back,
		--waist="Incarnation Sash",
		--legs="Tali'ah Sera. +2",
		--feet="Convo. Pigaches +3"
	}
            
    sets.midcast.Pet.PhysicalBloodPactRage = {
		--main="Gridarvor",
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Helios Band",
		--neck="Shulmanu Collar",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_physpact_hands,
		--ring1="Varar Ring +1",
		--ring2="C. Palug Ring",
        --back=gear.phys_jse_back,
		--waist="Incarnation Sash",
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
	}

    sets.midcast.Pet.MagicalBloodPactRage = {
		--main=gear.grioavolr_pet_staff,
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		--neck="Adad Amulet",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring1="Varar Ring +1",
		--ring2="Varar Ring +1",
        --back=gear.magic_jse_back,
		--waist="Regal Belt",
		--legs="Enticer's Pants",
		--feet="Apogee Pumps +1"
	}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
    
	sets.midcast.Pet['Flaming Crush'] = {
		--main=gear.grioavolr_pet_staff,
		--sub="Elan Strap +1",
		--ammo="Sancus Sachet +1",
        --head="Apogee Crown +1",
		--neck="Adad Amulet",
		--ear1="Lugalbanda Earring",
		--ear2="Gelos Earring",
        --body="Con. Doublet +3",
		--hands=gear.merlinic_magpact_hands,
		--ring1="Varar Ring +1",
		--ring2="Varar Ring +1",
        --back=gear.phys_jse_back,
		--waist="Regal Belt",
		--legs="Apogee Slacks +1",
		--feet="Apogee Pumps +1"
	}
			
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		--legs="Enticer's Pants"
	})

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

	-- Aim for -14 perp, and refresh in other slots.
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {
		--main="Gridarvor",
		--sub="Oneiros Grip",
		--ammo="Sancus Sachet +1",
        --head="Beckoner's Horn +1",
		--neck="Caller's Pendant",
		--ear1="C. Palug Earring",
		--ear2="Evans Earring",
        --body="Shomonjijoe +1",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Evoker's Ring",
		--ring2="Stikini Ring +1",
        --back="Moonlight Cape",
		--waist="Lucidity Sash",
		--legs="Assid. Pants +1",
		--feet="Convo. Pigaches +3"
	}
		
    sets.idle.Spirit = {
		--main="Gridarvor",
		--sub="Oneiros Grip",
		--ammo="Sancus Sachet +1",
        --head="Convoker's Horn +3",
		--neck="Caller's Pendant",
		--ear1="C. Palug Earring",
		--ear2="Ethereal Earring",
        --body="Shomonjijoe +1",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Evoker's Ring",
		--ring2="Stikini Ring +1",
        --back="Conveyance Cape",
		--waist="Lucidity Sash",
		--legs="Assid. Pants +1",
		--feet="Convo. Pigaches +3"
	}
		
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

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if pet.name == spell.english and pet.hpp > 50 then
		add_to_chat(122, "You already have that avatar active!")
		eventArgs.cancel = true
	elseif avatars:contains(spell.english) and pet.isvalid then
		eventArgs.cancel = true
		windower.chat.input('/pet Release <me>')
		windower.chat.input:schedule(2,'/ma "'..spell.english..'" <me>')
	end

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
	if not spell.interrupted then
		if spellMap == 'PhysicalBloodPactRage' then
			if sets.midcast.Pet.PhysicalBloodPactRage[pet.name] then
				equip(sets.midcast.Pet.PhysicalBloodPactRage[pet.name])
			end
		elseif spellMap == 'MagicalBloodPactRage' then
			if sets.midcast.Pet.MagicalBloodPactRage[pet.name] then
				equip(sets.midcast.Pet.MagicalBloodPactRage[pet.name])
			end
		elseif spellMap == 'DebuffBloodPactWard' then
			if sets.midcast.Pet.BloodPactWard[pet.name] then
				equip(sets.midcast.Pet.BloodPactWard[pet.name])
			end
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
    if new_status == "Engaged" and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and state.AutoFightMode.value and player.target.distance < 20 then
		windower.chat.input('/pet Assault <t>')
	end
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

-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end

-- Custom spell mapping.
function job_get_spell_map(spell)
    if spell.type == 'BloodPactRage' then
        if magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
        else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' then
		if  spell.target.type == 'MONSTER' then
			return 'DebuffBloodPactWard'
		else
			return 'BloodPactWard'
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)

	classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end

	--determine_haste_group()
end


function customize_idle_set(idleSet)
	if pet.isvalid and sets.perp then
        if sets.perp.Day and pet.element == world.day_element then
            idleSet = set_combine(idleSet, sets.perp.Day)
        end
        if sets.perp.Weather and pet.element == world.weather_element then
            idleSet = set_combine(idleSet, sets.perp.Weather)
        end
        if sets.perp[pet.name] then
            idleSet = set_combine(idleSet, sets.perp[pet.name])
        end
        if pet.status == 'Engaged' and sets.idle.Avatar.Engaged then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged)
			if sets.idle.Avatar.Engaged[pet.name] then
				idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged[pet.name])
			end
        end
    end
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
	end

	return false
end