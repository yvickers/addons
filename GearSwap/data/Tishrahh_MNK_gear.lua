function user_job_setup()

	state.OffenseMode:options( 'Melee', 'Acc', 'Defense' )
	state.RangedMode:options( 'Normal', 'Acc' )
	state.WeaponskillMode:options( 'Normal', 'Acc', 'Att', 'Mod' )
	state.CastingMode:options( 'Normal', 'Resistant' )
	state.IdleMode:options( 'Normal', 'PDT', 'MDT', 'Refresh' )

	state.Weapons = M{['description'] = 'Weapon Setup', 'Savage' }
	gear.weapons = {}
	gear.weapons['Savage'] = {
		--main="Kaja Sword",
		--sub="Blurred Knife +1",
		--ranged="Anarchy +2",
	}
	
	state.MainWS = M{['description'] = 'Main Weaponskill', 'Asuran Fists', 'Tornado Kick' }

	state.AutoBoost = M(true, "Auto Boost Mode")

	gear.Artifact = {}
	gear.Artifact.Head = "Temple Crown"
	gear.Artifact.Body = "Temple Cyclas"
	gear.Artifact.Hands = "Temple Gloves"
	gear.Artifact.Legs = "Temple Hose"
	gear.Artifact.Feet = "Temple Gaiters"

	gear.Relic = {}
	gear.Relic.Head = ""
	gear.Relic.Body = ""
	gear.Relic.Hands = ""
	gear.Relic.Legs = ""
	gear.Relic.Feet = ""

	gear.Empyrean = {}
	gear.Empyrean.Head = ""
	gear.Empyrean.Body = ""
	gear.Empyrean.Hands = ""
	gear.Empyrean.Legs = ""
	gear.Empyrean.Feet = ""

	gear.capes = {}


--[[
^   Ctrl
!   Alt
@   Win
#   Apps

--]]

end

function init_gear_sets()
	sets.precast.JA['Boost'] = {
		hands=gear.Artifact.Hands,
	}

	sets.precast.JA['Focus'] = {
		head=gear.Artifact.Head,
	}

	sets.precast.JA['Dodge'] = {
		body=gear.Artifact.Feet,
	}

	sets.precast.JA['Chakra'] = {
		body=gear.Artifact.Body,
	}

	sets.precast.WS = {
		--ammo="",
		--head="",
		--neck="",
		--ear1="",
		--ear2="",
		--body="",
		--hands="",
		--ring1="",
		--ring2="",
		--back="",
		--waist="",
		--legs="",
		--feet="",
	}

	sets.idle = {
		--ammo="",
		--neck="",
		--ear1="",
		--ear2="",
		--ring1="",
		--ring2="",
		--back="",
		--waist="",
		head=gear.Mummu.Head,
		body=gear.Mummu.Body,
		hands=gear.Mummu.Hands,
		legs=gear.Mummu.Legs,
		feet=gear.Mummu.Feet,
	}

	sets.engaged = {
		--neck="",
		--ear1="",
		--ear2="",
		--ring1="",
		--ring2="",
		--back="",
		--waist="",
		head=gear.Mummu.Head,
		body=gear.Mummu.Body,
		hands=gear.Mummu.Hands,
		legs=gear.Mummu.Legs,
		feet=gear.Mummu.Feet,
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
end