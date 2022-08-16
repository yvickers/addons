FirstHit = {}
-- Tracking vars for FirstHit.
FirstHit.tagged_mobs = T{}
FirstHit.last_player_target_index = 0

function first_hit_hit(new_index)
	if player.status == 'Engaged' and not FirstHit.tagged_mobs[player.target.id] then
		first_hit_debug( 'First Hit on ' .. new_index )
		if _G['user_first_hit'] then
			user_first_hit( new_index )
		end
		if _G['job_first_hit'] then
			job_first_hit( new_index )
		end
		--windower.send_command( '//send Tishrahh //dia ' .. new_index )
	end
end

function first_hit_debug(message)
	--windower.chat.input( '/echo ' .. message )
end

-- On any action event, mark mobs that we tag. Also, update the last time tagged mobs were acted on.
function first_hit_action(action)
	--add_to_chat(123,'cat='..action.category..',param='..action.param)
	-- If player takes action, adjust tagging information
	if action.actor_id == player.id then
		for index,target in pairs(action.targets) do
			if not FirstHit.tagged_mobs[target.id] then
				first_hit_hit( target.id )
				first_hit_debug('Mob '..target.id..' hit. Adding to tagged mobs table.')
	        end
	        FirstHit.tagged_mobs[target.id] = os.time()
	    end
	elseif FirstHit.tagged_mobs[action.actor_id] then
	    -- If mob acts, keep an update of last action time for bookkeeping
	    FirstHit.tagged_mobs[action.actor_id] = os.time()
	else
	    -- If anyone else acts, check if any of the targets are our tagged mobs
	    for index,target in pairs(action.targets) do
	        if FirstHit.tagged_mobs[target.id] then
				FirstHit.tagged_mobs[target.id] = os.time()
	        end
	    end
	end
    
    first_hit_clean_up_tagged_mobs()
end

-- This function removes mobs from our tracking table when they die.
function first_hit_incoming_chunk(id, data, modified, injected, blocked)
    if id == 0x29 then
		local target_id = data:unpack('I',0x09)
		local message_id = data:unpack('H',0x19)%32768

		-- Remove mobs that die from our tagged mobs list.
		if FirstHit.tagged_mobs[target_id] then
			-- 6 == actor defeats target
			-- 20 == target falls to the ground
			if message_id == 6 or message_id == 20 then
				first_hit_debug( 'Tagged mob has died ' .. target_id )
				FirstHit.tagged_mobs[target_id] = nil
			end
		end
    end
end

function first_hit_clean_up_tagged_mobs()
	-- If it's been more than 3 minutes since an action on or by a tagged mob,
	-- remove them from the tagged mobs list.
	local current_time = os.time()
	local remove_mobs = S{}
	-- Search list and flag old entries.
	for target_id,action_time in pairs(FirstHit.tagged_mobs) do
		local time_since_last_action = current_time - action_time
		if time_since_last_action > 180 then
			remove_mobs:add(target_id)
		end
	end
	-- Clean out mobs flagged for removal.
	for mob_id,_ in pairs(remove_mobs) do
		FirstHit.tagged_mobs[mob_id] = nil
	end
end

-- Clear out the entire tagged mobs table when zoning.
function first_hit_zone_change(new_zone, old_zone)
	FirstHit.tagged_mobs:clear()
end

-- Register events
windower.raw_register_event('action', first_hit_action )
windower.raw_register_event('incoming chunk', first_hit_incoming_chunk )
windower.raw_register_event('zone change', first_hit_zone_change )