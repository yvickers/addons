_addon.author = 'Mishrahh'
_addon.commands = {'item'}
_addon.name = 'MB Item Helper'
_addon.version = '0.1'

require('luau')
res_items = require('resources').items

function get_item_res(item)
    for k,v in pairs(res_items) do
        if v.en:lower() == item or v.enl:lower() == item then
            return v
        end
    end
    return nil
end

function use_item(name)
    local name = windower.convert_auto_trans(name):lower()
    local item = get_item_res(name)
    if not item then
        windower.add_to_chat(207, '%s: "%s" not a valid item name.':format(_addon.name, name))
    elseif not item.targets.Self  then
        windower.add_to_chat(207, '%s: Cannot use "%s" on self.':format(_addon.name, item.en))
    else
        windower.chat.input('/p "' .. item.name .. '" <me>')
    end
end

windower.register_event('addon command', function(...)
    local command = arg[1] and arg[1]:lower()
    local send_all
    if command == 'all' then
        table.remove(arg,1)
        send_all = true
    end
    local str = _raw.table.concat(arg, ' ')
    if command then
        use_item(str)
    end
    if send_all then
        windower.send_ipc_message(message)
    end
end)

windower.register_event('ipc message', use_item)