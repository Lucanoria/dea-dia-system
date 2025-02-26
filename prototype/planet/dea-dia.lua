--START MAP GEN
function MapGen_dae_dia()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)

    map_gen_setting.property_expression_names = {}

    map_gen_setting.autoplace_controls = {
       -- ["floater-spawner"] = {}
    }

    map_gen_setting.autoplace_settings["tile"] = {
        settings =
        {
            ["dea-dia-surface"] = {},
        }
    }
    map_gen_setting.autoplace_settings["decorative"] = {
        settings = {
            ["gas-giant-cloud-1"] = {},
            ["gas-giant-cloud-2"] = {},
            ["gas-giant-cloud-3"] = {}
        }
    }
    map_gen_setting.cliff_settings = nil
    map_gen_setting.autoplace_settings["entity"] = {
        settings = {
            ["fluorine-wind"] = {},
            ["gas-wind"] = {},
            ["ammonia-wind"] = {},
            ["lithium-wind"] = {},
            ["holmium-wind"] = {},
           -- ["floater-spawner"] = {}
        }
    }

    return map_gen_setting
end

local planets = data.raw["planet"]
local fulgora = planets["fulgora"]

PlanetsLib:extend {
    {
        type = "planet",
        name = "planet-dea-dia",
        icon = "__dea-dia-system__/graphics/icon/planet-dea-dia.png",
        starmap_icon = "__dea-dia-system__/graphics/planet-dea-dia.png",
        starmap_icon_size = 1024,
        solar_power_in_space = 30,

        platform_procession_set =
        {
            arrival = { "planet-to-platform-b" },
            departure = { "platform-to-planet-a" }
        },
        planet_procession_set =
        {
            arrival = { "platform-to-planet-b" },
            departure = { "planet-to-platform-a" }
        },
        procession_graphic_catalogue = table.deepcopy(fulgora.procession_graphic_catalogue),
        magnitude = 5.0,
        tier = -1,
        draw_orbit = false,
        surface_properties = {
            ["solar-power"] = 30,
            ["pressure"] = 2000,
            ["magnetic-field"] = 99,
            ["day-night-cycle"] = 10000
        },
        pollutant_type = "pollution",
        orbit = {
            parent = data.raw["space-location"]["star-dea-dia"],
            distance = 10,
            orientation = .2,
            sprite = {
                type = "sprite",
                filename = "__dea-dia-system__/graphics/orbits/orbit-dea-dia.png",
                size = 2563,
                scale = 0.25,
            }
        },
        map_gen_settings = MapGen_dae_dia(),
        surface_render_parameters = {
            fog = {
                -- fog_type="gleba",
                color1 = {
                    0.74,
                    0.34,
                    0.52,
                    1
                },
                color2 = {
                    0.69,
                    0.61,
                    0.65,
                    1
                },
                detail_noise_texture = {
                    filename = "__core__/graphics/clouds-detail-noise.png",
                    size = 2048
                },
                shape_noise_texture = {
                    filename = "__core__/graphics/clouds-noise.png",
                    size = 2048
                }
            }
        }

    }
}

data:extend {

    {
        type = "technology", lignumis_skip_science_packs = true, name = "planet-discovery-dea-dia",
        icons = PlanetsLib.technology_icon_planet("__dea-dia-system__/graphics/planet-dea-dia.png", 1024),
        essential = true,
        localised_description = { "space-location-description.dea-dia" },
        effects = {
            {
                type = "unlock-space-location",
                space_location = "planet-dea-dia",
                use_icon_overlay_constant = true
            },
            {
                type = "unlock-recipe",
                recipe = "gas-collector"
            }, {
            type = "unlock-recipe",
            recipe = "magnesium-alloy-plate"
        }, {
            type = "unlock-recipe",
            recipe = "aerospace-science-pack"
        }
        },
        prerequisites = {
            "insulation-science-pack",
            "thermodynamic-science-pack",
            "mech-armor"
        },
        unit = {
            count = 1000,
            ingredients = {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "space-science-pack",         1 },
                { "insulation-science-pack",    1 },
                { "thermodynamic-science-pack", 1 },
            },
            time = 60,
        },
        order = "m[prosephina]",
    } }
