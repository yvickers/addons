function user_job_setup()
	gear.weapons['Default'] = {
		--main="Naegling",
		--sub="Blurred Shield +1",
	}

	state.MainWS = M{['description'] = 'Main Weaponskill', 'Rampage', }
end

function init_gear_sets()
	sets.TreasureHunter = {}
end

function select_default_macro_book()
	set_macro_page(1, 1)
end