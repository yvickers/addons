_addon.author = 'Mishrahh'
_addon.commands = {'conquest','co'}
_addon.name = 'Conquest Points'
_addon.version = '0.1'

packets = require('packets')
buying = false
to_buy = 1

conquest_npcs = {
    ['Crying Wind, I.M.'] = 32800,
    ['Flying Axe, I.M.'] = 32800,
    ['Rabid Wolf, I.M.'] = 32800,
}

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command](...)
    else
        commands.help()
    end
end)
commands = {}
commands.buy = function(...)
    buying = true
    local args = {...}
    to_buy = args[1] and tonumber(args[1]) or 1
    poke_npc(get_npc())
end
commands.fill = function()
    buying = true
    local bag = windower.ffxi.get_items()
    to_buy = bag.max_inventory - bag.count_inventory
    addon_message('Purchasing %d items.':format(to_buy))
    poke_npc(get_npc())
end
commands.help = function()
    addon_message('Buys money item from conquest vendor.')
    addon_message('Usage: //co fill --fills available inventory space with money item')
    addon_message('Usage: //co buy (number) --buys 1 or (number) specified items')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end

function get_npc()
    for i,v in pairs(windower.ffxi.get_mob_array()) do
        if v.name and conquest_npcs[v.name] and math.sqrt(v.distance)<10 and windower.ffxi.get_player().status == 0 then
            return v
        end
    end
    return nil
end

function poke_npc(npc)
    if npc.id and npc.index then
        windower.packets.inject_outgoing(0x1A,string.char(0x1A,0xE,0,0)..'IHHHHIII':pack(npc.id,npc.index,0,0,0,0,0,0)) --interact npc
    end
end

windower.register_event('incoming chunk',function(id,org)
    if buying and id == 0x034 and conquest_npcs[windower.ffxi.get_mob_by_id(org:unpack('I',5)).name] then
        local response = packets.parse('incoming', org)
        local buy = packets.new('outgoing',0x05B,{
            ['Zone'] = response['Zone'],
            ['Menu ID'] = response['Menu ID'],
            ['Target'] = response['NPC'],
            ['Target Index'] = response['NPC Index'],
            ['Option Index'] = conquest_npcs[windower.ffxi.get_mob_by_id(org:unpack('I',5)).name],
            ['Automated Message'] = false
        } )
        packets.inject(buy)
        coroutine.sleep(1)
        windower.send_command('setkey escape down; wait 0.2;setkey escape up; wait 0.2;')
        if (to_buy > 1) then 
            to_buy = to_buy - 1
            poke_npc(windower.ffxi.get_mob_by_id(org:unpack('I',5)))
        else
            buying = false
        end
    end
end)

windower.register_event('load',function()
    commands.help()
end)