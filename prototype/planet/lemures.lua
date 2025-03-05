--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--START MAP GEN
function MapGen_lemures()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)

    map_gen_setting.terrain_segmentation = "very-high"

    map_gen_setting.property_expression_names = {
        elevation = "nauvis_elevation",
        temperature = "vulcanus_temperature",
        moisture = "nauvis_moisture",
        aux = "nauvis_aux",
        cliffiness = "cliffiness_basic",
        cliff_elevation = "cliff_elevation_from_elevation",
        ["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
        ["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
    }

    map_gen_setting.autoplace_controls = {
        ["fossil"] = {},
        ["sulfuric_acid_geyser"] = {},
        ["gleba_stone"] = {},
        ["natrocarbonatite"] = {},
        ["frost_enemy_base"] = { frequency = 1, size = 1, richness = 1 },
        ["water"] = { frequency = 1, size = 2, richness = 3 }
    }

    map_gen_setting.autoplace_settings["tile"] = {
        settings =
        {
            ["snow-flat"] = {},
            ["snow-crests"] = {},
            ["snow-lumpy"] = {},
            ["lava"] = {}
        }
    }

    map_gen_setting.autoplace_settings["decorative"] =
    {
        settings =
        {
            -- end of nauvis
            ["sulfur-stain"] = {
                frequency = 2
            },
            ["sulfur-stain-small"] = {
                frequency = 2
            },
            ["sulfuric-acid-puddle"] = {},
            ["sulfuric-acid-puddle-small"] = {},
            ["crater-small"] = {
                frequency = 10
            },
            ["crater-large"] = {},
        }
    }
    
    map_gen_setting.cliff_settings = {
        name = "cliff-nauvis",
        cliff_elevation_interval = 10,
        cliff_elevation_0 = 70
    }

    map_gen_setting.autoplace_settings["entity"] = {
        settings =
        {
            ["stone"] = {},
            ["fossil"] = {},
            ["natrocarbonatite"] = {},
            ["crater-cliff"] = {},
            ["sulfuric-acid-geyser"] = {},
            ["ice-rock-huge"] = {},
            ["ice-rock-medium"] = {}
        }
    }

    return map_gen_setting
end

-- increse stone patch size in start area
-- data.raw["resource"]["stone"]["autoplace"]["starting_area_size"] = 5500 * (0.005 / 3)

--END MAP GEN
local planets = data.raw["planet"]
local nauvis = planets["nauvis"]
local dea_dia = data.raw["planet"]["planet-dea-dia"]

local lemures =
{
    type = "planet",
    name = "lemures",
    tier = -1,
    pollutant_type = "pollution",
    solar_power_in_space = 10,
    subgroup="satellites",
    icon = "__dea-dia-system__/graphics/icon/planet-lemures.png",
    starmap_icon = "__dea-dia-system__/graphics/planet-lemures.png",
    platform_procession_set = table.deepcopy(nauvis.platform_procession_set),
    procession_graphic_catalogue = table.deepcopy(nauvis.procession_graphic_catalogue),
    asteroid_spawn_definitions = table.deepcopy(nauvis.asteroid_spawn_definitions),
    asteroid_spawn_influence = 3,
    starmap_icon_size = 512,
    label_orientation = 0.6,
    draw_orbit = false,
    magnitude = nauvis.magnitude,
    orbit = {
        parent = dea_dia, 
        distance = 5,
        orientation = .55,
        sprite = {
            type = "sprite",
            filename = "__dea-dia-system__/graphics/orbits/orbit-lemures.png",
            size = 1283,
            scale = 0.25,
        }

    },
    entities_require_heating = true,
    surface_properties = {
        ["solar-power"] = 5,
        ["pressure"] = 100,
        ["magnetic-field"] = 10,
        ["day-night-cycle"] = nauvis.surface_properties["day-night-cycle"]
    },
    persistent_ambient_sounds =
    {
        base_ambience = { filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5 },
        wind = { filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8 },
        crossfade =
        {
            order = { "wind", "base_ambience" },
            curve_type = "cosine",
            from = { control = 0.35, volume_percentage = 0.0 },
            to = { control = 2, volume_percentage = 100.0 }
        },
        semi_persistent =
        {
            {
                sound = { variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3) },
                delay_mean_seconds = 15,
                delay_variance_seconds = 9
            }
        }
    },
    map_gen_settings = MapGen_lemures()
}

PlanetsLib:extend { lemures }


local lemures_connection = {
    type = "space-connection",
    redrawn_connections_keep = true,
    redrawn_connections_rescale = false,
    name = "prosephina-lemures",
    from = "prosephina",
    to = "lemures",
    subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
    length = 10000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba),
}

data:extend {
    lemures_connection,
    {
        type = "space-connection",
        name = "prosephina-lemures",
        redrawn_connections_keep = true,
        redrawn_connections_rescale = false,
        from = "dea-dia-system-edge",
        to = "lemures",
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba),
    }
}

data:extend { {type = "technology",lignumis_skip_science_packs=true,    name = "planet-discovery-lemures",
    icons = PlanetsLib.technology_icon_moon("__dea-dia-system__/graphics/planet-lemures.png", 512),
    essential = true,
    localised_description = { "space-location-description.lemures" },
    effects = {
        {
            type = "unlock-space-location",
            space_location = "lemures",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "lava-cake"
        },
        {
            type = "unlock-recipe",
            recipe = "mechanical-forge"
        },
        {
            type = "unlock-recipe",
            recipe = "heating-tower"
        }

    },
    prerequisites = {
        "insulation-science-pack"
    },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "space-science-pack",      1 },
            { "insulation-science-pack",      1 },
        },
        time = 60,
    },
    order = "m[lemures]",
}, {type = "technology",lignumis_skip_science_packs=true,    name = "lava-plate-processing",
    icon = "__dea-dia-system__/graphics/icon/lava-plate-processing.png",
    icon_size = 256,
    prerequisites = {
        "planet-discovery-lemures"
    }, research_trigger = {
    type = "mine-entity",
    entity = "ice-rock-huge"
}, effects = {
    {
        type = "unlock-recipe",
        recipe = "lava-plate-processing"
    }
}
}, {type = "technology",lignumis_skip_science_packs=true,    name = "natrocarbonatite-processing",
    icon = "__dea-dia-system__/graphics/icon/natrocarbonatite-processing-tech-icon.png",
    icon_size = 256,
    prerequisites = {
        "planet-discovery-lemures"
    }, research_trigger = {
    type = "mine-entity",
    entity = "natrocarbonatite"
}, effects = {
    {
        type = "unlock-recipe",
        recipe = "natrocarbonatite-processing"
    }
    ,
    {
        type = "unlock-recipe",
        recipe = "coal-synthesis"
    }
}
}
}

data:extend{
    {
        type = "ambient-sound",
        name="lemures-1",
        sound = {
            filename ="__dea-dia-system__/music/lemures/Curha - Fatal Conflict.ogg"
        },
        track_type="hero-track",
        planet="lemures"
    },
    {
        type = "ambient-sound",
        name="lemures-2",
        sound = {
            filename ="__dea-dia-system__/music/lemures/Jon Shuemaker - Stuck Somewhere Between Dream & Reality.ogg"
        },
        track_type="main-track",
        planet="lemures"
    },
    {
        type = "ambient-sound",
        name="lemures-3",
        sound = {
            filename ="__dea-dia-system__/music/lemures/Jon Shuemaker - The Ice Is Breaking (instrumental).ogg"
        },
        track_type="main-track",
        planet="lemures"
    }
}