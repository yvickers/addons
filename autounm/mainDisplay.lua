local mainDisplay = {}

require('strings')

function mainDisplay.Get()
    
    local this = {}

    local function BotStatus(status) 
        return string.format("[Bot Status]" .."%s":lpad(" ", 12), status) 
    end

    local function JunctionStatus(status)
        if(status == "Spawned.")then
            local red, green, blue = 30, 228, 142
            return string.format("[Junction Status]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 5), red, green, blue, status)
        elseif(status == "It's gone ;(.")then
            local red, green, blue = 215, 13, 94
            return string.format("[Junction Status]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 5), red, green, blue, status)
        else
            local red, green, blue = 249, 236, 236
            return string.format("[Junction Status]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 5), red, green, blue, status)
        end
    end

    local function Target(target)
        local white = {red = 249, green = 236, blue = 236}
        local red, green, blue = 13, 208, 215
        return string.format("\\cs(%s,%s,%s)[Target]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 18), white.red, white.green, white.blue, red, green, blue, target)
    end

    local function Sparks(sparks)
        local white = {red = 249, green = 236, blue = 236}
        if(sparks == 99999)then
            local red, green, blue = 68, 239, 136
            return string.format("\\cs(%s,%s,%s)[Sparks]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 17), white.red, white.green, white.blue, red, green, blue, sparks)
        else
            local red, green, blue = 236, 102, 24
            return string.format("\\cs(%s,%s,%s)[Sparks]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 17), white.red, white.green, white.blue, red, green, blue, sparks)
        end
    end

    local function Accolades(accolades)
        local white = {red = 249, green = 236, blue = 236}
        if(accolades > 75000)then
            local red, green, blue = 68, 239, 136
            return string.format("\\cs(%s,%s,%s)[Accolades]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 13), white.red, white.green, white.blue, red, green, blue, accolades)
        elseif(accolades > 25000 and accolades < 75000)then
            local red, green, blue = 236, 102, 24
            return string.format("\\cs(%s,%s,%s)[Accolades]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 13), white.red, white.green, white.blue, red, green, blue, accolades)
        elseif(accolades < 25000)then
            local red, green, blue = 210, 30, 66
            return string.format("\\cs(%s,%s,%s)[Accolades]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 13), white.red, white.green, white.blue, red, green, blue, accolades)
        end
    end

    --this really doesn't belong here but meh
    local function round(num, numDecimalPlaces)
        local mult = 10^(numDecimalPlaces or 0)
        return math.floor(num * mult + 0.5) / mult
      end

    local function CurDelay(delay)
        local white = {red = 249, green = 236, blue = 236}
        --change all these to clearer vars this be silly
        local red, green, blue = 68, 239, 136
        
        return string.format("\\cs(%s,%s,%s)[Delay]\\cs(%s,%s,%s)" .. "%s":lpad(" ", 19), white.red, white.green, white.blue, red, green, blue, round(delay, 2))

    end

    this["GetDisplayString"] = function(botStatus, junctionStatus, target, sparks, accolades, delay)
        return string.format("%s\n%s\n%s\n%s\n%s\n%s", BotStatus(botStatus), JunctionStatus(junctionStatus), Target(target), Sparks(sparks), Accolades(accolades), CurDelay(delay))
    end

    return this

end

return mainDisplay.Get()