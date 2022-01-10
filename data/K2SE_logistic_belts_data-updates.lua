if mods["space-exploration"] and mods["Krastorio2"] then
	local krastorio = _G.krastorio
	if
		krastorio.general.getSafeSettingValue("kr-pipes-and-belts-changes") and
			settings.startup["allow-long-space-underground-belt"].value
	 then
		-- space underground-belt
		local se_space_underground_belt = data.raw["underground-belt"]["se-space-underground-belt"]
		local express_underground_belt = data.raw["underground-belt"]["express-underground-belt"]
		if se_space_underground_belt and express_underground_belt then
			se_space_underground_belt.max_distance = express_underground_belt.max_distance
		end
		local se_space_underground_belt_recipe = data.raw.recipe["se-space-underground-belt"]
		local express_underground_belt_recipe = data.raw.recipe["express-underground-belt"]
		if se_space_underground_belt_recipe and express_underground_belt_recipe then
			se_space_underground_belt_recipe.result_count = express_underground_belt_recipe.result_count
		end
	end
end
