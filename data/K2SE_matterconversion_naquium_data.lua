local matter_util = require("__LarkenxK2SETweaks__/data/K2SE_matterconversion_util")
require("__Krastorio2__/lib/public/data-stages/matter-util")

if mods["space-exploration"] and mods["Krastorio2"] then
  local value_multiplier = 2 -- straight from space exploration's matter.lua
  local krastorio = _G.krastorio
  if settings.startup["allow-naquium-matter-processing"].value then
    matter_util.make_matter_tech("se-kr-matter-naquium-processing", "naquium-processing", 1000)
    krastorio.matter_func.createMatterRecipe(
      {
        item_name = "se-naquium-ore",
        minimum_conversion_quantity = 10,
        matter_value = value_multiplier * 20 * 8, -- 40 * 8
        conversion_matter_value = value_multiplier * 20, -- 400
        energy_required = value_multiplier * 20,
        need_stabilizer = true,
        unlocked_by_technology = "se-kr-matter-naquium-processing"
      }
    )
  end
end
