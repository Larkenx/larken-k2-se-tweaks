local util = require("__LarkenxK2SETweaks__/data/util")
if mods["space-exploration"] and mods["Krastorio2"] then
	-- ===================================================================================================
	-- Space Exploration nerfs by having a re-conversion effectivity of 50% (matter *= 2)
	-- we revert that but still re-nerf a bit (*=1.25)
	-- ===================================================================================================
	local excluded_recipes = {"charged-antimatter-fuel-cell", "matter-cube"}
	local nerf_factor = 1.25
	if settings.startup["matter-reconversion-ratio"] then
		nerf_factor = settings.startup["matter-reconversion-ratio"].value
	end

	for _, recipe in pairs(data.raw.recipe) do
		if recipe.category == "matter-deconversion" then
			if
				recipe.ingredients ~= nil and not has_value(excluded_recipes, util.get_recipe_name(recipe)) and
					recipe.main_product ~= "matter-cube" and
					recipe.main_product ~= "charged-antimatter-fuel-cell" and
					recipe.result ~= "charged-antimatter-fuel-cell"
			 then
				for _, ingredient in pairs(recipe.ingredients) do
					if ingredient.name == "matter" then
						-- Undo the Space Exploration 2x cost
						-- space-exploration-postprocess\prototypes\phase-4\krastorio2\matter.lua
						ingredient.amount = math.floor(ingredient.amount / 2)
						if ingredient.catalyst_amount then
							ingredient.catalyst_amount = math.floor(ingredient.catalyst_amount / 2)
						end
						-- Apply a new debuff based on the provided ratio
						ingredient.amount = math.floor(0.5 + ingredient.amount * nerf_factor)
						if ingredient.catalyst_amount then
							ingredient.catalyst_amount = math.floor(0.5 + ingredient.catalyst_amount * nerf_factor)
						end
					end
				end
			end
		end
	end
	--
	if settings.startup["allow-remove-tesseract-from-stabilizer"].value then
		util.remove_ingredient(data.raw["recipe"]["matter-stabilizer"], "se-naquium-tessaract")
	end
	--
	if settings.startup["allow-remove-stabilizer-for-vulcanite"].value then
		util.remove_ingredient(data.raw["recipe"]["matter-to-se-vulcanite"], "charged-matter-stabilizer")
		util.remove_result(data.raw["recipe"]["matter-to-se-vulcanite"], "matter-stabilizer")
	end
	-- this fix reduces the breaking percentage from 1/100 to 5/1000 for matter deconversion
	if settings.startup["allow-stabilizer-less-likely-to-break"].value then
		for _, recipe in pairs(data.raw.recipe) do
			if recipe.category == "matter-deconversion" then
				if recipe.results then
					for _, result in pairs(recipe.results) do
						if result.name == "matter-stabilizer" then
							result.probability = 0.995
						end
					end
				end
			end
		end
	end
	--
	if settings.startup["allow-se-ore-matter-changes"].value then
		local se_resources = {
			"se-vulcanite",
			"se-cryonite",
			"se-beryllium-ore",
			"se-holmium-ore",
			"se-iridium-ore",
			"se-vitamelange",
			"se-naquium-ore",
			"deadlock-stack-se-vulcanite",
			"deadlock-stack-se-cryonite",
			"deadlock-stack-se-beryllium-ore",
			"deadlock-stack-se-holmium-ore",
			"deadlock-stack-se-iridium-ore",
			"deadlock-stack-se-vitamelange",
			"deadlock-stack-se-naquium-ore"
		}

		local se_matter_ratio = 8.0
		if settings.startup["se-ore-matter-reconversion-ratio"] then
			se_matter_ratio = settings.startup["se-ore-matter-reconversion-ratio"].value
		end

		log("Fixing SE ores matter deconversion & conversion ratios")

		-- Fetch the cost of each matter deconversion ratio for SE resources, then set the conversion ratio of
		-- the matter resources to be that divided by the ratio we've selected (2x, 4x, etc)
		for _, se_resource in pairs(se_resources) do
			local matter_value = nil
			local matter_conversion_recipe = data.raw["recipe"][se_resource .. "-to-matter"]
			local matter_deconversion_recipe = data.raw["recipe"]["matter-to-" .. se_resource]
			log("Tweaking SE Resource matter ratios: " .. se_resource)
			if matter_conversion_recipe ~= nil and matter_deconversion_recipe ~= nil then
				-- Find the total matter value by getting its deconversion matter ingredient
				for _, ingredient in pairs(data.raw["recipe"]["matter-to-" .. se_resource].ingredients) do
					if ingredient.name == "matter" then
						matter_value = ingredient.amount
						log("Cost to create " .. se_resource .. " is " .. matter_value .. " matter")
					end
				end

				-- Set the matter conversion ratio to be what we set in our settings above
				for _, result in pairs(matter_conversion_recipe.results) do
					if result.name == "matter" then
						result.amount = matter_value / se_matter_ratio
						log(
							"New matter gained when converting to matter for " .. se_resource .. " is " .. result.amount
						)
						break
					end
				end
				log("New Recipes for " .. se_resource)
			else
				log("Could not find recipes for resource: " .. se_resource)
			end
		end
	end
end