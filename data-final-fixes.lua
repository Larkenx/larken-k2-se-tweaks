if settings.startup["allow-steel-pipe-in-space"].value then
    -- Pipes
    data.raw.pipe["pipe"].fast_replaceable_group = nil
    data.raw.pipe["pipe"].next_upgrade = nil

    -- Underground pipes
    data.raw["pipe-to-ground"]["pipe-to-ground"].fast_replaceable_group = nil
    data.raw["pipe-to-ground"]["pipe-to-ground"].next_upgrade = nil
end

if settings.startup["allow-upgrade-singularity-lab"].value then
    -- make singularity lab a direct upgrade over space lab. faster speed, but same 
    -- # of modules
    singularityLab = data.raw["lab"]["kr-singularity-lab"]
    spaceScienceLab = data.raw["lab"]["se-space-science-lab"]
    if singularityLab then
        singularityLab.researching_speed = 15
        singularityLab.module_specification =
            {
                max_entity_info_module_icon_rows = 1,
                max_entity_info_module_icons_per_row = 7,
                module_info_icon_shift = {0, 2},
                module_slots = 6
            }
        singularityLab.inputs = spaceScienceLab.inputs
    end
end

if mods["space-exploration"] then
    --[[
	--===================================================================================================
	-- If we use Space Exploration K2 and Deadlock do not use matter-stabilizer stacks
	--===================================================================================================
	if mods["Krastorio2"] then
		for _, recipe in pairs(data.raw.recipe) do
			if recipe.category == "matter-deconversion" then
				for _, ingredient in pairs(recipe.ingredients) do
					if ingredient.name == "deadlock-stack-charged-matter-stabilizer" then
						ingredient.name = "charged-matter-stabilizer"
					end
				end
				if recipe.results then
					for _, result in pairs(recipe.results) do
						if result.name == "deadlock-stack-matter-stabilizer" then
							result.name = "matter-stabilizer"
							result.probability = 0.975
						end
					end
				end
			end
		end
		local list_to_delete = {
			"deadlock-stacks-stack-matter-stabilizer",
			"deadlock-stacks-unstack-matter-stabilizer",
			"StackedRecipe-charge-stabilizer"
		}

		for _, recipe in pairs(list_to_delete) do
			if data.raw.recipe[recipe] then
				data.raw.recipe[recipe].hidden = true
				data.raw.recipe[recipe].enabled = false
			end
		end
	end
    ]] --

    if mods["Krastorio2"] and
        settings.startup["allow-remove-tesseract-from-stabilizer"].value then
        local function remove_ingredient(recipe, name)
            for i = #recipe.ingredients, 1, -1 do
                if recipe.ingredients[i] then
                    for _, value in pairs(recipe.ingredients[i]) do
                        if value == name then
                            table.remove(recipe.ingredients, i)
                        end
                    end
                end
            end
        end
        remove_ingredient(data.raw["recipe"]["matter-stabilizer"],
                          "se-naquium-tessaract")
    end

    -- ===================================================================================================
    -- If we use Space Exploration... unf*ck K2 matter
    -- Space Exploration nerfs by having a re-conversion effectivity of 50% (matter *= 2)
    -- we revert that but still re-nerf a bit (*=1.25)
    -- matter cubing is lossless
    -- ===================================================================================================
    if mods["Krastorio2"] and
        settings.startup["allow-tweak-matter-ratios"].value then
        local nerf_factor = 1.25 -- dieses sollte optimalerweise ein Mod setting sein.
        for _, recipe in pairs(data.raw.recipe) do
            if recipe.category == "matter-deconversion" then
                log("fixed " .. recipe.name)
                for _, ingredient in pairs(recipe.ingredients) do
                    if ingredient.name == "matter" then
                        if recipe.main_product == "matter-cube" then
                            ingredient.amount =
                                math.floor(0.5 + ingredient.amount / 2)
                            ingredient.catalyst_amount =
                                math.floor(0.5 + ingredient.catalyst_amount / 2)
                        else
                            ingredient.amount =
                                math.floor(
                                    0.5 + ingredient.amount / 2 * nerf_factor)
                            if ingredient.catalyst_amount then
                                ingredient.catalyst_amount =
                                    math.floor(
                                        0.5 + ingredient.catalyst_amount / 2 *
                                            nerf_factor)
                            end
                        end
                    end
                end
            end
        end
    end

    -- this fix reduces the breaking percentage from 1/100 to 5/1000 for matter deconversion
    if mods["Krastorio2"] and
        settings.startup["allow-stabilizer-less-likely-to-break"].value then
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
end

if mods["space-exploration"] then
    if mods["Krastorio2"] and
        settings.startup["allow-tweak-matter-ratios-for-se-ores"].value then
        local function has_value(tab, val)
            for index, value in ipairs(tab) do
                if value == val then return true end
            end
            return false
        end
        -----------------------------------------------------------------------------------------------------------------
        -- SE has 8:1 conversion for SE-Resources, this is annoying. change to 2:1
        -----------------------------------------------------------------------------------------------------------------
        local matter_divisor = 4 -- sollte eigentlich ein mod-setting sein
        local se_resources = {
            "se-vulcanite", "se-cryonite", "se-beryllium-ore", "se-holmium-ore",
            "se-iridium-ore", "se-vitamelange", "se-naquium-ore",

            "deadlock-stack-se-vulcanite", "deadlock-stack-se-cryonite",
            "deadlock-stack-se-beryllium-ore", "deadlock-stack-se-holmium-ore",
            "deadlock-stack-se-iridium-ore", "deadlock-stack-se-vitamelange",
            "deadlock-stack-se-naquium-ore"
        }
        -- log(serpent.block(data.raw.recipe, {comment = false, numformat = '%1.8g' } ))
        for _, recipe in pairs(data.raw.recipe) do
            if recipe.category == "matter-deconversion" then
                main_product = recipe.main_product
                if main_product == nil then
                    if recipe.results and recipe.results[0] then
                        main_product = recipe.results[0].name
                    else
                        if recipe.result and recipe.result.name then
                            main_product = recipe.result.name
                        end
                    end
                end

                -- log(serpent.block(recipe, {comment = false, numformat = '%1.8g' } ))
                if main_product then
                    -- log(main_product)
                    if has_value(se_resources, main_product) then
                        for _, ingredient in pairs(recipe.ingredients) do
                            if ingredient.name == "matter" then
                                ingredient.amount =
                                    math.floor(
                                        0.5 + ingredient.amount / matter_divisor)
                                ingredient.catalyst_amount =
                                    math.floor(
                                        0.5 + ingredient.catalyst_amount /
                                            matter_divisor)
                            end
                        end
                        -- log("fixed " .. main_product)
                    end
                else
                    log("no main product found for recipe")
                end
            end
        end
    end
end
