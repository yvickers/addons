function init_automatic_action()
	res = require('resources')
	state.TicksActive 			= M( false, 'TicksActive' )
	state.AutoBuffMode 			= M( true, "Automatic Buffs" )
	state.AutoDefenseMode 		= M( false, 'AutoDefenseMode Mode')
	state.AutoWSMode		  	= M( true, 'Auto Weaponskill Mode')
	state.AutoWSRestore		  	= M( true, 'Auto Weaponskill Restore Mode')
	state.AutoTank              = M( false, 'Auto Tank Mode')
	state.AutoFight             = M{['description'] = 'Auto Fight', 'None', 'Leader', 'Follower' }

	state.SAMStance             = M{['description'] = 'Samurai Stance', 'Hasso', 'Seigan', 'None' }

	state.MainWS = M{['description'] = 'Main Weaponskill', '' }
	state.AutoWSTP = M{['description'] = 'AutoWSTP', 1000, 1250, 1750, 2000, 3000, }
	state.SaveTPPCT = M{['description'] = 'Save TP Percentage', 0, 15, }
	latency = .7
	tickdelay = os.clock() + 5
	wstickdelay = 3
	jatickdelay = 3
	autowstp = 1000
	autows = ''

	state.AutoMagicBuffs = M{['description'] = 'Automatic Magic Buffs', 'Manual' }
	automatic_magic_buffs = {
		Manual = {}
	}
	spell_latency = 1

	state.AutoLockstyle	 	  = M(false, 'AutoLockstyle Mode')
	style_delay = os.clock() + 15
	style_lock = true

end
init_automatic_action()

function register_ticks()
	lastincombat = player.in_combat
	petWillAct = 0

	spell_latency = nil
	tickdelay = os.clock() + 1
	style_delay = os.clock() + 15
	
	if spell_latency == nil then
		spell_latency = (latency * 60) + 18
	end

	tickEventListener = windower.register_event('prerender', function()
		if not (os.clock() > tickdelay) then return end
		
		gearswap.refresh_globals(false)
		
		if (player ~= nil) and not data.areas.cities:contains(world.area) and (player.status == 'Idle' or player.status == 'Engaged') and not (check_midaction() or moving or casting or buffactive['Sneak'] or buffactive['Invisible'] or silent_check_disable()) then
			if pre_tick then
				if pre_tick() then return end
			end

			if user_job_tick then
				if user_job_tick() then return end
			end

			if user_tick then
				if user_tick() then return end
			end

			if job_tick then
				if job_tick() then return end
			end

			if default_tick then
				if default_tick() then return end
			end			

			if extra_user_job_tick then
				if extra_user_job_tick() then return end
			end

			if extra_user_tick then
				if extra_user_tick() then return end
			end
			
		end

		tickdelay = os.clock() + .5
		
		if lastincombat == true and not player.in_combat then
			being_attacked = false
			if player.status == 'Idle' and not midaction() and not (pet_midaction() or ((petWillAct + 2) > os.clock())) then
				handle_equipping_gear(player.status)
			end
			if state.AutoDefenseMode.value and state.DefenseMode.value ~= 'None' then
				state.DefenseMode:reset()
				--if state.DisplayMode.value then update_job_states()	end
			end
		end			
		lastincombat = player.in_combat
	end)

end

function default_tick()
	check_lockstyle()
	if check_provoke() then return true end
	if _G['sub_job_tick_'..player.sub_job] then
		if _G['sub_job_tick_'..player.sub_job]() then return true end
	end	
	if check_ws() then return true end
	if check_magic() then return true end
	if check_autofight() then return true end
end

function check_lockstyle()
	if state.AutoLockstyle.value and style_lock and os.clock() > style_delay then
		if user_job_lockstyle then
			user_job_lockstyle()
		elseif user_lockstyle then
			user_lockstyle()
		else
			windower.chat.input('/lockstyle on')
		end
		style_lock = false
		style_delay = os.clock() + 13
	end
end

function check_provoke()
	if state.AutoTank.value and 
		silent_check_fighting() and
		not silent_check_amnesia()
	then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[5] < latency then
			windower.chat.input('/ja "Provoke" <t>')
			return true
		end
	end
	return false 
end

function check_ws()
	if 
		state.AutoWSMode.value and 
		player.status == 'Engaged' and 
		player.tp > 999 and 
		player.target and 
		player.target.type == "MONSTER" and 
		player.target.hpp < 100 and 
		not silent_check_amnesia() and 
		not (player.target.distance > (19.7 + player.target.model_size)) 
		then

	local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
	local self_targ = S{"Moonlight"}
		
		if player.hpp < 41 and state.AutoWSRestore.value and available_ws:contains(47) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Sanguine Blade" <t>')
			return true
		elseif player.hpp < 41 and state.AutoWSRestore.value and available_ws:contains(105) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Catastrophe" <t>')
			return true
		elseif player.mpp < 31 and state.AutoWSRestore.value and available_ws:contains(109) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Entropy" <t>')
			return true
		elseif player.mpp < 31 and state.AutoWSRestore.value and available_ws:contains(171) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Mystic Boon" <t>')
			return true
		elseif player.target.distance > (3.2 + player.target.model_size) and not data.weaponskills.ranged:contains(state.MainWS.current) then
			return false
		elseif player.tp >= state.AutoWSTP.current and player.target.hpp >= state.SaveTPPCT.current then
			if self_targ:contains(state.MainWS.current) then
				windower.chat.input('/ws "'..state.MainWS.current..'" <me>')
			else
				windower.chat.input('/ws "'..state.MainWS.current..'" <t>')
			end
			return true
		--elseif data.equipment.relic_weapons:contains(player.equipment.main) and state.MaintainAftermath.value and (not buffactive['Aftermath']) then
			--windower.chat.input('/ws "'..data.weaponskills.relic[player.equipment.main]..'" <t>')
			--tickdelay = os.clock() + 2.8
			--return true
		--elseif (buffactive['Aftermath: Lv.3'] or not state.MaintainAftermath.value or not data.equipment.mythic_weapons:contains(player.equipment.main)) and player.tp >= autowstp then
			--windower.chat.input('/ws "'..autows..'" <t>')
			--tickdelay = os.clock() + 2.8
			--return true
		--elseif player.tp == 3000 then
			--windower.chat.input('/ws "'..data.weaponskills.mythic[player.equipment.main]..'" <t>')
			--tickdelay = os.clock() + 2.8
			--return true
		else
			return false
		end
	else
		return false
	end
end

function check_magic()
	if state.AutoMagicBuffs == 'Manual' then
		return false
	end

	local spell_recasts = windower.ffxi.get_spell_recasts()

	for i in pairs(automatic_magic_buffs[state.AutoMagicBuffs.Value]) do
		if not buffactive[automatic_magic_buffs[state.AutoMagicBuffs.Value][i].Buff] and 
			spell_recasts[automatic_magic_buffs[state.AutoMagicBuffs.Value][i].SpellID] < spell_latency 
		then
			if _G['automagic_check_'..automatic_magic_buffs[state.AutoMagicBuffs.Value][i].When] and _G['automagic_check_'..automatic_magic_buffs[state.AutoMagicBuffs.Value][i].When]() then
				tickdelay = os.clock() + automatic_magic_buffs[state.AutoMagicBuffs.Value][i].Wait
				windower.chat.input('/ma "'..automatic_magic_buffs[state.AutoMagicBuffs.Value][i].Name..'" <me>')
				return true
			end
		end
	end
end

function automagic_check_Always()
	return true
end
function automagic_check_Engaged()
	return silent_check_fighting()
end
function automagic_check_Idle()
	return player.status == 'Idle' and not moving
end

function check_autofight()
	if player.status ~= 'Idle' then
		return false
	end
	if 'Follower' == state.AutoFight.current then
		windower.chat.input( '/echo logic' )
		windower.chat.input( '/assist p2' )
		windower.chat.input:schedule(1,'/attack <t>')
		return true
	end
	return false
end