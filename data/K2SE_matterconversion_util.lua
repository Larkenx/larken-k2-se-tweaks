local util = {}
-------------------------------------------------------------------------------
util.make_matter_tech = function(tech_name, tech_image, cost)
	if mods["Krastorio2Assets"] then
		matterIcon = "__Krastorio2Assets__/technologies/backgrounds/matter.png"
	else
		matterIcon = "__Krastorio2__/graphics/technologies/backgrounds/matter.png"
	end
	data:extend(
		{
			{
				type = "technology",
				name = tech_name,
				mod = "K2SETweaks",
				icons = {
					{
						icon = matterIcon,
						icon_size = 128
					},
					{
						icon = "__space-exploration-graphics__/graphics/technology/" .. tech_image .. ".png",
						icon_size = 128,
						scale = 0.5
					}
				},
				effects = {},
				prerequisites = {"kr-matter-processing"},
				order = "g-e-e",
				unit = {
					count = cost,
					ingredients = {
						{"production-science-pack", 1},
						{"utility-science-pack", 1},
						{"matter-tech-card", 1}
					},
					time = 60
				}
			}
		}
	)
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

return util
