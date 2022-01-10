if mods["space-exploration"] and mods["Krastorio2"] then
	-- space underground-pipe
	local max_distance = 6
	if settings.startup["space-pipe-underground-distance"] then
		max_distance = settings.startup["space-pipe-underground-distance"].value
	end
	local se_space_pipe_to_ground = data.raw["pipe-to-ground"]["se-space-pipe-to-ground"]
	if se_space_pipe_to_ground then
		for index, connection in pairs(se_space_pipe_to_ground.fluid_box.pipe_connections) do
			if connection.max_underground_distance then
				-- see prototypes\vanilla-changes\optional\pipes-and-belts-changes.lua
				se_space_pipe_to_ground.fluid_box.pipe_connections[index].max_underground_distance = max_distance
			end
		end
	end

	local se_space_pipe_to_ground_recipe = data.raw.recipe["se-space-pipe-to-ground"]
	local pipe_to_ground_recipe = data.raw.recipe["pipe-to-ground"]
	if se_space_pipe_to_ground_recipe and pipe_to_ground_recipe then
		se_space_pipe_to_ground_recipe.result_count = pipe_to_ground_recipe.result_count
	end

	if settings.startup["allow-steel-pipe-in-space"].value then
		local steelPipeUnderground = data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"]
		if steelPipeUnderground then
			steelPipeUnderground.se_allow_in_space = true
		end

		local steelPipe = data.raw["pipe"]["kr-steel-pipe"]
		if steelPipe then
			steelPipe.se_allow_in_space = true
		end
	end
end
