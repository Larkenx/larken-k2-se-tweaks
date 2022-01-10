if mods["space-exploration"] and mods["Krastorio2"] then
	if settings.startup["allow-hypercooler-on-spaceship"].value then
		local allowed_collision_mask_values = {
			"water-tile",
			"ground-tile",
			"item-layer",
			"object-layer",
			"player-layer"
		}
		-- remove the spaceship collision layer from the hypercooler
		data.raw["assembling-machine"]["se-space-hypercooler"].collision_mask = allowed_collision_mask_values
		data.raw["assembling-machine"]["se-space-hypercooler"].se_allow_in_space = true
	end
end

if mods["space-exploration"] and mods["Krastorio2"] then
	if settings.startup["allow-hypercooler-on-spaceship"].value then
		-- in addition, the particle accelerator & thermal radiator recipes get disabled when grounded. causes some issues
		-- when landing because it can delete ingredients currently active
		local defaultSpaceRadiator = data.raw["assembling-machine"]["se-space-radiator"]
		local groundedSpaceRadiator = data.raw["assembling-machine"]["se-space-radiator-grounded"]
		groundedSpaceRadiator.crafting_categories = defaultSpaceRadiator.crafting_categories
		local defaultSpaceRadiator2 = data.raw["assembling-machine"]["se-space-radiator-2"]
		local groundedSpaceRadiator2 = data.raw["assembling-machine"]["se-space-radiator-2-grounded"]
		groundedSpaceRadiator2.crafting_categories = defaultSpaceRadiator2.crafting_categories
	end
end

if mods["space-exploration"] and mods["Krastorio2"] then
	if settings.startup["allow-hypercooler-on-spaceship"].value then
		-- in addition, the particle accelerator & thermal radiator recipes get disabled when grounded. causes some issues
		-- when landing because it can delete ingredients currently active

		--particle accelerator
		local defaultAccelerator = data.raw["assembling-machine"]["se-space-particle-accelerator"]
		local groundedAccelerator = data.raw["assembling-machine"]["se-space-particle-accelerator-grounded"]
		groundedAccelerator.crafting_categories = defaultAccelerator.crafting_categories
	end
end