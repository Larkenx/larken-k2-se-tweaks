require("__LarkenxK2SETweaks__/data/K2SE_logistic_pipes_data-final-fixes")
require("__LarkenxK2SETweaks__/data/SE_buildings_in-space_data-final-fixes")
require("__LarkenxK2SETweaks__/data/K2SE_buildings_lab.data-final-fixes")
require("__LarkenxK2SETweaks__/data/SE_buildings_on-spaceship_data-final-fixes")
require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_cubes.data-final-fixes")
require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_change_rates.data-final-fixes")

-- for _, recipe in pairs(data.raw.recipe) do
--     if recipe.category == "matter-deconversion" then
--         main_product = util.get_recipe_name(recipe)

--         if main_product then
--             -- log(main_product)
--             if has_value(se_resources, main_product) then
--                 for _, ingredient in pairs(recipe.ingredients) do
--                     if ingredient.name == "matter" then
--                         -- Undo the SE Matter Multiplier of 8X
--                         ingredient.amount =
--                             math.floor(ingredient.amount / se_matter_multiplier)
--                         ingredient.catalyst_amount =
--                             math.floor(ingredient.catalyst_amount /
--                                            se_matter_multiplier)
--                     end
--                 end
--             end
--         else
--             log("no main product found for recipe")
--         end
--     end
-- end
