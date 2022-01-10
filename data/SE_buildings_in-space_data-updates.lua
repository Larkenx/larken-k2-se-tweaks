local util = require("__LarkenxK2SETweaks__/data/util")
if mods["space-exploration"] and mods["Krastorio2"] then
	-- K2 Storage Tanks in space
	local tanks = {"kr-fluid-storage-1", "kr-fluid-storage-2"}
	for k, tank in pairs(data.raw["storage-tank"]) do
		if util.has_value(tanks, tank.name) then
			if settings.startup["allow-k2-liquid-tanks-on-space-platform"].value then
				tank.se_allow_in_space = true
			end
		end
	end
	--allow-matter-buildings-in-space
	if settings.startup["allow-matter-buildings-in-space"].value then
		data.raw["assembling-machine"]["kr-matter-assembler"].se_allow_in_space = true
		data.raw["assembling-machine"]["kr-matter-plant"].se_allow_in_space = true
		data.raw["furnace"]["kr-stabilizer-charging-station"].se_allow_in_space = true
	end
end

-- Moon Logic Combinator placeable in Space
local moonLogicCombinator = data.raw["item"]["mlc"]
if moonLogicCombinator then
	moonLogicCombinator.se_allow_in_space = true
end

-- nixie tubes
local nixtube = data.raw["lamp"]["nixie-tube"]
if nixtube then
	nixtube.se_allow_in_space = true
end
local nixtubeSmall = data.raw["lamp"]["nixie-tube-small"]
if nixtubeSmall then
	nixtubeSmall.se_allow_in_space = true
end
local nixtubeAlpha = data.raw["lamp"]["nixie-tube-alpha"]
if nixtubeAlpha then
	nixtubeAlpha.se_allow_in_space = true
end

-- improved combinator
local improvedCombinator = data.raw["container"]["improved-combinator"]
if improvedCombinator then
	improvedCombinator.se_allow_in_space = true
end
