local working_visualisations = {
    {
        always_draw = true,
        animation = {
            stripes = {
                {
                    filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-hr-animation-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                },
                {
                    filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-hr-animation-2.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                }
            },
            priority = "high",
            width = 2720 / 8,
            height = 2840 / 8,
            frame_count = 8 * 8 + 8 * 8,
            animation_speed = 1,
            scale = 0.55,
            run_mode = "forward",
            flags = { "no-scale" }
        },
    },
    {
        always_draw = true,
        animation = {
            stripes = {
                {
                    filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-hr-emission-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                },
                {
                    filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-hr-emission-2.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                }
            },
            priority = "high",
            width = 2720 / 8,
            height = 2840 / 8,
            frame_count = 8 * 8 + 8 * 8,
            animation_speed = 1,
            scale = 0.55,
            run_mode = "forward",
            draw_as_light = true,
            flags = { "no-scale" }
        },
    },
    {
        always_draw = true,
        animation = {
            filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-hr-shadow.png",
            priority = "high",
            width = 600,
            height = 400,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            draw_as_shadow = true,
        },
    },
    {
        fadeout = true,
        constant_speed = true,
        light = {
            intensity = 0.65,
            size = 10,
            color = { r = 1, g = 1, b = 0.75 },
        },
    },
}

data:extend {

    {
        type = "assembling-machine",
        name = "prosephina-greenhouse",
        icon = "__dea-dia-system__/graphics/icon/greenhouse-icon.png",
        icon_size = 64,
        open_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].open_sound),
        close_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].close_sound),
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 0.5, results = { { type = "item", name = "prosephina-greenhouse", amount = 1 } } },
        max_health = 300,
        resistances = {
            { type = "physical", percent = 50 },
            { type = "fire",     percent = 100 },
            { type = "impact",   percent = 80 },
        },
        dying_explosion = "big-explosion",
        heating_energy = "100kW",
        module_slots = 5,
        allowed_effects = { "consumption", "productivity", "pollution", "quality" },
        collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },

        effect_receiver = {},
        forced_symetry = "vertical",
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                volume = 1000,
                pipe_connections = {
                    { flow_direction = "input-output", direction = defines.direction.south, position = { -1, 2 } },
                    { flow_direction = "input-output", direction = defines.direction.north, position = { -1, -2 } }
                }
            },
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                volume = 1000,
                pipe_connections = {
                    { flow_direction = "input-output", direction = defines.direction.south, position = { 1, 2 } },
                    { flow_direction = "input-output", direction = defines.direction.north, position = { 1, -2 } } }
            }
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        perceived_performance = { minimum = 0.25, performance_to_activity_rate = 20.0, maximum = 5 },
        crafting_categories = {
            "hydroponics"
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
        energy_usage = "600W",
        collision_mask = { layers = { ["item"] = true, ["object"] = true, ["player"] = true } },
        graphics_set = {
            idle_animation = working_visualisations[1].animation,
            working_visualisations = working_visualisations,
            frozen_patch = {
                filename = "__dea-dia-system__/graphics/entity/greenhouse/greenhouse-frozen.png",
                priority = "high",
                width = 2720 / 8,
                height = 2840 / 8,
                shift = util.by_pixel(0, 2),
                scale = 0.5
            }
        }
    }, {
    default_import_location = "prosephina",
    type = "item",
    name = "prosephina-greenhouse",
    icon = "__dea-dia-system__/graphics/icon/greenhouse-icon.png",
    icon_size = 64,
    place_result = "prosephina-greenhouse",
    subgroup = "agriculture",
    order = "d[greenhouse]",
    stack_size = 50,
    scale = 0.5,
}, {
    type = "recipe",
    name = "prosephina-greenhouse",
    enabled = false,
    ingredients = {
        { type = "item", name = "iron-plate",         amount = 5 },
        { type = "item", name = "rich-soil",          amount = 10 },
        { type = "item", name = "electronic-circuit", amount = 3 },
    },
    results = {
        { type = "item", name = "prosephina-greenhouse", amount = 1 },
    }
}, {
    type = "recipe",
    name = "prosephina-water-cleaning",
    enabled = false,
    energy_required = 1,
    ingredients = {
        { type = "fluid", name = "mineral-water", amount = 400 }
    },
    category = "chemistry",
    results = {
        { type = "fluid", name = "water", amount = 390 }
    }

}, {
    type = "technology", lignumis_skip_science_packs = true, name = "prosephina-greenhouse",
    research_trigger = {
        type = "mine-entity",
        entity = "rich-soil"
    },
    prerequisites = {
        "planet-discovery-prosephina"
    },
    icon = "__dea-dia-system__/graphics/icon/greenhouse-tech-icon.png",
    icon_size = 256,
    effects = {
        {
            type   = "unlock-recipe",
            recipe = "prosephina-greenhouse"
        },
        {
            type   = "unlock-recipe",
            recipe = "soil-leeching-iron"
        },
        {
            type   = "unlock-recipe",
            recipe = "soil-leeching-copper"
        },
        {
            type   = "unlock-recipe",
            recipe = "prosephina-water-cleaning"
        },
        {
            type = "unlock-recipe",
            recipe = "soil-root-growing"
        }

    }
}

}
