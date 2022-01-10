local matter_util = require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_util")
require("__Krastorio2__/lib/public/data-stages/matter-util")

if mods["space-exploration"] and mods["Krastorio2"] then
  local value_multiplier = 2 -- straight from space exploration's matter.lua
  local krastorio = _G.krastorio
  krastorio.matter_func.createMatterRecipe(
    {
      item_name = "uranium-235",
      minimum_conversion_quantity = 10,
      matter_value = 100,
      conversion_matter_value = 100,
      energy_required = 30,
      need_stabilizer = false,
      only_conversion = true,
      unlocked_by_technology = "kr-matter-uranium-processing"
    }
  )
end
