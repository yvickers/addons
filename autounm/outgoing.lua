local packets = require 'packets'
local outgoing = {}

function outgoing.Get()

    local this = {}

    this["CurrencyUpdate"] = function()

        return windower.packets.inject_outgoing(0x10f, '0000')

    end

    this["OpenMenu"] = function(junction, player)

        if junction and player then

            local poke = packets.new('outgoing', 0x01A, {
                ["Target"] = junction.id,
                ["Target Index"] = junction.index,
                ["Category"] = 0,
            })

            return packets.inject(poke)

        end

    end

    this["DoMenuOne"] = function(junction, menuId, objective, verbose)

        local zone = windower.ffxi.get_info().zone

        if junction then

            if(objective == 1)then

                local menuOption = packets.new('outgoing', 0x05B, {
                    ["Target"] = junction.id,
                    ["Option Index"] = 12,
                    ["Target Index"] = junction.index,
                    ["Automated Message"] = true,
                    ["Zone"] = zone,
                    ["Menu ID"] = menuId,
                })
                if(verbose == true)then
                    windower.add_to_chat(167, string.format("MenuID %s Option %s Junction %s", menuId, 12, junction.id))
                end
                return packets.inject(menuOption)

            elseif(objective == 2)then

                local menuOption = packets.new('outgoing', 0x05B, {
                    ["Target"] = junction.id,
                    ["Option Index"] = 268,
                    ["Target Index"] = junction.index,
                    ["Automated Message"] = true,
                    ["Zone"] = zone,
                    ["Menu ID"] = menuId,
                })
                if(verbose == true)then
                    windower.add_to_chat(167, string.format("MenuID %s Option %s Junction %s", menuId, 268, junction.id))
                end
                return packets.inject(menuOption)

            end

        end

    end

    this["DoMenuTwo"] = function(junction, menuId, verbose)

        if junction then

            local zone = windower.ffxi.get_info().zone

            local menuOption = packets.new('outgoing', 0x05B, {
                ["Target"] = junction.id, 
                ["Option Index"] = 1,
                ["Target Index"] = junction.index,
                ["Automated Message"] = false,
                ["Zone"] = zone,
                ["Menu ID"] = menuId,
            })
            if(verbose == true)then
                windower.add_to_chat(167, string.format("MenuID %s Option %s Junction %s", menuId, 1, junction.id))
            end
            return packets.inject(menuOption)

        end

    end

    return this

end

return outgoing.Get()