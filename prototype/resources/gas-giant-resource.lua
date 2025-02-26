local resource_autoplace = require("resource-autoplace")

local function gas_resource(name, result,randomness, start_area)
    local base = table.deepcopy(data.raw["resource"]["crude-oil"])
    local size = 5

    base.autoplace = resource_autoplace.resource_autoplace_settings
    {
        name = name,
        order = "b",
        base_density = 1,
        richness_multiplier =30,
        base_spots_per_km2 = randomness,
        has_starting_area_placement = start_area,
        random_spot_size_minimum = 0.01,
        random_spot_size_maximum = 0.01,
        regular_blob_amplitude_multiplier = 1,
        richness_post_multiplier = 1.0,
        --additional_richness = 400000,
        starting_rq_factor_multiplier = 0.1,  -- Makes patches have only one entity
        regular_rq_factor_multiplier = 0.1,
        candidate_spot_count = 10,
    }
    base.autoplace.tile_restriction = {
        "dea-dia-surface"
    }
    base.created_effect = nil
    base.flags = {
        "placeable-neutral"
    }
    base.infinite = true

    base.infinite_depletion_amount = 10
    
    base.collision_box = {
        {
            x= -size,
            y= -size
        },
        {
            x= size,
            y= size
        }
    }
    local result_fluid = data.raw["fluid"][result]

    base.map_color = result_fluid.base_color
    base.stateless_visualisation = {
        {
            animation = {
                animation_speed = .2,
                filename = "__dea-dia-system__/graphics/resource/tornado.png",
                frame_count = 10,
                height = 793,
                line_length = 10,
                priority = "extra-high",
                scale = 0.5,
                shift = {
                    0.0,
                    0.0
                },
                width = 793,
                tint = result_fluid.base_color,
            },
            count = 1
        }
    }
    base.stages = {
        sheet = {
            filename = "__dea-dia-system__/graphics/resource/tornado.png",
            frame_count = 10,
            height = 793,
            line_length = 10,
            priority = "extra-high",
            scale = 0.05,
            shift = {
                0.0,
                0.0
            },
            tint = result_fluid.flow_color,
            variation_count = 1,
            width = 793
        }
    }
    base.category = "gas-giant"
    base.name = name
    base.minable.results[1].name = result
    base.icon = result_fluid.icon
    data:extend { base }
end
data:extend {
    {
        type = "resource-category",
        name = "gas-giant"
    }
}

-- gas_resource("lithium","lithium-gas")
gas_resource("fluorine-wind", "fluorine",0.02,false)
gas_resource("gas-wind", "petroleum-gas",0.02,false)
gas_resource("ammonia-wind", "ammonia",0.015,false)
gas_resource("lithium-wind", "lithium-brine",0.03,true)
gas_resource("holmium-wind", "holmium-solution",0.02,true)
