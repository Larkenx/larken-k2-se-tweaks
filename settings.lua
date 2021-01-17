data:extend({
    {
        type = "bool-setting",
        name = "allow-naquium-matter-processing",
        setting_type = "startup",
        default_value = true
    }, {
        type = "bool-setting",
        name = "allow-steel-pipe-in-space",
        setting_type = "startup",
        order = "liquid2",
        default_value = true
    }, {
        type = "bool-setting",
        name = "allow-k2-liquid-tanks-on-space-platform",
        setting_type = "startup",
        order = "liquid1",
        default_value = true
    }, -- {
    --     type = "bool-setting",
    --     name = "allow-k2-liquid-tanks-on-spaceship",
    --     setting_type = "startup",
    --     default_value = true
    -- },
    {
        type = "bool-setting",
        name = "allow-long-space-underground-belt",
        setting_type = "startup",
        default_value = true
    }, -- {
    --     type = "bool-setting",
    --     name = "allow-long-underground-space-pipe",
    --     setting_type = "startup",
    --     default_value = true,
    --     order = "space-pipe-1"
    -- },
    {
        type = "int-setting",
        setting_type = "startup",
        order = "liquid3",
        name = "space-pipe-underground-distance",
        default_value = 6,
        minimum_value = 6,
        maximum_value = 20

    }, {
        type = "bool-setting",
        name = "allow-upgrade-singularity-lab",
        setting_type = "startup",
        default_value = true
    }, {
        type = "bool-setting",
        name = "allow-remove-tesseract-from-stabilizer",
        setting_type = "startup",
        order = "stabilizer-1",
        default_value = true
    }, {
        type = "bool-setting",
        name = "allow-remove-stabilizer-for-vulcanite",
        setting_type = "startup",
        order = "stabilizer-3",
        default_value = false
    }, {
        type = "bool-setting",
        name = "allow-stabilizer-less-likely-to-break",
        setting_type = "startup",
        order = "stabilizer-2",
        default_value = true
    }, {
        type = "double-setting",
        setting_type = "startup",
        name = "matter-reconversion-ratio",
        order = "matter-ratio-1",
        default_value = 1.25,
        allowed_values = {1.0, 1.25, 1.5, 1.75, 2.0}
    }, {
        type = "bool-setting",
        name = "allow-se-ore-matter-changes",
        setting_type = "startup",
        order = "matter-ratio-3",
        default_value = true
    }, {
        type = "double-setting",
        setting_type = "startup",
        name = "se-ore-matter-reconversion-ratio",
        order = "matter-ratio-4",
        default_value = 8.0,
        allowed_values = {1.0, 1.25, 1.5, 2.0, 4.0, 8.0}
    }, {
        type = "int-setting",
        setting_type = "startup",
        name = "matter-cube-cost",
        order = "matter-cube-1",
        default_value = 1000,
        allowed_values = {500, 1000, 1500, 2000, 3000}
    }, {
        type = "int-setting",
        setting_type = "startup",
        name = "matter-cube-density",
        order = "matter-cube-2",
        default_value = 1000,
        allowed_values = {500, 1000, 1500, 2000, 3000}
    }, -- SE Matter Ratio Tweaks
    {
        type = "bool-setting",
        name = "allow-hypercooler-on-spaceship",
        setting_type = "startup",
        default_value = true
    }, {
        type = "bool-setting",
        name = "allow-matter-buildings-in-space",
        setting_type = "startup",
        default_value = false
    }
})
