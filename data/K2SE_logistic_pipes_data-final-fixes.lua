if mods["space-exploration"] and mods["Krastorio2"] then
  if settings.startup["allow-steel-pipe-in-space"].value then
    -- Pipes
    data.raw.pipe["pipe"].fast_replaceable_group = nil
    data.raw.pipe["pipe"].next_upgrade = nil

    -- Underground pipes
    data.raw["pipe-to-ground"]["pipe-to-ground"].fast_replaceable_group = nil
    data.raw["pipe-to-ground"]["pipe-to-ground"].next_upgrade = nil
  end
end
