local matter_util = require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_util")
require("__Krastorio2__/lib/public/data-stages/matter-util")

if mods["space-exploration"] and mods["Krastorio2"] then
  local value_multiplier = 2 -- straight from space exploration's matter.lua
  local krastorio = _G.krastorio
  -- ToDo: needs it's own tech, as tritium unlock is much later than uranium.
  krastorio.matter_func.createMatterRecipe(
    {
      item_name = "tritium",
      minimum_conversion_quantity = 10,
      matter_value = 20,
      conversion_matter_value = 20,
      only_conversion = true,
      energy_required = 20,
      need_stabilizer = true,
      unlocked_by_technology = "kr-matter-uranium-processing"
    }
  )
end
