function define_global_sets()
    gear.Reive = {}
    sets.AutoBuff = {}

    sets.craft = {}
    sets.craft.skill = {
        body="Tanner's Apron",
        hands="Tanner's Gloves",
        left_ring="Artificer's Ring",
        right_ring="Craftmaster's Ring",
    }

    sets.craft.skillup = set_combine(sets.craft.skill,{
        head="Midras's Helm +1",
    })

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
    gear.Hiza.Head = "Hiza. Somen +2"
    gear.Hiza.Body = "Hiza. Haramaki +2"
    gear.Hiza.Hands = "Hizamaru Kote +2"
    gear.Hiza.Legs = "Hiza. Hizayoroi +2"
    gear.Hiza.Feet = "Hiza. Sune-Ate +2"

    gear.Sulevia = {}
    gear.Sulevia.Head = "Sulevia's Mask +2"
    gear.Sulevia.Body = "Sulevia's Plate. +2"
    gear.Sulevia.Hands = "Sulev. Gauntlets +2"
    gear.Sulevia.Legs = "Sulevi. Cuisses +2"
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
    gear.Taliah.Head = "Tali'ah Turban +2"
    gear.Taliah.Body = "Tali'ah Manteel +2"
    gear.Taliah.Hands = "Tali'ah Gages +2"
    gear.Taliah.Legs = "Tali'ah Sera. +2"
    gear.Taliah.Feet = "Tali'ah Crackows +2"

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
    gear.TH.Herc = {
        head="Volte Cap",
        legs={ name="Herculean Trousers", augments={'Accuracy+10','Attack+19','"Treasure Hunter"+2','Accuracy+4 Attack+4',}},
        waist="Chaac Belt",
    }

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