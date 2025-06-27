function define_global_sets()
    gear.Reive = {}
    sets.AutoBuff = {}

    sets.craft = {}
    sets.craft.skill = {
        head="Shaded Specs.",
        body="Goldsmith's Apron",
        left_ring="Artificer's Ring",
        right_ring="Orvail Ring",
    }

    sets.craft.skillup = set_combine(sets.craft.skill,{
        head="Midras's Helm +1",
        right_ring="Orvail Ring",
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
    gear.Sulevia.Head = "Sulevia's Mask"
    gear.Sulevia.Body = "Sulevia's Plate."
    gear.Sulevia.Hands = "Sulev. Gauntlets"
    gear.Sulevia.Legs = "Sulevi. Cuisses"
    gear.Sulevia.Feet = "Sulev. Leggings +2"

    gear.Inyanga = {}
    gear.Inyanga.Head = "Inyanga Tiara +2"
    gear.Inyanga.Body = "Inyanga Jubbah +2"
    gear.Inyanga.Hands = "Inyan. Dastanas +2"
    gear.Inyanga.Legs = "Inyanga Shalwar +2"
    gear.Inyanga.Feet = "Inyan. Crackows +2"

    gear.Ayanmo = {}
    gear.Ayanmo.Head = "Aya. Zucchetto +2"
    gear.Ayanmo.Body = "Ayanmo Corazza +2"
    gear.Ayanmo.Hands = "Aya. Manopolas +2"
    gear.Ayanmo.Legs = "Aya. Cosciales +2"
    gear.Ayanmo.Feet = "Aya. Gambieras +2"

    gear.Jhakri = {}
    gear.Jhakri.Head = "Jhakri Coronal +2"
    gear.Jhakri.Body = "Jhakri Robe +2"
    gear.Jhakri.Hands = "Jhakri Cuffs +2"
    gear.Jhakri.Legs = "Jhakri Slops +2"
    gear.Jhakri.Feet = "Jhakri Pigaches  +2"

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
        waist="Chaac Belt",
    }

    gear.Telchine = {}
    gear.Telchine.Head = {}
    gear.Telchine.Head.Enhancing = { name="Telchine Cap", augments={'Mag. Evasion+24','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Body = {}
    gear.Telchine.Body.Enhancing = { name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Hands = {}
    gear.Telchine.Hands.Enhancing = { name="Telchine Gloves", augments={'Mag. Acc.+21','"Conserve MP"+4','Enh. Mag. eff. dur. +5',}}
    gear.Telchine.Legs = {}
    gear.Telchine.Legs.GEO = { name="Telchine Braconi", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    gear.Telchine.Legs.Enhancing = { name="Telchine Braconi", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Feet = {}
    gear.Telchine.Feet.BRD = { name="Telchine Pigaches", augments={'Mag. Evasion+24','Song spellcasting time -7%','MP+43',}}
    gear.Telchine.Feet.Enhancing = { name="Telchine Braconi", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}

    gear.Vanya = {}
    gear.Vanya.Head = {}
    gear.Vanya.Head.B = { name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
    gear.Vanya.Body = {}
    gear.Vanya.Body.B = { name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
    gear.Vanya.Hands = {}
    gear.Vanya.Hands.B = { name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
    gear.Vanya.Legs = {}
    gear.Vanya.Legs.B = { name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
    gear.Vanya.Feet = {}
    gear.Vanya.Feet.B = { name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}

    gear.Linos = {}
    gear.Linos.Idle = { name="Linos", augments={'Mag. Evasion+14','"Regen"+2','HP+16',}}
    gear.Linos.TP = { name="Linos", augments={'Accuracy+18','"Store TP"+4','Quadruple Attack +3',}}
    gear.Linos.STRWS = { name="Linos", augments={'Attack+14','Weapon skill damage +2%','STR+8',}}
    gear.Linos.CHRWS = { name="Linos", augments={'Attack+15','Weapon skill damage +2%','CHR+8',}}
    gear.Linos.DEXWS = { name="Linos", augments={'Attack+15','Weapon skill damage +2%','DEX+8',}}
    gear.Linos.DEXCrit = { name="Linos", augments={'Attack+15','Crit. hit damage +3%','DEX+8',}}

    gear.Chironic = {}
    gear.Chironic.Head = {}
    gear.Chironic.Head.Refresh = { name="Chironic Hat", augments={'MND+13','Pet: STR+7','"Refresh"+1',}}
    gear.Chironic.Feet = {}
    gear.Chironic.Feet.Refresh = { name="Chironic Slippers", augments={'MND+2','Pet: AGI+2','"Refresh"+1','Accuracy+3 Attack+3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
    
end

windower.register_event('ipc message', function(message)
    local msg = message:split(' ')

    if msg[1] and msg[1] == 'weaponskill' and msg[2] and msg[2] == 'Detonator' then
        windower.chat.input:schedule(4,'//gs c smartws')
        return
    end
end)