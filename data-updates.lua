require("__LarkenxK2SETweaks__/data/SE_steam_415-975_data-updates")

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local krastorio
if mods["Krastorio2"] then
    krastorio = _G.krastorio
end

if mods["space-exploration"] and mods["Krastorio2"] then
    if
        krastorio.general.getSafeSettingValue("kr-pipes-and-belts-changes") and
            settings.startup["allow-long-space-underground-belt"].value
     then
        -- space underground-belt
        if data.raw["underground-belt"]["se-space-underground-belt"] then
            data.raw["underground-belt"]["se-space-underground-belt"].max_distance =
                data.raw["underground-belt"]["express-underground-belt"].max_distance
        end
        if data.raw.recipe["se-space-underground-belt"] then
            data.raw.recipe["se-space-underground-belt"].result_count =
                data.raw.recipe["express-underground-belt"].result_count
        end

    -- space underground-pipe
    end

    if data.raw["pipe-to-ground"]["se-space-pipe-to-ground"] then
        for index, connection in pairs(data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections) do
            if connection.max_underground_distance then
                -- see prototypes\vanilla-changes\optional\pipes-and-belts-changes.lua
                local max_distance = 6
                if settings.startup["space-pipe-underground-distance"] then
                    max_distance = settings.startup["space-pipe-underground-distance"].value
                end
                data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections[index].max_underground_distance =
                    max_distance
            end
        end
    end

    -- SE & K2 Fluids Changes
    if data.raw.recipe["se-space-pipe-to-ground"] then
        data.raw.recipe["se-space-pipe-to-ground"].result_count = data.raw.recipe["pipe-to-ground"].result_count
    end

    local tanks = {"kr-fluid-storage-1", "kr-fluid-storage-2"}
    for k, tank in pairs(data.raw["storage-tank"]) do
        if has_value(tanks, tank.name) then
            if settings.startup["allow-k2-liquid-tanks-on-space-platform"].value then
                tank.se_allow_in_space = true
            end
        -- if not settings.startup["allow-k2-liquid-tanks-on-spaceship"].value then
        --     tank.collision_layer = {
        --         "water-tile", "item-layer", "object-layer", "player-layer",
        --         spaceship_collision_layer
        --     }
        -- end
        end
    end

    if settings.startup["allow-matter-buildings-in-space"].value then
        -- 	type = "assembling-machine",
        -- name = "kr-matter-assembler",
        -- type = "assembling-machine",
        -- name = "kr-matter-plant",
        -- type = "furnace",
        -- name = "kr-stabilizer-charging-station",
        data.raw["assembling-machine"]["kr-matter-assembler"].se_allow_in_space = true
        data.raw["assembling-machine"]["kr-matter-plant"].se_allow_in_space = true
        data.raw["furnace"]["kr-stabilizer-charging-station"].se_allow_in_space = true
    end

    if settings.startup["allow-steel-pipe-in-space"].value then
        local steelPipeUnderground = data.raw["pipe-to-ground"]["kr-steel-pipe-to-ground"]
        if steelPipeUnderground then
            steelPipeUnderground.se_allow_in_space = true
        end

        local steelPipe = data.raw["pipe"]["kr-steel-pipe"]
        if steelPipe then
            steelPipe.se_allow_in_space = true
        end
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
