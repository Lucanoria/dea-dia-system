local working_visualisations = {
    {
        always_draw = true,
        animation = {
            stripes = {
                {
                    filename = "__dea-dia-system__/graphics/entity/convector/convector-hr-animation-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                },
                {
                    filename = "__dea-dia-system__/graphics/entity/convector/convector-hr-animation-2.png",
                    width_in_frames = 8,
                    height_in_frames = 2
                }
            },
            priority = "high",
            width = 2880 / 8,
            height = 2800 / 8,
            frame_count = 8 * 8 + 8 * 2,
            animation_speed = 1,
            scale = 0.5,
            run_mode = "forward",
            flags = { "no-scale" }
        },
    },
    {
        always_draw = true,
        animation = {
            stripes = {
                {
                    filename = "__dea-dia-system__/graphics/entity/convector/convector-hr-animation-emission-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                },
                {
                    filename = "__dea-dia-system__/graphics/entity/convector/convector-hr-animation-emission-2.png",
                    width_in_frames = 8,
                    height_in_frames = 2
                }
            },
            priority = "high",
            width = 2880 / 8,
            height = 2800 / 8,
            frame_count = 8 * 8 + 8 * 2,
            animation_speed = 1,
            scale = 0.5,
            run_mode = "forward",
            draw_as_glow = true,
            flags = { "no-scale" }
        },
    },
    {
        always_draw = true,
        animation = {
            filename = "__dea-dia-system__/graphics/entity/convector/convector-hr-shadow.png",
            priority = "high",
            width = 600,
            height = 400,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            draw_as_shadow = true,
        },
    }
}

data:extend {
    {
        type = "assembling-machine",
        name = "prosephina-convector",
        icon = "__dea-dia-system__/graphics/icon/convector-icon.png",
        icon_size = 64,
        open_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].open_sound),
        close_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].close_sound),
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 0.5, results = { { type = "item", name = "prosephina-convector", amount = 1 } } },
        max_health = 300,
        forced_symetry = "vertical",
        resistances = {
            { type = "physical", percent = 50 },
            { type = "fire",     percent = 100 },
            { type = "impact",   percent = 80 },
        },
        dying_explosion = "big-explosion",
        module_slots = 5,
        allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
        collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        effect_receiver = { base_effect = { productivity = 0.5 } },
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "input", position = { 1.9, 1.9 } } },
                secondary_draw_orders = { north = -1 },
            }
        },
        perceived_performance = { minimum = 0.25, performance_to_activity_rate = 20.0, maximum = 5 },
        off_when_no_fluid_recipe = true,
        crafting_categories = {
            "heating", "heating-or-chemistry", "bending", "heating-or-assembling", "electronics-with-fluid","heating-or-metallurgy"
        },
        scale_entity_info_icon = true,
        impact_category = data.raw["assembling-machine"]["electromagnetic-plant"].impact_category,
        idle_sound = { filename = "__base__/sound/idle1.ogg" },
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 6,
            }
        },
        icon_draw_specification = { scale = 1.75, shift = { 0, -0.3 } },
        energy_usage = "300kW",
        collision_mask = { layers = { ["item"] = true, ["object"] = true, ["player"] = true } },
        graphics_set = {
            idle_animation = working_visualisations[1].animation,
            working_visualisations = working_visualisations
        }
    }, {
    default_import_location = "prosephina",
    type = "item",
    name = "prosephina-convector",
    icon = "__dea-dia-system__/graphics/icon/convector-icon.png",
    icon_size = 64,
    place_result = "prosephina-convector",
    subgroup = "production-machine",
    order = "d[convector]",
    stack_size = 50,
    scale = 0.5,
}, {
    type = "recipe",
    name = "prosephina-convector",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "rubber",               amount = 5 },
        { type = "item", name = "electric-engine-unit", amount = 5 },
        { type = "item", name = "electronic-circuit",   amount = 3 },
    },
    category = "basic-crafting",
    results = {
        { type = "item", name = "prosephina-convector", amount = 1 },
    }
}, {type = "technology",lignumis_skip_science_packs=true,    name = "prosephina-convector",
    prerequisites = {
        "insulation-science-pack", "slimeweed-material-processing"
    },
    icon = "__dea-dia-system__/graphics/icon/convector-tech-icon.png",
    icon_size = 256,
    unit = {
        ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "insulation-science-pack", 1 } },
        time = 10,
        count = 20,
    },
    effects = {
        {
            type   = "unlock-recipe",
            recipe = "prosephina-convector"
        }
    }
}
}
