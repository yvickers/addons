local mobDisplay = {}

local res = require('resources')
local math = require 'math'
local resItems = res.items
local https = require('ssl.https')
require('strings')
require('socket')
require('tables')

function mobDisplay.Get()

    local this = {}

    local defaultSettings = {}
    defaultSettings.pos = {}
    defaultSettings.pos.x = 750
    defaultSettings.pos.y = 500
    defaultSettings.text = {}
    defaultSettings.text.font = 'Verdana'
    defaultSettings.text.size = 10
    defaultSettings.text.alpha = 255
    defaultSettings.text.red = 249
    defaultSettings.text.green = 236
    defaultSettings.text.blue = 236
    defaultSettings.text.stroke = {}
    defaultSettings.text.stroke.alpha = 175
    defaultSettings.text.stroke.red = 0
    defaultSettings.text.stroke.green = 0
    defaultSettings.text.stroke.blue = 0
    defaultSettings.text.stroke.width = 0.2
    defaultSettings.text.flags = {}
    defaultSettings.text.flags.bold = true
    defaultSettings.bg = {}
    defaultSettings.bg.alpha = 160
    defaultSettings.bg.red = 55
    defaultSettings.bg.green = 50
    defaultSettings.bg.blue = 50

    local playerServer = "Lakshmi"

    local servers = {
        ["bahamut"] = "sid=1",
        ["shiva"] = "sid=2",
        ["titan"] = "sid=3",
        ["ramuh"] = "sid=4",
        ["phoenix"] = "sid=5",
        ["carbuncle"] = "sid=6",
        ["fenrir"] = "sid=7",
        ["sylph"] = "sid=8",
        ["valefor"] = "sid=9",
        ["alexander"] = "sid=10",
        ["leviathan"] = "sid=11",
        ["odin"] = "sid=12",
        ["ifrit"] = "sid=13",
        ["diabolos"] = "sid=14",
        ["caitsith"] = "sid=15",
        ["quetzalcoatl"] = "sid=16",
        ["siren"] = "sid=17",
        ["unicorn"] = "sid=18",
        ["gilgamesh"] = "sid=19",
        ["ragnarok"] = "sid=20",
        ["pandemonium"] = "sid=21",
        ["garuda"] = "sid=22",
        ["cerberus"] = "sid=23",
        ["kujata"] = "sid=24",
        ["bismarck"] = "sid=25",
        ["seraph"] = "sid=26",
        ["lakshmi"] = "sid=27",
        ["asura"] = "sid=28",
        ["midgardsormr"] = "sid=29",
        ["fairy"] = "sid=30",
        ["remora"] = "sid=31",
        ["hades"] = "sid=32",
        ["eden"] = ""
    }

    local validUnms = T{"Bounding Belinda", "Hugemaw Harold", "Prickly Pitriv", "Ironhorn Baldurno",
    "Sleepy Mabel", "Serpopard Ninlil", "Abyssdiver", "Immanibugard", "Intuila", "Jester Malatrix", "Orcfeltrap",
    "Sybaritic Samantha", "Valkurm Imperator", "Cactrot Veloz", "Emperor Arthro", "Garbage Gel",
    "Joyous Green", "Keeper of Heligtum", "Tiyanak", "Voso", "Warblade Beak", "Woodland Mender",
    "Arke", "Ayapec", "Azure-toothed Clawberry", "Bakunawa", "Beist", "Centurio XX-I", "Coca",
    "Douma Weapon", "King Uropygid", "Kubool Ja's Mhuufya", "Largantua", "Lumber Jill", "Mephitas", "Muut",
    "Specter Worm", "Strix", "Vermillion Fishfly", "Azrael", "Borealis Shadow", "Camahueto", "Carousing Celine",
    "Grand Grenade", "Vedrfolnir", "Vidmapire", "Volatile Cluster", "Glazemane", "Wyvernhunter Bambrox",
    "Hidhaegg", "Sovereign Behemoth", "Tolba", "Thu'Ban", "Sarama", "Shedu"}

    local unmInfo = T{

        ["Bounding Belinda"] = {
            ["Content Level"] = 75,
            ["Accolade Cost"] = 200, 
            ["Drops"] = {
                8975,
                28272,
                28425,
                27597
            },
            ["Pop Price"] = 1000,
            ["PriceCurrent"] = false
        },

        ["Hugemaw Harold"] = {
            ["Content Level"] = 75,
            ["Accolade Cost"] = 200,
            ["Drops"] = {
                8974,
                28529,
                28488,
            },
            ["Pop Price"] = 3000,
            ["PriceCurrent"] = false
        },

        ["Prickly Pitriv"] = {
            ["Content Level"] = 75,
            ["Accolade Cost"] = 200,
            ["Drops"] = {
                8976,
                27599,
                28349,
                21347
            },
            ["Pop Price"] = 1000,
            ["PriceCurrent"] = false
        },

        ["Ironhorn Baldurno"] = {
            ["Content Level"] = 99,
            ["Accolade Cost"] = 400,
            ["Drops"] = {
                8977,
                27634,
                27600,
                28489,
            },
            ["Pop Price"] = 1000,
            ["PriceCurrent"] = false
        },

        ["Sleepy Mabel"] = {
            ["Content Level"] = 99,
            ["Accolade Cost"] = 400,
            ["Drops"] = {
                8978,
                21403,
                28533,
                28426,  
            },
            ["Pop Price"] = 2000,
            ["PriceCurrent"] = false
        },

        ["Serpopard Ninlil"] = {
            ["Content Level"] = 99,
            ["Accolade Cost"] = 400,
            ["Drops"] = {
                8980,
                21348,
                28534,
                28351,
            },
            ["Pop Price"] = 2000,
            ["PriceCurrent"] = false
        },

        ["Abyssdiver"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
              8981,
              21350,
              27994,  
              4059,
              4060,
              4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Immanibugard"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                9047,
                27561,
                27410,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Intuila"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                8982,
                28135,
                28485,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 0,
            ["PriceCurrent"] = false
        },

        ["Jester Malatrix"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                8992,
                20807,
                27637,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Orcfeltrap"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                8984,
                28424,
                20988,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Sybaritic Samantha"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                9027,
                27509,
                27563,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },


        ["Valkurm Imperator"] = {
            ["Content Level"] = 119,
            ["Accolade Cost"] = 1500,
            ["Drops"] = {
                8979,
                26710,
                28274,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Cactrot Veloz"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                8993,
                28487,
                21223,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 4000,
            ["PriceCurrent"] = false
        },

        ["Emperor Arthro"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                8983,
                28428,
                28137,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Garbage Gel"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                9092,
                10769,
                20522,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Joyous Green"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                8986,
                28430,
                28353,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 50000,
            ["PriceCurrent"] = false
        },

        ["Keeper of Heiligtum"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                9028,
                21035,
                27231,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Tiyanak"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                9046,
                26897,
                28482,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Voso"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                9054,
                26943,
                21417,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 4000,
            ["PriceCurrent"] = false
        },

        ["Warblade Beak"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                8988,
                28491,
                27966,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Woodland Mender"] = {
            ["Content Level"] = 122,
            ["Accolade Cost"] = 1800,
            ["Drops"] = {
                8994,
                21163,
                26869,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Arke"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                8989,
                21165,
                20614,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Ayapec"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9057,
                20805,
                26785,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Azure-toothed Clawberry"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9094,
                27107,
                27109,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Bakunawa"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9093,
                27518,
                20709,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Beist"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                8991,
                26715,
                26873,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 2000,
            ["PriceCurrent"] = false
        },

        ["Centurio XX-I"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9104,
                28413,
                25681,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Coca"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9056,
                27639,
                20943,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Douma Weapon"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9029,   
                26888,
                21419,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["King Uropygid"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9030,
                26732,
                6355,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Kubool Ja's Mhuufya"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9097,
                27533,
                20800,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 50000,
            ["PriceCurrent"] = false
        },

        ["Largantua"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                8990,
                26871,
                27505,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Lumber Jill"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                8985,
                20612,
                27602,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Mephitas"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9055,
                27559,
                20604,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Muut"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9048,
                20607,
                27051,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 10000,
            ["PriceCurrent"] = false
        },

        ["Specter Worm"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9058,
                21344,
                21703,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Strix"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                8987,
                21100,
                28276,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 5000,
            ["PriceCurrent"] = false
        },

        ["Vermillion Fishfly"] = {
            ["Content Level"] = 125,
            ["Accolade Cost"] = 2100,
            ["Drops"] = {
                9095,
                25602,
                10771,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Azrael"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9059,
                26787,
                20852,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Borealis Shadow"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9060,
                20528,
                21220,
                20854,
                27641,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 40000,
            ["PriceCurrent"] = false
        },

        ["Camahueto"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9051,
                27408,
                20899,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 40000,
            ["PriceCurrent"] = false
        },

        ["Carousing Celine"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9208,
                27151,
                27549,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Grand Grenade"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9098,
                22255,
                21091,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Vedrfolnir"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9031,
                20609,
                21160,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 15000,
            ["PriceCurrent"] = false
        },

        ["Vidmapire"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9103,
                20981,
                27610,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 40000,
            ["PriceCurrent"] = false
        },

        ["Volatile Cluster"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9096,
                27620,
                21030,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 5000,
            ["PriceCurrent"] = false
        },

        ["Glazemane"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9207,
                20581,
                21691,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Wyvernhunter Bambrox"] = {
            ["Content Level"] = 128,
            ["Accolade Cost"] = 2400,
            ["Drops"] = {
                9209,
                22121,
                21806,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 1000,
            ["PriceCurrent"] = false
        },

        ["Hidhaegg"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9149,
                20697,
                25636,
                21696,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 30000,
            ["PriceCurrent"] = false
        },

        ["Sovereign Behemoth"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9151,
                22267,
                13566,
                26002,
                27543,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Tolba"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9150,
                26402,
                21484,
                25710,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 40000,
            ["PriceCurrent"] = false
        },

        ["Thu'Ban"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9204,
                21749,
                25924,
                26022,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },

        ["Sarama"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9205,
                21689,
                25856,
                20680,
                4059,
                4060,
                4061,
            },
            ["Pop Price"] = 40000,
            ["PriceCurrent"] = false
        },

        ["Shedu"] = {
            ["Content Level"] = 135,
            ["Accolade Cost"] = 3100,
            ["Drops"] = {
                9206,
                20682,
                21076,
                27149,
                4059,
                4060,
                4061,                
            },
            ["Pop Price"] = 20000,
            ["PriceCurrent"] = false
        },
        --you aren't really botting tumult curator, are you?
    }
    
    local function average(table)
        local sum = 0
        for i = 1, #table do
            sum = sum + table[i]
        end
        return sum/#table
    end

    local function round(num, numDecimalPlaces)
  
        return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
      
    end 

    local function insertCommas(string)
        local formatted = tostring(string)
        while true do  
          formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
          if (k==0) then
            break 
          end
        end
        return formatted
    end

    --big thanks to kenshi for ffxiah stuffs
    function unmInfo:SetUnmPopPrice(name)
       
        if(self[name])then

            local header = {["cookie"] = nil}
            header["cookie"] = servers[playerServer:lower()]

            local resultsTable = {};
            local itemString = resItems[self[name]["Drops"][1]].en

            local itemStripSpaces = string.gsub(itemString, " ", "-")
            local itemsStripApostrophe = string.gsub(itemStripSpaces, "'", "")

            local itemUrl = "https://www.ffxiah.com/item/"..self[name]["Drops"][1].."/"..itemsStripApostrophe:lower().."/?stack=1"

            https.request{
                url = itemUrl,
                sink = ltn12.sink.table(resultsTable), 
                headers = header,
            }

            if(resultsTable)then

                local resultString = table.concat(resultsTable)

                if(resultString ~= nil)then

                    local t = string.match(resultString,'Item.sales = (.-);')
                    local sales = string.gmatch(t,"{(.-)}")

                    local priceTable = T{}

                    for word in sales do

                        priceTable:insert(string.match(word,'"price":(%d+),'))

                    end

                    local avgStackPrice = average(priceTable)
                    
                    self[name]["Pop Price"] = "("..playerServer..")".." "..insertCommas(tostring(round(avgStackPrice,0))).."g".."/12"

                end

            end

        end

    end

    this["BuildCurrentUNMInfo"] = function(name, accolades)
       
        if(validUnms:contains(name))then
            
            local stringTable = {}

            local curUnm = unmInfo[name]

            local white = {red = 249,  green = 236, blue = 236}
            local teal = {red = 26, green = 243, blue = 221}
            local lightGreen = {red = 43, green = 233, blue = 138}
            local popsPrice = ""

            if(curUnm["PriceCurrent"] == false)then
                curUnm["PriceCurrent"] = true
                popsPrice = unmInfo:SetUnmPopPrice(name)
            end

            stringTable["ContentLevel"] = string.format("\\cs(%s,%s,%s)[Content Level] \\cs(%s,%s,%s)" .. "%s":lpad(" ", 4), white.red, white.green, white.blue, teal.red, teal.green, teal.blue, curUnm["Content Level"])
            stringTable["AccoladeCost"] = string.format("\\cs(%s,%s,%s)[Accolade Cost] \\cs(%s,%s,%s)" .. "%s":lpad(" ", 4), white.red, white.green, white.blue, teal.red, teal.green, teal.blue, curUnm["Accolade Cost"])
            stringTable["PopsLeft"] = string.format("\\cs(%s,%s,%s)[Pops Left] \\cs(%s,%s,%s)" .. "%s":lpad(" ", 11), white.red, white.green, white.blue, teal.red, teal.green, teal.blue, math.floor(accolades/curUnm["Accolade Cost"]))
            stringTable["PopPrice"] = string.format("\\cs(%s,%s,%s)[Pops Price] \\cs(%s,%s,%s)" .. "%s":lpad(" ", 9), white.red, white.green, white.blue, teal.red, teal.green, teal.blue, curUnm["Pop Price"])
            local dropString = ""

            for _,v in pairs(curUnm["Drops"]) do

                dropString = dropString .. "       " .. res.items[v].en .. "\n"
            
            end

            stringTable["Drops"] = string.format("\\cs(%s,%s,%s)            [Drops]\n\\cs(%s,%s,%s)%s", white.red, white.green, white.blue, lightGreen.red, lightGreen.green, lightGreen.blue, dropString)

            return stringTable

        end

    end

    this["GetMobDisplaySettings"] = function()

        return defaultSettings

    end
        
    this["GetValidUNMNames"] = function()

        return validUnms

    end

    return this

end

return mobDisplay.Get()
