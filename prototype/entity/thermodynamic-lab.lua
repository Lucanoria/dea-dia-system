local lab = table.deepcopy(data.raw["lab"]["lab"])

data.raw.quality["uncommon"].science_pack_drain_multiplier = 0.9
data.raw.quality["rare"].science_pack_drain_multiplier = 0.8
data.raw.quality["epic"].science_pack_drain_multiplier = 0.7
data.raw.quality["legendary"].science_pack_drain_multiplier = 0.5
lab.uses_quality_drain_modifier = true
lab.researching_speed = 2

lab.allowed_effects = { "consumption", "speed", "productivity", "pollution" }

lab.collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } }
lab.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

lab.working_sound.sound.filename = "__base__/sound/electric-furnace.ogg"
lab.working_sound.sound.volume = 3.0

lab.surface_conditions = {
    {
        max = 400,
        min = 100,
        property = "pressure"
    }
}
lab.science_pack_drain_rate_percent = 70

lab.name = "thermodynamics-lab"
lab["include_all_lab_science"] = true

lab.off_animation = {
    layers = {
        {
            animation_speed = 0.2,
            filename = "__dea-dia-system__/graphics/entity/thermodynamics-laboratory/thermodynamics-laboratory.png",
            frame_count = 50,
            width = 2560 / 8,
            height = 2240 / 7,
            line_length = 8,
            scale = 0.5
        },
        {
            draw_as_shadow = true,
            filename =
            "__dea-dia-system__/graphics/entity/thermodynamics-laboratory/thermodynamics-laboratory-shadow.png",
            frame_count = 50,
            height = 3200 / 8,
            width = 4800 / 8,
            line_length = 8,
            scale = 0.5,
            shift = {
                1.234375,
                0.65625
            }
        }
    }
}
lab.module_slots = 4

lab.on_animation = {
    layers = {
        {
            animation_speed = 0.2,
            filename = "__dea-dia-system__/graphics/entity/thermodynamics-laboratory/thermodynamics-laboratory.png",
            frame_count = 50,
            width = 2560 / 8,
            height = 2240 / 7,
            line_length = 8,
            scale = 0.5,

        },
        {
            animation_speed = 0.2,
            filename =
            "__dea-dia-system__/graphics/entity/thermodynamics-laboratory/thermodynamics-laboratory-emission.png",
            frame_count = 50,
            width = 2560 / 8,
            height = 2240 / 7,
            line_length = 8,
            scale = 0.5,
            draw_as_glow = true,
        },
        {
            draw_as_shadow = true,
            filename =
            "__dea-dia-system__/graphics/entity/thermodynamics-laboratory/thermodynamics-laboratory-shadow.png",
            frame_count = 50,
            height = 3200 / 8,
            width = 4800 / 8,
            line_length = 8,
            scale = 0.5,
            shift = {
                1.234375,
                0.65625
            },

        }
    }
}
lab.minable = { mining_time = 0.5, results = { { type = "item", name = "thermodynamics-lab", amount = 1 } } }
lab.heating_energy = "10000kW"

data:extend {
    lab,
    {
        default_import_location = "lemures",
        type = "item",
        name = "thermodynamics-lab",
        icon = "__dea-dia-system__/graphics/icon/thermodynamics-lab.png",
        icon_size = 64,
        place_result = "thermodynamics-lab",
        subgroup = "production-machine",
        stack_size = 50,
        order = "z[z-thermodynamics-lab]",
        scale = 0.5,
    }, {
    type = "recipe",
    name = "thermodynamics-lab",
    enabled = false,
    ingredients = {
        { type = "item", name = "rhenium-plate",  amount = 5 },
        { type = "item", name = "thorium",          amount = 1 },
        { type = "item", name = "electric-furnace", amount = 2 },
        { type = "item", name = "lab",              amount = 3 },
        { type = "item", name = "processing-unit",  amount = 3 },
    },
    results = {
        { type = "item", name = "thermodynamics-lab", amount = 1 },
    }
}, {
    type = "technology",
    lignumis_skip_science_packs = true,
    name = "thermodynamics-lab",
    prerequisites = {
        "thermodynamic-science-pack",
        "thorium-processing"
    },
    icon = "__dea-dia-system__/graphics/icon/thermodynamics-lab-tech-icon.png",
    icon_size = 256,
    unit = {
        ingredients = {
            { "automation-science-pack",    1 },
            { "logistic-science-pack",      1 },
            { "chemical-science-pack",      1 },
            { "production-science-pack",    1 },
            { "utility-science-pack",       1 },
            { "space-science-pack",         1 },
            { "insulation-science-pack",    1 },
            { "thermodynamic-science-pack", 1 }
        },
        time = 60,
        count = 1000,
    },
    effects = {
        {
            type   = "unlock-recipe",
            recipe = "thermodynamics-lab"
        }
    }
}
}
