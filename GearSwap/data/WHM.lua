-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include(player.name..'_'..player.main_job..'_gear.lua') -- Required Gear file.
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	state.Buff['Divine Caress'] = buffactive['Divine Caress'] or false

	state.AutoCaress = M(true, 'Auto Caress Mode')
	state.Gambanteinn = M(false, 'Gambanteinn Cursna Mode')
	state.BlockLowDevotion = M(true, 'Block Low Devotion')

	state.ElementalMode = M{['description'] = 'Elemental Mode','Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water',}

    state.MainWS = M{['description'] = 'Main Weaponskill', 'Hexastrike' }
    state.AutoBuffMode = M( true, "Automatic Buffs" )

    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA')

    gear.Artifact = {}
    gear.Artifact.Head = ""
    gear.Artifact.Body = ""
    gear.Artifact.Hands = ""
    gear.Artifact.Legs = ""
    gear.Artifact.Feet = ""

    gear.Empyrean = {}
    gear.Empyrean.Head = ""
    gear.Empyrean.Body = ""
    gear.Empyrean.Hands = ""
    gear.Empyrean.Legs = ""
    gear.Empyrean.Feet = ""

    gear.Relic = {}
    gear.Relic.Head = ""
    gear.Relic.Body = ""
    gear.Relic.Hands = ""
    gear.Relic.Legs = ""
    gear.Relic.Feet = ""

    gear.capes = {}
    gear.capes.CurePotency = { name="Alaunus's Cape", augments={}}

    -- Additional local binds
--[[
^   Ctrl
!   Alt
@   Win
#   Apps

    send_command('bind ^g gs c cycle Weapons')
--]]


    if select_default_macro_book then
        select_default_macro_book()
    end

    send_command('wait 10; input /lockstyle on')

    if user_job_setup then
        user_job_setup()
    end

    function handle_smartcure(cmdParams)
		if cmdParams[2] then
			if tonumber(cmdParams[2]) then
				cureTarget = windower.ffxi.get_mob_by_id(tonumber(cmdParams[2]))
			else
				cureTarget = table.concat(cmdParams, ' ', 2)
				cureTarget = get_closest_mob_by_name(cureTarget) 
				if not cureTarget.name then cureTarget = player.target end
				if not cureTarget.name then cureTarget = player end
			end
		elseif player.target.type == "SELF" or player.target.type == 'MONSTER' or player.target.type == 'NONE' then
			cureTarget = player
		else
			cureTarget = player.target
		end

		if cureTarget.status == 2 or cureTarget.status == 3 then
			windower.chat.input('/ma "Arise" '..cureTarget..'')
			return
		end
		
		local missingHP
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if cureTarget.type == 'MONSTER' then
			if silent_can_use(4) and spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif cureTarget.in_alliance then
			cureTarget.hp = find_player_in_alliance(cureTarget.name).hp
			local est_max_hp = cureTarget.hp / (cureTarget.hpp/100)
			missingHP = math.floor(est_max_hp - cureTarget.hp)
		else
			local est_current_hp = 1800 * (cureTarget.hpp/100)
			missingHP = math.floor(1800 - est_current_hp)
		end

		if missingHP < 250 then
			if spell_recasts[1] < spell_latency then
				windower.chat.input('/ma "Cure" '..cureTarget.id..'')
			elseif spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 400 then
			if spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[1] < spell_latency then
				windower.chat.input('/ma "Cure" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 900 then
			if spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 1400 then
			if spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[6] < spell_latency then
				windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		else
			if spell_recasts[6] < spell_latency then
				windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
			elseif spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		end
	end

end

-- Called when this job file is unloaded (eg: job change)
function unload_job_keybinds()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
   		--body="Piety Bliaut +1"
	}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        --ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
   		--ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


    sets.precast.RA = {
    }

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {

    }
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        --ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
    }
        
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
    })

    sets.midcast['Full Cure'] = sets.midcast.FastRecast
    sets.midcast.Cure = {
		--main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		--sub="Sors Shield",
		--ammo="Hydrocera",
		--head={ name="Vanya Hood", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		--body=gear.Empyrean.Body,
		--hands=gear.Inyanga.Hands,
		--legs=gear.Empyrean.Legs,
		--feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		--neck="Cleric's Torque",
		--waist="Hachirin-no-Obi",
		--left_ear="Glorious Earring",
		--right_ear="Nourish. Earring +1",
		----left_ring="",
		----right_ring="",
		--back=gear.capes.CurePotency
	}
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
	})

	sets.midcast.Cursna = {}
	sets.midcast.StatusRemoval = {}
	sets.midcast.Erase = {}
	sets.midcast['Enhancing Magic'] = {
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="Embla Sash",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	}
	--sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	--sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})
	--sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	--sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +1",legs="Th. Pant. +3",})
	--sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	--sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.BarElement = {}

    -- Sets to return to when not performing an action.
    
	-- Resting sets
	sets.resting = {
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	}
    
	-- Idle sets
	sets.idle = {
		--ammo="Staunch Tathlum",
		--head=gear.Ayanmo.Head,
		--body=gear.Ayanmo.Body,
		--hands=gear.Ayanmo.Hands,
		--legs=gear.Ayanmo.Legs,
		--feet=gear.Ayanmo.Feet,
		--neck="Warder's Charm +1",
		--waist="Hachirin-no-Obi",
		--left_ear="Genmei Earring",
		--right_ear="Ethereal Earring",
		--left_ring="Ayanmo Ring",
		--right_ring="Defending Ring",
		--back="Solemnity Cape",
	}

    sets.idle.Town = set_combine( sets.idle, {} )
    sets.idle.PDT = set_combine( sets.idle, {} )
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}
    
    sets.Kiting = set_combine( sets.PDT, {
    })

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {
        --ammo="",
        --head="",
        --body="",
        --hands="",
        --legs="",
        --feet="",
        --neck="",
        --waist="",
        --left_ear="",
        --right_ear="",
        --left_ring="",
        --right_ring="",
        --back="",
    }
    
    sets.engaged.Acc = set_combine( sets.engaged.Melee, {
    })

    sets.engaged.Melee.DW = set_combine( sets.engaged.Melee, {
    })
    
    sets.engaged.Acc.DW = set_combine( sets.engaged.Melee.DW, {
    })

    sets.engaged.Ranged = set_combine( sets.engaged.Melee, {
    })
end

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			--gear.default.obi_waist = gear.obi_cure_waist
			--gear.default.obi_back = gear.obi_cure_back
		elseif spell.english == 'Holy II' then
			--gear.default.obi_waist = gear.obi_high_nuke_waist
		elseif spell.english == 'Holy' or (spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble') then
			--gear.default.obi_waist = gear.obi_nuke_waist
			--gear.default.obi_back = gear.obi_nuke_back
		elseif spellMap == 'StatusRemoval' and not (spell.english == "Erase" or spell.english == "Esuna" or spell.english == "Sacrifice") then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[32] < latency and not silent_check_amnesia() and state.AutoCaress.value then
				eventArgs.cancel = true
				windower.chat.input('/ja "Divine Caress" <me>')
				windower.chat.input:schedule(1,'/ma "'..spell.english..'" '..spell.target.raw..'')
				return
			end
		end
	elseif spell.type == 'JobAbility' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.english == 'Devotion' and state.BlockLowDevotion.value and abil_recasts[28] < latency and player.hpp < 50 then
			eventArgs.cancel = true
			add_to_chat(123,'Abort: Blocking Devotion under 50% HP to prevent inefficient use.')
		end
	end
end

function job_tick()
    if automatic_job_buffs() then return true end
    return false
end

function automatic_job_buffs()
    if state.AutoBuffMode.current == 'on' and player.in_combat then
        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[29] < latency and not state.Buff['Afflatus Solace'] and not state.Buff['Afflatus Misery'] then
			send_command('@input /ja "Afflatus Solace" <me>')
			tickdelay = os.clock() + jatickdelay
		return true

		elseif player.sub_job == 'SCH' and not arts_active() and abil_recasts[228] < latency then
			send_command('@input /ja "Light Arts" <me>')
			tickdelay = os.clock() + jatickdelay
			return true
		end
    end

    return false
end