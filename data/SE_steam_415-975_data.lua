if mods["space-exploration"] and mods["Krastorio2"] then
  -- really SE and K2 or just SE ?
  local data_util = require("__space-exploration__/data_util")
  local heat_capacity = data_util.string_to_number(data.raw.fluid.steam.heat_capacity)
  local boiler_power = 5000000
  local efficiency = 0.9

  data:extend(
    {
      {
        type = "recipe",
        name = "se-electric-boiling-steam-415",
        results = {
          {
            type = "fluid",
            name = "steam",
            amount = 100,
            temperature = 415
          }
        },
        enabled = false,
        energy_required = 2.5 * (415 - 15) * 100 * heat_capacity / boiler_power / efficiency,
        ingredients = {{type = "fluid", name = "water", amount = 100}},
        subgroup = "fluid-recipes",
        requester_paste_multiplier = 1,
        always_show_made_in = false,
        category = "se-electric-boiling",
        order = "a-a-b-c"
      },
      {
        type = "recipe",
        name = "se-electric-boiling-steam-975",
        results = {
          {
            type = "fluid",
            name = "steam",
            amount = 100,
            temperature = 975
          }
        },
        enabled = false,
        energy_required = 2.5 * (975 - 15) * 100 * heat_capacity / boiler_power / efficiency,
        ingredients = {{type = "fluid", name = "water", amount = 100}},
        subgroup = "fluid-recipes",
        requester_paste_multiplier = 1,
        always_show_made_in = false,
        category = "se-electric-boiling",
        order = "a-a-b-c"
      }
    }
  )
end
