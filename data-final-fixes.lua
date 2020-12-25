-- Pipes
data.raw.pipe["pipe"].fast_replaceable_group = nil
data.raw.pipe["pipe"].next_upgrade = nil

-- Underground pipes
data.raw["pipe-to-ground"]["pipe-to-ground"].fast_replaceable_group = nil
data.raw["pipe-to-ground"]["pipe-to-ground"].next_upgrade = nil


-- make singularity lab a direct upgrade over space lab. faster speed, but same 
-- # of modules
singularityLab = data.raw["lab"]["kr-singularity-lab"]
spaceScienceLab = data.raw["lab"]["se-space-science-lab"]
if singularityLab then
    singularityLab.researching_speed = 15
    singularityLab.module_specification = {
        max_entity_info_module_icon_rows = 1,
        max_entity_info_module_icons_per_row = 7,
        module_info_icon_shift = { 0, 2 },
        module_slots = 6
    }
    singularityLab.inputs = spaceScienceLab.inputs
end