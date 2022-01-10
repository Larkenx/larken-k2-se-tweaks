if mods["space-exploration"] and mods["Krastorio2"] then
	if settings.startup["allow-upgrade-singularity-lab"].value then
		-- make singularity lab a direct upgrade over space lab. faster speed, but same
		-- # of modules
		local singularityLab = data.raw["lab"]["kr-singularity-lab"]
		local spaceScienceLab = data.raw["lab"]["se-space-science-lab"]
		if singularityLab then
			singularityLab.researching_speed = 15
			singularityLab.module_specification = {
				max_entity_info_module_icon_rows = 1,
				max_entity_info_module_icons_per_row = 7,
				module_info_icon_shift = {0, 2},
				module_slots = 6
			}
			singularityLab.inputs = spaceScienceLab.inputs
		end
	end
end
