-- Movement Handling
lastlocation = 'fff':pack(0,0,0)
moving = false
wasmoving = false
packets = require('packets')

windower.raw_register_event('outgoing chunk',function(id,data,modified,is_injected,is_blocked)
    if id == 0x015 then
        moving = lastlocation ~= modified:sub(5, 16)
        lastlocation = modified:sub(5, 16)		
		wasmoving = moving
    end
    if id == 0x01A then
        local p = packets.parse('outgoing', data)
        if p['Category'] == 0x04 then
            casting = false
        end
    end
end)

-- Casting Handline
casting = false
windower.raw_register_event( 'incoming chunk', function(id,original,modified,injected,blocked)
    if id == 0x028 then
        local packet = packets.parse('incoming', original)
        if packet.Actor ~= windower.ffxi.get_mob_by_target('me').id then return false end
        if packet.Category == 4 then
            -- Finish Casting
            casting = false
        elseif L{3,5,11}:contains(packet.Category) then -- 2 Ranged Attacks
            -- Finish Casting/WS/Item Use
            casting = false
        elseif L{7,8,9}:contains(packet.Category) then -- 12 Ranged Attacks
            if (packet.Param == 24931) then
                --  Begin Casting/WS/Item Use
                casting = true
            elseif (packet.Param == 28787) then
                -- Failed Casting/WS/Item Interrupted
                casting = false
            end
        end
    end
end)

data.areas = {}

-- City areas for town gear and behavior.
data.areas.cities = S{
    "Ru'Lude Gardens",
    "Upper Jeuno",
    "Lower Jeuno",
    "Port Jeuno",
    "Port Windurst",
    "Windurst Waters",
    "Windurst Woods",
    "Windurst Walls",
    "Heavens Tower",
    "Port San d'Oria",
    "Northern San d'Oria",
    "Southern San d'Oria",
	"Chateau d'Oraguille",
    "Port Bastok",
    "Bastok Markets",
    "Bastok Mines",
    "Metalworks",
    "Aht Urhgan Whitegate",
	"The Colosseum",
    "Tavnazian Safehold",
    "Nashmau",
    "Selbina",
    "Mhaura",
	"Rabao",
    "Norg",
    "Kazham",
    "Eastern Adoulin",
    "Western Adoulin",
	"Celennia Memorial Library",
	"Mog Garden",
	"Leafallia"
}
-- Adoulin areas, where Ionis will grant special stat bonuses.
data.areas.adoulin = S{
    "Yahse Hunting Grounds",
    "Ceizak Battlegrounds",
    "Foret de Hennetiel",
    "Morimar Basalt Fields",
    "Yorcia Weald",
    "Yorcia Weald [U]",
    "Cirdas Caverns",
    "Cirdas Caverns [U]",
    "Marjami Ravine",
    "Kamihr Drifts",
    "Sih Gates",
    "Moh Gates",
    "Dho Gates",
    "Woh Gates",
    "Rala Waterways",
    "Rala Waterways [U]",
    "Outer Ra'Kaznar",
    "Outer Ra'Kaznar [U]",
	"Ra'Kaznar Inner Court"
}
-- Assault/Salvage areas, where Aht Urghan Rings will grant special stat bonuses.
data.areas.assault = S{
    "Nyzul Isle",
    "Leujaoam Sanctum",
    "Mamool Ja Training Grounds",
    "Periqia",
    "Lebros Cavern",
    "Ilrusi Atoll",
    "Zhayolm Remnants",
    "Arrapago Remnants",
    "Bhaflau Remnants",
    "Silver Sea Remnants"
}
-- Proc weapon areas, where proc weapon sets in the weapon mode will not be skipped
data.areas.proc = S{

}
-- Laggy zones where latency will be increased.
data.areas.laggy = S{
	"Dynamis - San d'Oria [D]",
	"Dynamis - Bastok [D]",
	"Dynamis - Windurst [D]",
	"Dynamis - Jeuno [D]",
	"Reisenjima Henge",
	"Reisenjima",
	"Escha - Zi'Tah",
	"Escha - Ru'Aun",
	"Outer Ra'Kaznar [U]",
}

-- Basic elements
data.elements = {}

data.elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

data.elements.nuke_of = {['Fire']='Fire', ['Ice']='Blizzard', ['Wind']='Aero', ['Earth']='Stone',
        ['Lightning']='Thunder', ['Water']='Water', ['Light']='Banish', ['Dark']='Bio',}
        
data.elements.quickdraw_of = {['Fire']='Fire', ['Ice']='Ice', ['Wind']='Wind', ['Earth']='Earth',
        ['Lightning']='Thunder', ['Water']='Water', ['Light']='Light', ['Dark']='Dark',}
        
data.elements.enspell_of = {['Fire']='Fire', ['Ice']='Blizzard', ['Wind']='Aero', ['Earth']='Stone',
        ['Lightning']='Thunder', ['Water']='Water', ['Light']='Light', ['Dark']='Dark',}

data.elements.runes_lookup = {['Lux']='Light', ['Tenebrae']='Dark', ['Ignis']='Fire', ['Gelus']='Ice', ['Flabra']='Wind',
     ['Tellus']='Earth', ['Sulpor']='Lightning', ['Unda']='Water'}

data.elements.enspells_lookup = {['Enthunder']='Lightning', ['Enstone']='Earth', ['Enaero']='Wind', ['Enblizzard']='Ice',
        ['Enfire']='Fire', ['Enwater']='Water', ['Enlight']='Light', ['Endark']='Dark', 
        ['Enthunder II']='Thunder', ['Enstone II']='Earth', ['Enaero II']='Wind', 
        ['Enblizzard II']='Ice', ['Enfire II']='Fire', ['Enwater II']='Water', ['Enlight II']='Light', 
        ['Endark II']='Dark'}
        
data.elements.ninjutsu_nuke_of = {['Fire']='Katon', ['Ice']='Hyoton', ['Wind']='Huton', ['Earth']='Doton',
        ['Lightning']='Raiton', ['Water']='Suiton', ['Dark']='Kurayami',}
        
data.elements.nukega_of = {['Fire']='Fira', ['Ice']='Blizza', ['Wind']='Aero', ['Earth']='Stone',
        ['Lightning']='Thunda', ['Water']='Water', ['Light']='Banish', ['Dark']='Bio',}
        
data.elements.nukera_of = {['Fire']='Fi', ['Ice']='Blizza', ['Wind']='Ae', ['Earth']='Stone',
        ['Lightning']='Thunda', ['Water']='Wate',}
        
data.elements.spikes_of = {['Fire']='Blaze',['Lightning']='Shock',['Ice']='Ice',['Dark']='Dread'}
        
data.elements.helix_of = {['Fire']='Pyro', ['Ice']='Cryo', ['Wind']='Anemo', ['Earth']='Geo',
        ['Lightning']='Iono', ['Water']='Hydro', ['Light']='Lumino', ['Dark']='Nocto',}
        
data.elements.threnody_of = {['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Ltng.',
        ['Lightning']='Water', ['Water']='Fire', ['Light']='Dark', ['Dark']='Light',}
        
data.elements.ancient_nuke_of = {['Fire']='Flare', ['Ice']='Freeze', ['Wind']='Tornado', ['Earth']='Quake',
        ['Lightning']='Burst', ['Water']='Flood', ['Light']='Holy', ['Dark']='Comet',}
        
data.elements.elemental_enfeeble_of = {['Fire']='Burn', ['Ice']='Frost', ['Wind']='Choke', ['Earth']='Rasp',
        ['Lightning']='Shock', ['Water']='Drown', ['Light']='Dia II', ['Dark']='Bio II',}

data.elements.weak_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Lightning',
        ['Lightning']='Water', ['Water']='Fire'}

data.elements.strong_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
        ['Lightning']='Earth', ['Water']='Lightning'}

data.elements.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",
        ['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm",}

data.elements.rune_of = {['Light']='Lux', ['Dark']='Tenebrae', ['Fire']='Ignis', ['Ice']='Gelus', ['Wind']='Flabra',
     ['Earth']='Tellus', ['Lightning']='Sulpor', ['Water']='Unda'}

function check_midaction()
	return false
end

function silent_check_amnesia()

	if buffactive.amnesia or buffactive.impairment then
		return true
	else
		return false	
	end
	
end

function silent_check_disable()

	if buffactive.terror or buffactive.petrification or buffactive.sleep or buffactive.Lullaby or buffactive.stun then
		return true
	else
		return false
	end	

end

function silent_check_fighting()
	if	player.target and
		player.status == 'Engaged' and 
		player.in_combat and
		player.target.type == "MONSTER" and
		player.target.hpp < 100
	then
		return true
	end
	return false;
end

function copy_entry(tab)
	if not tab then return nil end
	local ret = setmetatable(table.reassign({},tab),getmetatable(tab))
	return ret
end

function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]
    local StratagemChargeTimer = 240
    local maxStrategems = 1
    
    if player.sub_job == 'SCH' and player.sub_job_level > 29 then
        StratagemChargeTimer = 120
    elseif player.main_job_level > 89 then
        if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 549 then
            StratagemChargeTimer = 33
        else
            StratagemChargeTimer = 48
        end
    elseif player.main_job_level > 69 then
        StratagemChargeTimer = 60
    elseif player.main_job_level > 49 then
        StratagemChargeTimer = 80
    elseif player.main_job_level > 29 then
        StratagemChargeTimer = 120
    end
    
    if player.sub_job == 'SCH' then
        if player.sub_job_level > 29 then
            maxStrategems = 2
        end
    else
        maxStrategems = math.floor((player.main_job_level + 10) / 20)
    end


    local currentCharges = math.floor(maxStrategems - (stratsRecast / StratagemChargeTimer))
    return currentCharges
end

function arts_active()
    if buffactive['Light Arts'] or buffactive['Addendum: White'] or buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
        return true
    else
        return false
    end
end

-- Function to make auto-translate work in windower.
-- Usage: windower.add_to_chat(207, 'Test ' .. auto_translate(command))

do
    local cache = {}
    auto_translate = function(term)
        if not cache[term] then
            local entry = res.auto_translates:with('english', term)
            cache[term] = entry and 'CH>HC':pack(0xFD, 0x0202, entry.id, 0xFD) or term
        end

        return cache[term]
    end
end

function get_spell_table_by_name(name)
	spells = require('resources').spells
	for k,v in pairs(spells) do
        if v.en:lower() == name:lower() then
            return v
        end
    end
    return nil
end

function actual_cost(spell)
	return spell.mp_cost
end

function get_closest_mob_id_by_name(name)
	local name = get_fuzzy_name(name)
	local mobs = windower.ffxi.get_mob_array()
	local fuzzy_list = T{}
	local best_match = T{}

	for i, mob in pairs(mobs) do
		if mob.valid_target then
			local fuzzy_mob_name = get_fuzzy_name(mob.name)
			if (name:length() >= 3 and fuzzy_mob_name:contains(name)) or fuzzy_mob_name == name then
				fuzzy_list[mob.id] = mob
				fuzzy_list[mob.id].score = fuzzy_mob_name:length() - name:length()
			end
		end
	end
	
	for i, mob in pairs(fuzzy_list) do
		if (not best_match.score or mob.score < best_match.score) or (mob.score == best_match.score and (mob.distance < best_match.distance)) then
			best_match = mob
		end
	end

	return best_match.id or false
end

function get_closest_mob_by_name(name)
	local name = get_fuzzy_name(name)
	local mobs = windower.ffxi.get_mob_array()
	local fuzzy_list = T{}
	local best_match = T{}

	for i, mob in pairs(mobs) do
		if mob.valid_target then
			local fuzzy_mob_name = get_fuzzy_name(mob.name)
			if (name:length() >= 3 and fuzzy_mob_name:contains(name)) or fuzzy_mob_name == name then
				fuzzy_list[mob.id] = mob
				fuzzy_list[mob.id].score = fuzzy_mob_name:length() - name:length()
			end
		end
	end
	
	for i, mob in pairs(fuzzy_list) do
		if (not best_match.score or mob.score < best_match.score) or (mob.score == best_match.score and (mob.distance < best_match.distance)) then
			best_match = mob
		end
	end

	return best_match or false
end

function get_fuzzy_name(name)
	return name:lower():gsub("%s", ""):gsub("%p", "")
end