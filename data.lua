require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_vitamelange_data")
require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_naquium_data")
require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_tritium_data")
require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_uranium_data")
require("__LarkenxK2SETweaks__/data/SE_steam_415-975_data")

local matter_util = require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_util")
require("__Krastorio2__/lib/public/data-stages/matter-util")
-- this multiplayer comes straight from space exploration's matter.lua. same as holm
local value_multiplier = 2
local krastorio
if mods["Krastorio2"] then
    krastorio = _G.krastorio
end

if mods["space-exploration"] and mods["Krastorio2"] then

end
--[[matter_func.createMatterRecipe(args) {
  item_name = a, -- (string) the name of raw product.
  minimum_conversion_quantity = b, -- (integer) the quantity of item necessary to make one conversion, is also the returned quantity from one deconversion.
  matter_value = c, -- (integer) how much matter is gained by conversion and necessary to create the item from matter(minimum_conversion_quantity corresponds to matter_value).
  conversion_matter_value = d, -- (optional)(integer) Different value from the matter_value of the item, that specify the matter gained by converting this item to matter (used when wanted different values on conversions).
  return_item = e, -- (optional)(string) if the return item from the decoversion(matter to item) is different from the first one.
  unlocked_by_technology = f, -- (optional)(string) what technology(the name) unlock the recipes, if isn't setted will be the first that make access to matter conversions.
  energy_required = g, -- (optional)(integer) how much time need the conversion.
  only_conversion = h, -- (optional)(boolean) if this param is true will be added only the recipe to get matter from the item, but not the deconversion from matter.
  only_deconversion = i, -- (optional)(boolean) if this param is true will be added only the recipe to get the item(or return_item) from matter, but not the conversion to matter.
  need_stabilizer = l, (optional)(boolean) if the item need stabilizer to be deconverted from matter to the original item(or return_item).
  allow_productivity = m, (optional)(boolean) if true, productivity modules can be used on de-conversion from matter (matter->item).
}
]]
