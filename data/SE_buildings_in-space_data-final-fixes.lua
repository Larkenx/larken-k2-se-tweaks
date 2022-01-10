if mods["space-exploration"] and mods["Krastorio2"] then
    if settings.startup["allow-matter-buildings-in-space"].value then
        data.raw["assembling-machine"]["kr-matter-assembler"].se_allow_in_space = true
        data.raw["assembling-machine"]["kr-matter-plant"].se_allow_in_space = true
        data.raw["furnace"]["kr-stabilizer-charging-station"].se_allow_in_space = true
    end
end
