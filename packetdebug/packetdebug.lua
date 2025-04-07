--Handle self buffing

_addon.author = 'Mishrahh'
_addon.commands = {'pdebug',}
_addon.name = 'Packet Debugger'
_addon.version = '0.1'

require('luau')
texts = require('texts')
packets = require('packets')

default = {
    text = {text={size=10}},
    last_incoming = T{},
    last_outgoing = T{},
}

settings = config.load(default)

display_box = function()
    local str
    str = 'Last Incoming'
    for k,v in pairs(settings.last_incoming) do
        str = str..'\n %s: [%s]':format(k,tostring(v))
    end
    str = str .. '\n\n Last Outgoing'
    for k,v in pairs(settings.last_outgoing) do
        str = str..'\n %s: [%s]':format(k,tostring(v))
    end
    return str
end

packet_status = texts.new(display_box(),settings.text,settings)


function unload_chunk_event()
    windower.unregister_event(incoming_chunk)
    windower.unregister_event(outgoing_chunk)
end
function load_chunk_event()
    incoming_chunk = windower.register_event('incoming chunk', check_incoming_chunk)
    outgoing_chunk = windower.register_event('outgoing chunk', check_outgoing_chunk)
end

tracked_incoming = T{0x032,0x033,0x034,0x052}
function check_incoming_chunk(id,data,modified,injected,blocked)
    if tracked_incoming:contains(id) then
        settings.last_incoming = packets.parse('incoming', data)
        packet_status:text(display_box())
        addon_message('Incoming - %s,%s,%s,%s':format(id,tostring(settings.last_incoming['NPC']), tostring(settings.last_incoming['Zone']), tostring(settings.last_incoming['Menu ID'])))
    end
end

tracked_outgoing = T{0x05B,0x083}
function check_outgoing_chunk(id,data,modified,injected,blocked)
    if tracked_outgoing:contains(id) then
        settings.last_outgoing = packets.parse('outgoing', data)
        packet_status:text(display_box())
        addon_message('Outgoing - %s,%s,%s,%s,%s':format(id,tostring(settings.last_outgoing['Option Index']),tostring(settings.last_outgoing['_unknown1']),tostring(settings.last_outgoing['_unknown2']),tostring(settings.last_outgoing['Automated Message'])))
    end 
end

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
    settings.save(settings)
end
commands.help = function()
    addon_message('There is no help yet.')
end
commands.on = function()
   load_chunk_event()
   packet_status:text(display_box())
   packet_status:show()
end
commands.off = function()
    unload_chunk_event()
    packet_status:hide()
end
commands.reset = function()
    settings.last_incoming = T{}
    settings.last_outgoing = T{}
    packet_status:text(display_box())
end
function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end