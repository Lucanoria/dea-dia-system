-- the collector contains an assembler with a fixed recipe for each mineable resource.
-- ensures that it remains infinite.
local function create_assembler(resource_name, wind_name)
    data:extend { {
        type = "recipe",
        name = "gas-mining-" .. wind_name,
        localised_name = {
            "fluid-name." .. resource_name
        },
        localised_description = {
            "fluid-description." .. resource_name
        },
        ingredients = {},
        hidden = true,
        hidden_in_factoriopedia = true,
        category = "gas-mining",
        energy_usage = 2,
        results = {
            { type = "fluid", name = resource_name, amount = 10 }
        }
    },
        {
            type                      = "assembling-machine",
            name                      = "gas-miner-" .. wind_name,
            crafting_categories       = { "gas-mining" },
            fixed_recipe              = "gas-mining-" .. wind_name,
            energy_usage              = "10MW",
            localised_name            = {
                "entity-name.gas-collector"
            },
            localised_description     = {
                "entity-description.gas-collector"
            },
            factoriopedia_alternative = "gas-collector",
            crafting_speed            = 1,
            fluid_boxes               = { {
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                production_type = "output",
                pipe_connections = {
                    {
                        direction = defines.direction.south, flow_direction = "output", position = { 0, 3 }
                    },
                    {
                        direction = defines.direction.north, flow_direction = "output", position = { 0, -3 }
                    },
                    {
                        direction = defines.direction.west, flow_direction = "output", position = { -3, 0 }
                    },
                    {
                        direction = defines.direction.east, flow_direction = "output", position = { 3, 0 }
                    }
                },
                secondary_draw_orders = { north = -1 },
            } },
            energy_source             = { type = "void" },
            collision_box             = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            selection_box             = { { -3.6, -3.6 }, { 3.6, 3.6 } }
        }
    }
end


-- create a new assembler for each gas resource.
local resources = data.raw["resource"]

for index, resource in pairs(resources) do
    if resource.category == "gas-giant" then
        create_assembler(resource.minable.results[1].name, resource.name)
    end
end
