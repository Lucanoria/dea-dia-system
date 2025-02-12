-- burner asembler combined with a metalurgical tool.
-- the default special recipe is steel.
-- from other mods it gets cobalt and tungsten carbide.

local name = "mechanical-forge"

local pipe_pictures = {
    north = {
      filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-k-pipe-N.png",
      priority = "extra-high",
      width = 71,
      height = 38,
      shift = util.by_pixel(2.25, 13.5),
      scale = 0.5,
    },
    east = {
      filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-k-pipe-E.png",
      priority = "extra-high",
      width = 42,
      height = 76,
      shift = util.by_pixel(-24.5, 1),
      scale = 0.5,
    },
    south = {
      filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-k-pipe-S.png",
      priority = "extra-high",
      width = 88,
      height = 61,
      shift = util.by_pixel(0, -31.25),
      scale = 0.5,
    },
    west = {
      filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-k-pipe-W.png",
      priority = "extra-high",
      width = 39,
      height = 73,
      shift = util.by_pixel(25.75, 1.25),
      scale = 0.5,
    },
  }

local working_visualisations = {
    {
        always_draw = true,
        animation =  {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine.png",
            priority = "high",
            width = 320,
            height = 320,
            scale = 0.5,
            frame_count = 1,
            repeat_count = 32,
            animation_speed = 0.25,
            shift = { 0, 0 }
        }
    },{
        always_draw = true,
        animation =  {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-w1.png",
            priority = "high",
            scale = 0.5,
            width = 128,
            height = 144,
            shift = { -1.02, 0.29 },
            frame_count = 32,
            line_length = 8,
            animation_speed = 0.1
        },
    },{
        always_draw = true,
        animation =   {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-steam.png",
            priority = "high",
            scale = 0.5,
            width = 80,
            height = 81,
            shift = { -1.2, -2.1 },
            frame_count = 32,
            line_length = 8,
            animation_speed = 1.5
        },
    },{
        always_draw = true,
        animation =  {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-sh.png",
            priority = "high",
            scale = 0.5,
            width = 346,
            height = 302,
            shift = { 0.32, 0.12 },
            frame_count = 1,
            repeat_count = 32,
            animation_speed = 0.1,
            draw_as_shadow = true
        },
    },{
        always_draw = true,
        animation =  {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-w2.png",
            priority = "high",
            scale = 0.5,
            width = 37,
            height = 25,
            frame_count = 8,
            line_length = 4,
            repeat_count = 4,
            animation_speed = 0.1,
            shift = { 0.17, -1.445 }
        },
    },{
        always_draw = true,
        animation = {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-w3.png",
            priority = "high",
            scale = 0.5,
            width = 23,
            height = 15,
            frame_count = 8,
            line_length = 4,
            repeat_count = 4,
            animation_speed = 0.1,
            shift = { 0.93, -2.05 }
        },
    },{
        always_draw = true,
        animation =  {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-w3.png",
            priority = "high",
            scale = 0.5,
            width = 23,
            height = 15,
            frame_count = 8,
            line_length = 4,
            repeat_count = 4,
            animation_speed = 0.1,
            shift = { 0.868, -0.082 }
        },
    },{
        always_draw = true,
        animation =   {
            filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-w3.png",
            priority = "high",
            scale = 0.5,
            width = 23,
            height = 15,
            frame_count = 8,
            line_length = 4,
            repeat_count = 4,
            animation_speed = 0.1,
            shift = { 0.868, 0.552 }
        },
    },
}

data:extend({
    {
        type = "assembling-machine",
        name = name,
        icon = "__dea-dia-system__/graphics/icon/mechanical-forge.png",
        icon_size = 64,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { hardness = 0.2, mining_time = 0.5, result = name },
        max_health = 150,
        corpse = "medium-remnants",
        heating_energy = "0W",
        module_slots = 5,
        allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
        dying_explosion = "big-explosion",
        collision_box = { { -2.25, -2.25 }, { 2.25, 2.25 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        graphics_set = {
            working_visualisations = working_visualisations
        },
        working_sound = {
            sound = {
                {
                    filename = "__dea-dia-system__/sound/advanced-assembling-machine.ogg",
                    volume = 0.5,
                },
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
            apparent_volume = 1.5,
            max_sounds_per_type = 3,
            fade_in_ticks = 10,
            fade_out_ticks = 30,
        },
        idle_sound = { filename = "__base__/sound/idle1.ogg" },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        crafting_categories = { "crafting","crafting-with-fluid","heating-or-assembling" },
        source_inventory_size = 1,
        result_inventory_size = 2,
        crafting_speed = 1.4,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = pipe_pictures,
                pipe_covers = pipecoverspictures(),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -2 } } },
                secondary_draw_orders = { north = -1 },
              }
        },
        energy_source =
        {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = .6,
--            usage_priority = "secondary-input",
            fuel_inventory_size = 1,
            emissions_per_minute = { pollution = 2 },
        },
        water_reflection = {
            pictures = {
                filename = "__dea-dia-system__/graphics/entity/mechanical-forge/advanced-assembling-machine-reflection.png",
                priority = "extra-high",
                width = 70,
                height = 50,
                shift = util.by_pixel(0, 40),
                variation_count = 1,
                scale = 5,
            },
            rotate = false,
            orientation_to_variation = false,
        },
        energy_usage = "50kW",
        ingredient_count = 4
    }, {
        default_import_location = "lemures",
        type = "item",
        name = name,
        icon = "__dea-dia-system__/graphics/icon/mechanical-forge.png",
        icon_size = 64,
        place_result = name,
        stack_size = 50,
        scale = 0.5,
    },{
        type = "recipe",
        name = name,
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "steel-plate",          amount = 10 },
            { type = "item", name = "iron-gear-wheel",          amount = 10 },
            { type = "item", name = "electronic-circuit", amount = 3 },
        },
        category = "basic-crafting",
        results = {
            { type = "item", name = "mechanical-forge", amount = 1 },
        }
    } 
})
