function define_global_sets()
    gear.Reive = {}

    sets.craft = {}
    sets.craft.skill = {
        head="Magnifying Specs.",
        body="Weaver's Apron",
        left_ring="Artificer's Ring",
        right_ring="Craftmaster's Ring",
    }

    sets.craft.skillup = set_combine(sets.craft.skill,{
        head="Midras's Helm +1",
    })

    gear.Meghanada = {}
    gear.Meghanada.Head = ""
    gear.Meghanada.Body = ""
    gear.Meghanada.Hands = ""
    gear.Meghanada.Legs = ""
    gear.Meghanada.Feet = ""

    gear.Mummu = {}
    gear.Mummu.Head = "Mummu Bonnet +2"
    gear.Mummu.Body = "Mummu Jacket +2"
    gear.Mummu.Hands = "Mummu Wrists +2"
    gear.Mummu.Legs = "Mummu Kecks +2"
    gear.Mummu.Feet = "Mummu Gamash. +2"

    gear.Hiza = {}
    gear.Hiza.Head = ""
    gear.Hiza.Body = ""
    gear.Hiza.Hands = ""
    gear.Hiza.Legs = ""
    gear.Hiza.Feet = ""

    gear.Sulevia = {}
    gear.Sulevia.Head = ""
    gear.Sulevia.Body = ""
    gear.Sulevia.Hands = ""
    gear.Sulevia.Legs = ""
    gear.Sulevia.Feet = ""

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
    gear.Jhakri.Feet = "Jhakri Pigaches +2"

    gear.Flamma = {}
    gear.Flamma.Head = ""
    gear.Flamma.Body = ""
    gear.Flamma.Hands = ""
    gear.Flamma.Legs = ""
    gear.Flamma.Feet = ""

    gear.Taliah = {}
    gear.Taliah.Head = "Tali'ah Turban +2"
    gear.Taliah.Body = "Tali'ah Manteel +2"
    gear.Taliah.Hands = "Tali'ah Gages +2"
    gear.Taliah.Legs = "Tali'ah Sera. +2"
    gear.Taliah.Feet = "Tali'ah Crackows +2"

    gear.Mallquis = {}
    gear.Mallquis.Head = "Mallquis Chapeau +2"
    gear.Mallquis.Body = "Mallquis Saio +2"
    gear.Mallquis.Hands = "Mallquis Cuffs +2"
    gear.Mallquis.Legs = "Mallquis Trews +2"
    gear.Mallquis.Feet = "Mallquis Clogs +2"

    gear.Adhemar = {}

    gear.Herc = {}

    gear.Val = {}

    gear.Taeon = {}

    gear.Telchine = {}
    gear.Telchine.Head = {}
    gear.Telchine.Head.Duration={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Body = {}
    gear.Telchine.Body.Duration={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Hands = {}
    gear.Telchine.Hands.Duration={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}}
    gear.Telchine.Legs = {}
    gear.Telchine.Legs.PetRegen = { name="Telchine Braconi", augments={'Pet: DEF+10','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    gear.Telchine.Legs.Duration={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.Feet = {}
    gear.Telchine.Feet.Duration={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}

    gear.Taeon = {}
    gear.Taeon.Head = {}
    gear.Taeon.Body = {}
    gear.Taeon.Hands = {}
    gear.Taeon.Legs = {}
    gear.Taeon.Feet = {}

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

    gear.TH = {}

    sets.AutoBuff = {}
    sets.AutoBuff.doom = {}
end