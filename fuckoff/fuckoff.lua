_addon.name = 'FuckOff'
_addon.version = '0.10'
_addon.author = 'Chiaia (Asura)'
_addon.commands = {'fuckoff','fo'} --Won't do anything atm.
 
packets = require('packets')
 
local blackListedUsers = T{'Minervapa','TotallyABotThree',} -- Want to block all messages from X user then added there name(s) here.
     
-- I could do a general digit check on JP instead of set 500/2100 values but atm I feel it's not needed. Will see if they change thier tactics.
-- If you want to learn more about "Magical Characters" or Patterns in Lua: <a href="https://riptutorial.com/lua/example/20315/lua-pattern-matching" rel="nofollow">https://riptutorial.com/lua/example/20315/lua-pattern-matching</a>
local blackListedWords = T{
    string.char(0x81,0x99),
    string.char(0x81,0x9A),
    string.char(0x81,0x9C),
    '1%-99',
    'Job Point.*2100',
    'Job Point.*500',
    'JP.*2100',
    '500P',
    '2100JP',
    '2100P',
    'JP.*500',
    'Capacity Point.*2100',
    'Capacity Point.*500',
    'CP.*2100',
    'CP.*500',
    'Jinpu',
    'IGXE',
    'Discount',
    'King Ranperre\'s Tomb',
    'Bibiki Bay',
    'snkone*',
    'cooldog*',
    'daa*',
    'uail*',
    'genb*',
    'shmil*',
    'jini*',
    'mimi*',
    'kanna*',
    'caa*',
    'ＫＲＴ',
    --'Buy?',
    } -- First two are '☆' and '★' symbols.
 
windower.register_event('incoming chunk', function(id,data)
    if id == 0x017 then -- 0x017 Is incoming chat.
        local chat = packets.parse('incoming', data)
        local cleaned = windower.convert_auto_trans(chat['Message']):lower()
 
        if blackListedUsers:contains(chat['Sender Name']) then -- Blocks any message from X user in any chat mode.
            return true
        elseif (chat['Mode'] == 3 or chat['Mode'] == 1 or chat['Mode'] == 26) then -- RMT checks in tell, shouts, and yells. Years ago they use to use tells to be more stealthy about gil selling.
            for k,v in ipairs(blackListedWords) do
                if cleaned:match(v:lower()) or chat['Sender Name']:lower():match(v:lower()) then
                    return true
                end
            end
        end
    end
end)