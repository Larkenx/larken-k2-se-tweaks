if mods["space-exploration"] and mods["Krastorio2"] then
	local total_matter_capacity = 1000 -- default k2 ingredient count
	local matter_cube_cost = 1000 -- default 1:1 ratio for conversion and deconversion
	if settings.startup["matter-cube-cost"] then
		matter_cube_cost = settings.startup["matter-cube-cost"].value
	end
	if settings.startup["matter-cube-density"] then
		total_matter_capacity = settings.startup["matter-cube-density"].value
	end
	for _, recipe in pairs(data.raw.recipe) do
		if recipe.category == "matter-deconversion" then
			if recipe.ingredients ~= nil then
				for _, ingredient in pairs(recipe.ingredients) do
					if ingredient.name == "matter" then
						if recipe.main_product == "matter-cube" then
							ingredient.amount = total_matter_capacity
							ingredient.catalyst_amount = matter_cube_cost
						end
					end
				end
			end
		end
	end
end