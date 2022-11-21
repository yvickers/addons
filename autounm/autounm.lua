_addon.name = "autounm4"
_addon.author = "Uwu/Darkdoom"
_addon.version = "4.0"
_addon.command = "unm"

local packets = require 'packets'
local texts = require 'texts'
local unmIds = require 'unmIds'
local mainDisplay = require 'mainDisplay'
local mobDisplay = require 'mobDisplay'
local outgoing = require 'outgoing'

require('defaultSettings')

local autounm = {
    
    ["Status"] = {
        ["Bot"] = "Waiting..",
        ["Menu"] = {
            ["Open"] = false,
            ["Id"] = 0,
            ["NextOption"] = 1,
        },
        ["Junction"] = "Waiting..",

    },

    ["CurrentTarget"] = "None.",

    ["Currencies"] = {
        ["Sparks"] = 0,
        ["Accolades"] = 0,
    },

    ["Enabled"] = false,

    ["Verbose"] = true,

    ["Timers"] = {
        ["PokeDelay"] = math.random(5,6),
        ["CurrencyDelay"] = math.random(30, 60),
        ["Delay"] = math.random(1,2),
        ["Poke"] = os.clock(),
        ["Currency"] = os.clock(),
        ["General"] = os.clock(),
        ["Prerender"] = os.clock(),
    },

    ["UNM"] = {
        ["Objective"] = 0,
        ["ROE"] = {
            ["ID"] = {
          
            },
            ["Completion"] = {
              
            },
        }
    },

    ["LastOutgoingInjected"] = false,

    ["JunctionSpawned"] = false,

    ["Junction"] = nil,

    ["Player"] = {},
}

local validUnmNames = mobDisplay["GetValidUNMNames"]()

local infoBox = texts.new(defaultSettings)
local mobInfoBox = texts.new(mobDisplay["GetMobDisplaySettings"]())

math.randomseed(os.clock())

local function CurrencyUpdate()

    outgoing["CurrencyUpdate"]()

end

function autounm:HandleCommand(...)

    if(#arg > 4)then
        windower.add_to_chat(167, "Invalid command, please type //unm help for commands.")
    
    elseif(#arg == 2)then

        if(arg[1]:lower() == "start")then

            if(arg[2]:lower() == "obj1")then
                self["Enabled"] = true
                self["UNM"]["Objective"] = 1

                windower.add_to_chat(200, "[AUTOUNM] Starting - Targeting first objective.")

            elseif(arg[2]:lower() == "obj2")then
                self["Enabled"] = true
                self["UNM"]["Objective"] = 2

                windower.add_to_chat(200, "[AUTOUNM] Starting - Targeting second objective.")

            end

        end

    elseif(#arg == 1)then

        if(arg[1]:lower() == "stop")then
            self["Enabled"] = false

            windower.add_to_chat(200, "[AUTOUNM] Stopping.")

        elseif(arg[1]:lower() == "help")then

            windower.add_to_chat(200, '[AUTOUNM] Available Options:')
            windower.add_to_chat(200, '  //unm start (obj1 or obj2) - turns on auto and starts trying to spawn')
            windower.add_to_chat(200, '  //unm stop - turns off autounm')  
            windower.add_to_chat(200, '  //unm stuck - attempts to free you from packet lock')
            windower.add_to_chat(200, '  //unm verbose - turns on debug logging')

        elseif(arg[1]:lower() == "stuck")then
            self:Release()

        elseif(arg[1]:lower() == "verbose")then
            self["Verbose"] = not self["Verbose"]

            windower.add_to_chat(200, string.format("[AUTOUNM] Setting Verbose mode to: %s", tostring(self["Verbose"])))

        end

    end

end

--for packet lock release stuffs
packets.raw_fields.incoming[0x052] = L{
    {ctype='unsigned char',   label='Type'}, --04
    {ctype='unsigned short',  label='Menu ID'}, --05
  }

function autounm:Release()

    if(self["Status"]["Menu"]["Id"])then

    local startRelease = packets.new('incoming', 0x052, {
        ["Type"] = 2,
        ["Menu ID"] = self["Status"]["Menu"]["Id"],
        })
    
        local finishRelease = packets.new('incoming', 0x052, {
        ["Type"] = 1
        })
    
        windower.add_to_chat(167, "[AUTOUNM] Forcing event skip..")
    
        packets.inject(startRelease)
        packets.inject(finishRelease)

    end

end

function autounm:Display()

    local displayString = mainDisplay["GetDisplayString"](self["Status"]["Bot"], self["Status"]["Junction"], self["CurrentTarget"], self["Currencies"]["Sparks"], self["Currencies"]["Accolades"], self["Timers"]["Delay"])

    infoBox:text(displayString)
    infoBox:visible(true)

    if(validUnmNames:contains(self["CurrentTarget"]))then
        
        local mobInfoTable = mobDisplay["BuildCurrentUNMInfo"](self["CurrentTarget"], self["Currencies"]["Accolades"])
        local mainBoxX = infoBox:pos_x()
        local mainBoxY = infoBox:pos_y()

        mobInfoBox:pos(mainBoxX + 350, mainBoxY)

        local mobInfoString = "         [TargetInfo]        \n" .. mobInfoTable["PopPrice"] .. "\n" .. mobInfoTable["ContentLevel"] .. "\n" .. mobInfoTable["AccoladeCost"] ..
            "\n" .. mobInfoTable["PopsLeft"] .. "\n" ..  mobInfoTable["Drops"]
        mobInfoBox:text(mobInfoString)
        mobInfoBox:visible(true)
    else
        mobInfoBox:visible(false)
    end

end

function autounm:UpdateState()

    if(os.clock() - self["Timers"]["Currency"] > self["Timers"]["CurrencyDelay"])then
        CurrencyUpdate()
        self["Timers"]["Currency"] = os.clock()
    end

    local gameInfo = windower.ffxi.get_info()
    local player = windower.ffxi.get_player()
    local target = windower.ffxi.get_mob_by_target('t')

    self["Player"] = player

    --need something better for this, doesn't quite work as intended
    --(min+0.5+math.random()*(max-min))
    local randomTimeDecimal = (0.8 + 0.5 + math.random() * (1.8 - 0.8))

    self["Timers"]["CurrencyDelay"] = math.random(30, 60)
    self["Timers"]["Delay"] = randomTimeDecimal

    self["Status"]["Menu"]["Open"] = gameInfo.menu_open

    if(target)then
        self["CurrentTarget"] = target.name
    else
        self["CurrentTarget"] = "None."
    end

    self:FindJunction()

end

--grab valid junction from entity list instead of by name cuz SE never clears the entity list
--and this causes get_mob_by_name to return the first junction seen instead of the valid one.
local function GrabValidJunction()

    local entList = windower.ffxi.get_mob_array()

    for k,v in pairs(entList) do

        local temp = windower.ffxi.get_mob_by_index(k)

        if(temp)then

            if(temp.name == "Ethereal Junction")then

                if(math.sqrt(temp.distance) < 6)then

                    return temp
                    
                end

            end

        end

    end

end


function autounm:FindJunction()

    if(os.clock()-self["Timers"]["General"] > self["Timers"]["Delay"])then

        self["Status"]["Bot"] = "Checking for Junction.."
        
        self["Junction"] = GrabValidJunction()

        local junction = self["Junction"]

        if junction then

            if(junction.valid_target == true and self["Status"]["Menu"]["Open"] == false)then

                self["Status"]["Bot"] = "Found it!"
                self["Status"]["Junction"] = "Spawned."
                self["JunctionSpawned"] = true

            elseif(junction.valid_target == false)then

                self["Status"]["Bot"] = "Waiting for respawn."
                self["Status"]["Junction"] = "It's gone ;(."
                self["JunctionSpawned"] = false

            elseif(self["Status"]["Menu"]["Open"] == true)then

                self["Status"]["Bot"] = "Doing menu things."
                self["Status"]["Junction"] = "Spawned"
                self["JunctionSpawned"] = true

            end

        end

        self["Timers"]["General"] = os.clock()

    end

end

function autounm:Automate()

    self:Display()

    if(self["Junction"])then

        if(self["Junction"].valid_target == true)then

            if(self["Player"].status == 0 and self["Status"]["Menu"]["Open"] == false)then

                if self:ValidateROE() == false then

                    self["Enabled"] = false
                    windower.add_to_chat(163, "[AUTOUNM] You have not yet received a reward from a unity objective!")

                else
                    self["Status"]["Menu"]["NextOption"] = 1
                    if(os.clock()-self["Timers"]["Poke"] > self["Timers"]["PokeDelay"])then
                    
                        outgoing["OpenMenu"](self["Junction"], self["Player"])
                        self["Timers"]["Poke"] = os.clock()
                        
                        if(self["Verbose"] == true)then
                            windower.add_to_chat(167, string.format("[DEBUG] Poking Junction..%s", self["Junction"].id))
                        end

                    end

                end

            elseif(self["Player"].status == 4)then

                self:MenuInteraction()

            end

        end

    end

end

function autounm:MenuInteraction()
    
    if(self["Verbose"] == true)then
        windower.add_to_chat(167, string.format("[DEBUG] attempting menu interaction: %s", self["Status"]["Menu"]["NextOption"]))
    end

    if(self["Status"]["Menu"]["NextOption"] == 1)then
        
        outgoing["DoMenuOne"](self["Junction"], self["Status"]["Menu"]["Id"], self["UNM"]["Objective"], self["Verbose"])
        self["Status"]["Menu"]["NextOption"] = 2

    elseif(self["Status"]["Menu"]["NextOption"] == 2)then

        outgoing["DoMenuTwo"](self["Junction"], self["Status"]["Menu"]["Id"], self["Verbose"])

    end

end

function autounm:HandleCurrencyUpdate(data)

    local currencies = packets.parse('incoming', data)

    if currencies then
    self["Currencies"]["Sparks"] = currencies["Sparks of Eminence"]
    self["Currencies"]["Accolades"] = currencies["Unity Accolades"]
    self["Status"]["Bot"] = "Parsing currencies.."   

        if currencies["Unity Accolades"] < 3100 then

            if(self["Verbose"] == true)then
                windower.add_to_chat(33, "[DEBUG] Out of accolades, pausing.")
            end

            self["Enabled"] = false

        end

    end

end

function autounm:HandleROEUpdate(data)

    local roeUpdate = packets.parse('incoming', data)

    if roeUpdate then
        self["Status"]["Bot"] = "Parsing ROEs.."

        for i=1, 30 do

            if roeUpdate[string.format('RoE Quest ID %s', i)] ~= 0 and unmIds:contains(roeUpdate[string.format('RoE Quest ID %s', i)]) then
    
            table.insert(self["UNM"]["ROE"]["ID"], roeUpdate[string.format('RoE Quest ID %s', i)]) 
            table.insert(self["UNM"]["ROE"]["Completion"], roeUpdate[string.format('RoE Quest Progress %s', i)])
    
            end
    
        end

    end

end

function autounm:HandleNPCInteraction(data)

    local npcInteraction = packets.parse('incoming', data)
    local npcName = windower.ffxi.get_mob_by_id(npcInteraction["NPC"]).name

    if(npcName == "Ethereal Junction") then
        
        if(self["LastOutgoingInjected"] == true)then

            self["Status"]["Menu"]["Id"] = npcInteraction["Menu ID"]
            self["Status"]["Menu"]["Open"] = true
            self["Status"]["Bot"] = "menu menu menu"

            return true

        elseif(self["LastOutgoingInjected"] == false)then

            self["Status"]["Menu"]["Id"] = npcInteraction["Menu ID"]
            windower.add_to_chat(163, "[AUTOUNM] Detected user interaction, not blocking menu.")

            return false

        end

    end

end

function autounm:ValidateROE()

    if(#self["UNM"]["ROE"]["Completion"] > 0)then
        self["Status"]["Bot"] = "Validating ROE completion.."
        if(self["Verbose"] == true)then
            windower.add_to_chat(167, "[DEBUG] Checking for unobtained roe rewards..")
        end

        for _,v in pairs(self["UNM"]["ROE"]["Completion"]) do
            --you have an roe reward not obtained!
            if v == 1 then
        
                return false
        
            end
        
        end

        return true

    end

end

windower.register_event('outgoing chunk', function(id, original, _, injected)

    if id == 0x01A then

        autounm["LastOutgoingInjected"] = injected

    end

end)

windower.register_event('addon command', function(...)

    autounm:HandleCommand(...)

end)

windower.register_event('load', function()

    CurrencyUpdate()

end)

windower.register_event('unload', function()
    --try to save people from getting locked if they unload at the wrong time cuz we nice like that
    if(autounm["Player"].status == 4)then
        autounm:Release()
    end

end)

windower.register_event('incoming chunk', function(id, data)

    if id == 0x113 then

        autounm:HandleCurrencyUpdate(data)
        if(autounm["Verbose"] == true)then
            windower.add_to_chat(167, "[DEBUG] Parsing currency update..")
        end

    end

    if id == 0x111 then

        autounm:HandleROEUpdate(data)
        if(autounm["Verbose"] == true)then
            windower.add_to_chat(167, "[DEBUG] Parsing ROE Objectives..")
        end

    end

    if id == 0x034 then

        if(autounm:HandleNPCInteraction(data) == true)then
            if(autounm["Verbose"] == true)then
                windower.add_to_chat(167, "[DEBUG] Correct NPC Interaction detected & poke injected, blocking menu")
            end
            return true
        end

    end

end)

windower.register_event('prerender', function()

    if(autounm["Enabled"] == true)then

        autounm:UpdateState()

        if(os.clock() - autounm["Timers"]["Prerender"] > autounm["Timers"]["Delay"])then

            autounm:Automate()
            autounm["Timers"]["Prerender"] = os.clock()

        end

    end

end)

