if mods["space-exploration"] and mods["Krastorio2"] then
	-- space underground-pipe
	if data.raw["pipe-to-ground"]["se-space-pipe-to-ground"] then
		for index, connection in pairs(data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections) do
			if connection.max_underground_distance then
				-- see prototypes\vanilla-changes\optional\pipes-and-belts-changes.lua
				local max_distance = 6
				if settings.startup["space-pipe-underground-distance"] then
					max_distance = settings.startup["space-pipe-underground-distance"].value
				end
				data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections[index].max_underground_distance =
					max_distance
			end
		end
	end

	if data.raw.recipe["se-space-pipe-to-ground"] then
		data.raw.recipe["se-space-pipe-to-ground"].result_count = data.raw.recipe["pipe-to-ground"].result_count
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