function define_global_sets()
    gear.Reive = {}
    sets.AutoBuff = {}

    gear.Meghanada = {}
    gear.Meghanada.Head = "Meghanada Visor +2"
    gear.Meghanada.Body = "Meg. Cuirie +2"
    gear.Meghanada.Hands = "Meg. Gloves +2"
    gear.Meghanada.Legs = "Meg. Chausses +2"
    gear.Meghanada.Feet = "Meg. Jam. +2"

    gear.Mummu = {}
    gear.Mummu.Head = "Mummu Bonnet +2"
    gear.Mummu.Body = "Mummu Jacket +2"
    gear.Mummu.Hands = "Mummu Wrists +2"
    gear.Mummu.Legs = "Mummu Kecks +2"
    gear.Mummu.Feet = "Mummu Gamash. +2"

    gear.Hiza = {}
    gear.Hiza.Head = "Hiza. Somen +1"
    gear.Hiza.Body = "Hiza. Haramaki"
    gear.Hiza.Hands = "Hizamaru Kote +1"
    gear.Hiza.Legs = "Hiza. Hizayoroi"
    gear.Hiza.Feet = "Hiza. Sune-Ate +1"

    gear.Sulevia = {}
    gear.Sulevia.Head = "Sulevia's Mask"
    gear.Sulevia.Body = "Sulevia's Plate."
    gear.Sulevia.Hands = "Sulev. Gauntlets"
    gear.Sulevia.Legs = "Sulevi. Cuisses"
    gear.Sulevia.Feet = "Sulev. Leggings +2"

    gear.Inyanga = {}
    gear.Inyanga.Head = "Inyanga Tiara"
    gear.Inyanga.Body = "Inyanga Jubbah"
    gear.Inyanga.Hands = "Inyan. Dastanas"
    gear.Inyanga.Legs = "Inyanga Shalwar"
    gear.Inyanga.Feet = "Inyan. Crackows"

    gear.Ayanmo = {}
    gear.Ayanmo.Head = "Aya. Zucchetto"
    gear.Ayanmo.Body = "Ayanmo Corazza"
    gear.Ayanmo.Hands = "Aya. Manopolas"
    gear.Ayanmo.Legs = "Aya. Cosciales"
    gear.Ayanmo.Feet = "Aya. Gambieras"

    gear.Jhakri = {}
    gear.Jhakri.Head = "Jhakri Coronal"
    gear.Jhakri.Body = "Jhakri Robe"
    gear.Jhakri.Hands = "Jhakri Cuffs"
    gear.Jhakri.Legs = "Jhakri Slops"
    gear.Jhakri.Feet = "Jhakri Pigaches"

    gear.Flamma = {}
    gear.Flamma.Head = "Flam. Zucchetto +2"
    gear.Flamma.Body = "Flamma Korazin +2"
    gear.Flamma.Hands = "Flam. Manopolas +2"
    gear.Flamma.Legs = "Flamma Dirs +2"
    gear.Flamma.Feet = "Flam. Gambieras +2"

    gear.Taliah = {}
    gear.Taliah.Head = "Tali'ah Turban"
    gear.Taliah.Body = "Tali'ah Manteel"
    gear.Taliah.Hands = "Tali'ah Gages"
    gear.Taliah.Legs = "Tali'ah Sera."
    gear.Taliah.Feet = "Tali'ah Crackows"

    gear.Mallquis = {}
    gear.Mallquis.Head = "Mallquis Chapeau"
    gear.Mallquis.Body = "Mallquis Saio"
    gear.Mallquis.Hands = "Mallquis Cuffs"
    gear.Mallquis.Legs = "Mallquis Trews"
    gear.Mallquis.Feet = "Mallquis Clogs"

    gear.Adhemar = {}

    gear.Herc = {}

    gear.Val = {}

    gear.TH = {}
    gear.TH.Herc = {}

    gear.Telchine = {}

    gear.Ryou = {}
    gear.Ryou.Feet = {}
    gear.Ryou.Feet.C = { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}
end

--windower.register_event('ipc message', function(message)
    --local msg = message:split(' ')
--
    --if msg[1] and msg[1] == 'weaponskill' and msg[2] and msg[2] == 'Savage_Blade' then
        --windower.chat.input:schedule(4,'//gs c smartws')
        --return
    --end
--end)