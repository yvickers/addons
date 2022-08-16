_addon.author = 'Mishrahh'
_addon.commands = {'gambits'}
_addon.name = 'Gambits'
_addon.version = '0.1'

require('luau')
texts = require('texts')
packets = require('packets')

default = {
    delay = 5
}

settings = config.load(default)
last_coords = 'fff':pack(0,0,0)
is_moving = false
gambits_on = false
gambit_delay = 0

function run_gambit()
end

commands = {}

commands.once = function()
    run_gambit()
end

commands.auto = function()
    gambits_on = not gambits_on
    repeat
        run_gambit()
        coroutine.sleep(settings.delay + gambit_delay)
    until not gambits_on
end

commands.save = function()
end

commands.help = function()
end

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command](...)
    else
        commands.help()
    end
end)