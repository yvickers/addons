--[[
* Compare items to inventory use resource id
* Trade item, wait, press key, press key
* 
]]--

_addon.author = 'Mishrahh'
_addon.commands = {'delve',}
_addon.name = 'Delve Helper'
_addon.version = '0.1'

require('luau')
config = require('config')
texts = require('texts')
packets = require('packets')
res = require('resources')
player = windower.ffxi.get_player()

default = {}

trade_ok = false

--[[
0x036 the trade o
0x034 i
0x016 update request?
0x05B - need to track in pv for values Option index 1234, unk 1&2 0, automated false, menu 29
--]]




items = {
    'habilitator'
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

commands.save = function()
    settings:save('all')
    addon_message('Saving settings')
end

commands.start = function()
    local inventory = windower.ffxi.get_items(0)

    --find npc
    npc = windower.ffxi.get_mob_by_name('A.M.A.N. Reclaimer')
    if (nil == npc) then
        addon_message('Unable to find A.M.A.N. Reclaimer.')
        return
    end

    if(npc.distance:sqrt() > 6) then
        addon_message('A.M.A.N. Reclaimer out of range for trade.')
        return
    end

    --loop items
    for k,v in pairs(items) do
        windower.send_command('tradenpc 1 "'.. v ..'" "a.m.a.n. reclaimer"')
        windower.send_command:schedule(2,'setkey enter down; wait 0.2;setkey enter up; wait 0.2;')
        windower.send_command:schedule(4,'setkey up down; wait 0.2;setkey up up; wait 0.2;')
        windower.send_command:schedule(6,'setkey enter down; wait 0.2;setkey enter up; wait 0.2;')
        windower.send_command:schedule(8,'setkey enter down; wait 0.2;setkey enter up; wait 0.2;')
    end
end

commands.help = function()
    addon_message('Trades delve items to reclaimer.')
    addon_message('Usage: ')
end

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end