--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")



local star = {
    type = "space-location",
    name = "star-dea-dia",
    starmap_icon = "__dea-dia-system__/graphics/star-dea-dia.png",
    icon = "__dea-dia-system__/graphics/star-dea-dia.png",
    starmap_icon_size = 512,
    sprite_only = true,
    magnitude = 2.0,
    distance = 70,
    tier = -1,
    draw_orbit = false,
    orientation = .8
}

data:extend { star }

PlanetsLib:extend {
    {
        type = "space-location",
        name = "planet-dea-dia",
        icon = "__dea-dia-system__/graphics/icon/planet-dea-dia.png",
        starmap_icon = "__dea-dia-system__/graphics/planet-dea-dia.png",
        starmap_icon_size = 1024,
        solar_power_in_space = 30,
        magnitude = 5.0,
        tier = -1,
        draw_orbit = false,
        orbit = {
            parent = star,
            distance = 10,
            orientation = .25,
            sprite = {
                type = "sprite",
                filename = "__dea-dia-system__/graphics/orbits/orbit-dea-dia.png",
                size = 2563,
                scale = 0.25,
            }        
        }
    }
}

data:extend { {
    type = "technology",
    name = "planet-discovery-dea-dia",
    icons = PlanetsLib.technology_icon_planet("__dea-dia-system__/graphics/planet-dea-dia.png", 1024),
    essential = true,
    localised_description = { "space-location-description.dea-dia" },
    effects = {
        {
            type = "unlock-space-location",
            space_location = "planet-dea-dia",
            use_icon_overlay_constant = true
        },
    },
    prerequisites = {
        "insulation-science-pack",
        "thermodynamic-science-pack","mech-armor"
    },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "space-science-pack",      1 },
            { "insulation-science-pack",      1 },
            { "thermodynamic-science-pack",   1 },
        },
        time = 60,
    },
    order = "m[prosephina]",
} }


PlanetsLib:extend {
    {
        type = "space-location",
        name = "dea-dia-system-edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        starmap_icon_size = 64,
        draw_orbit = false,
        orbit = {
            parent = star,
            distance = 5,
            orientation = .5
        }
    }
}


data:extend {
    {
        type = "space-connection",
        name = "dea-dia-edge",
        from = "fulgora",
        to = "dea-dia-system-edge",
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 3000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba),
    },
    {
        type = "space-connection",
        name = "dea-dia-prosphina",
        from = "planet-dea-dia",
        to = "prosephina",
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 3000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
    },
    {
        type = "space-connection",
        name = "dea-dia-lemures",
        from = "planet-dea-dia",
        to = "lemures",
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 3000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
    },

}
