local matter_util = require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_util")
require("__Krastorio2__/lib/public/data-stages/matter-util")

if mods["space-exploration"] and mods["Krastorio2"] then
  local value_multiplier = 2 -- straight from space exploration's matter.lua
  local krastorio = _G.krastorio
  matter_util.make_matter_tech("se-kr-matter-vitamelange-processing", "vitamelange-processing", 500)
  krastorio.matter_func.createMatterRecipe(
    {
      item_name = "se-vitamelange",
      minimum_conversion_quantity = 10,
      matter_value = value_multiplier * 7 * 8, -- x8
      conversion_matter_value = value_multiplier * 7,
      energy_required = value_multiplier * 7,
      need_stabilizer = true,
      unlocked_by_technology = "se-kr-matter-vitamelange-processing"
    }
  )
end
