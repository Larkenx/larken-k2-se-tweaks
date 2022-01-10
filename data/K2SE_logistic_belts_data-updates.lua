if mods["space-exploration"] and mods["Krastorio2"] then
	local krastorio = _G.krastorio
	if
		krastorio.general.getSafeSettingValue("kr-pipes-and-belts-changes") and
			settings.startup["allow-long-space-underground-belt"].value
	 then
		-- space underground-belt
		if data.raw["underground-belt"]["se-space-underground-belt"] then
			data.raw["underground-belt"]["se-space-underground-belt"].max_distance =
				data.raw["underground-belt"]["express-underground-belt"].max_distance
		end
		if data.raw.recipe["se-space-underground-belt"] then
			data.raw.recipe["se-space-underground-belt"].result_count =
				data.raw.recipe["express-underground-belt"].result_count
		end
	end
end
