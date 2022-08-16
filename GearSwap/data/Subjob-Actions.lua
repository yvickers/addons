function sub_job_precast_WAR(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if 
		state.AutoBuffMode.current == 'on' and 
		spell.type == 'WeaponSkill' and 
		abil_recasts[2] and
		abil_recasts[2] < latency and 
		not buffactive.Berserk 
	then
		cast_delay(1.1)
		send_command('@input /ja "Warcry" <me>')
	end
end

function sub_job_precast_SAM(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.current == 'on' and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.tp > 1850 and abil_recasts[140] and abil_recasts[140] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Sekkanoki" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		elseif abil_recasts[134] and abil_recasts[134] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		--elseif abil_recasts[133] and abil_recasts[133] < latency then
			--eventArgs.cancel = true
			--windower.chat.input('/ja "Third Eye" <me>')
			--windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			--return
		end
	end
end

function sub_job_tick_SAM()
	local valid_weapons = {}

	--list each weapon we want hasso on, should be 2 handed weapon
	valid_weapons['Shining One'] = true
	valid_weapons['Chango'] = true
	valid_weapons['Gae Derg +1'] = true
	valid_weapons['Sturdy Axe'] = true
	valid_weapons['Ice Lance'] = true
	valid_weapons['Homestead Lance'] = true

	if state.AutoBuffMode.current == 'on' and silent_check_fighting() and valid_weapons[player.equipment.main] then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.SAMStance.current == 'Hasso' and not buffactive.Hasso and abil_recasts[138] and abil_recasts[138] < latency then
			windower.chat.input('/ja "Hasso" <me>')
			return true
		elseif state.SAMStance.current == 'Seigan' and not buffactive.Seigan and abil_recasts[139] and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
			return true
		end
	end
	return false
end

function sub_job_tick_WAR()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not buffactive.Berserk and abil_recasts[1] and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			return true
		elseif not buffactive.Aggressor and abil_recasts[4] and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			return true
		end
	end
	return false
end

function sub_job_tick_DRG()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		jumps = {
			[158] = {id=158,en="Jump",ja="ジャンプ",action_id=66},
			[159] = {id=159,en="High Jump",ja="ハイジャンプ",action_id=67},
		}

		for i in pairs(jumps) do
			if player.tp < 1000 and abil_recasts[i] and abil_recasts[i] < latency then
				windower.chat.input('/ja "'.. jumps[i].en ..'" <t>')
				return true
			end
		end
	end
	return false
end

function sub_job_tick_DRK()
	if state.AutoBuffMode.current == 'on' and silent_check_fighting() then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Last Resort'] and abil_recasts[87] and abil_recasts[87] < latency then
			windower.chat.input('/ja "Last Resort" <me>')
			return true
		end
	end
end