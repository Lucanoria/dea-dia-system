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
        name = "dea-dia-system-edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
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
        redrawn_connections_keep = true,
        redrawn_connections_rescale = false,
        to = "dea-dia-system-edge",
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba),
    },
    {
        type = "space-connection",
        name = "dea-dia-prosphina",
        from = "planet-dea-dia",
        to = "prosephina",
        redrawn_connections_keep = true,
        redrawn_connections_rescale = false,
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 3000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
    },
    {
        type = "space-connection",
        name = "dea-dia-lemures",
        from = "planet-dea-dia",
        to = "lemures",
        redrawn_connections_keep = true,
        redrawn_connections_rescale = false,
        subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
        length = 3000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
    },
    {
        type = "technology",
        lignumis_skip_science_packs=true, 
        name = "system-discovery-dea-dia",
        icon = "__dea-dia-system__/graphics/icon/system-discovery.png",
        icon_size = 256,
        essential = true,
        localised_description = { "space-location-description.dea-dia" },
        effects = {
            {
                type = "unlock-space-location",
                space_location = "dea-dia-system-edge"
            },
        },
        prerequisites = {
            "metallurgic-science-pack", "electromagnetic-science-pack", "rocket-turret"
        },
        unit = {
            count = 1000,
            ingredients = {
                { "automation-science-pack",      1 },
                { "logistic-science-pack",        1 },
                { "chemical-science-pack",        1 },
                { "space-science-pack",           1 },
                { "metallurgic-science-pack",     1 },
                { "electromagnetic-science-pack", 1 },
            },
            time = 60,
        },
        order = "m[prosephina]",
    }
}
