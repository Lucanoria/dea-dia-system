--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--START MAP GEN
function MapGen_prosephina()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)

    map_gen_setting.terrain_segmentation = "very-high"

    map_gen_setting.autoplace_controls = {
        ["rich-soil"] = { frequency = 20, size = 3, richness = 1 },
        ["water"] = { frequency =7, size =5, richness = 8 }
    }

    map_gen_setting.autoplace_settings["tile"] =
    {
        settings =
        {
            ["sand-1"] = {},
            ["sand-2"] = {},
            ["sand-3"] = {},
            ["grass-1"] = {},
            ["primal-sea"] = {},
        }
    }

    map_gen_setting.autoplace_settings["decorative"] =
    {
        settings =
        {
            ["sulfur-stain"] = {},
            ["sulfur-stain-small"] = {},
            ["sulfuric-acid-puddle"] = {},
            ["sulfuric-acid-puddle-small"] = {},
            ["crater-small"] = {
                frequency = 10
            },
            ["crater-large"] = {},
            ["pumice-relief-decal"] = {},
            ["tiny-rock-cluster"] = {},
            ["waves-decal"] = {},
        }
    }

    map_gen_setting.autoplace_settings["entity"] = {
        settings =
        {
            ["slime-weed"] = {},
            ["rich-soil"] = {},
            ["vulcanus-chimney"]= {
                frequency = 2
            },
            ["vulcanus-chimney-faded"] =  {
                frequency = 2
            },
            ["vulcanus-chimney-cold"] =  {
                frequency = 2
            },
            ["vulcanus-chimney-short"] =  {
                frequency = 2
            },
            ["vulcanus-chimney-truncated"] =  {
                frequency = 2
            }
        }
    }


    return map_gen_setting
end

-- increse stone patch size in start area
-- data.raw["resource"]["stone"]["autoplace"]["starting_area_size"] = 5500 * (0.005 / 3)

--END MAP GEN

local nauvis = data.raw["planet"]["nauvis"]

local prosephina =
{
    type = "planet",
    name = "prosephina",
    tier= -1,
    solar_power_in_space = 20,
    subgroup="satellites",
    icon = "__dea-dia-system__/graphics/icon/planet-prosephina.png",
    icon_size = 64,
    platform_procession_set = table.deepcopy(nauvis.platform_procession_set),
    procession_graphic_catalogue = table.deepcopy(nauvis.procession_graphic_catalogue),
    asteroid_spawn_definitions = table.deepcopy(nauvis.asteroid_spawn_definitions),    
    asteroid_spawn_influence = 3,
    label_orientation = 0.5,
    starmap_icon = "__dea-dia-system__/graphics/planet-prosephina.png",
    starmap_icon_size = 512,
    draw_orbit = false,
    magnitude = nauvis.magnitude,
    orbit={
        parent = data.raw["planet"]["planet-dea-dia"],
        distance = 6,
        orientation = -.2,
        sprite = {
            type = "sprite",
            filename = "__dea-dia-system__/graphics/orbits/orbit-prosephina.png",
            size = 1539,
            scale = 0.25,
          }
    },
    surface_properties = {
        ["solar-power"] = 15,
        ["pressure"] = 800,
        ["magnetic-field"] = 80,
        ["day-night-cycle"] = nauvis.surface_properties["day-night-cycle"]
    },
    map_gen_settings = MapGen_prosephina()
}
PlanetsLib:extend{ prosephina }

local prosephina_connection = {
    type = "space-connection",
    name = "edge-prosephina",
    redrawn_connections_keep = true,
    redrawn_connections_rescale = false,
    from = "dea-dia-system-edge",
    to = "prosephina",
    subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
    length = 3000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba),
}

data:extend { prosephina_connection }

data:extend { {
    type = "technology",lignumis_skip_science_packs=true,    name = "planet-discovery-prosephina",
    icons = PlanetsLib.technology_icon_moon("__dea-dia-system__/graphics/planet-prosephina.png",512),
    essential = true,
    localised_description = { "space-location-description.prosephina" },
    effects = {
        {
            type = "unlock-space-location",
            space_location = "prosephina",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe= "heating-tower"
        },
        {
            type = "unlock-recipe",
            recipe= "heat-pipe"
        },
        {
            type = "unlock-recipe",
            recipe= "steam-turbine"
        },
        {
            type="unlock-recipe",
            recipe="soil-shifting"
        }
    },
    prerequisites = {
        "system-discovery-dea-dia"
    },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "space-science-pack",       1 },
            { "metallurgic-science-pack", 1 },
            { "electromagnetic-science-pack", 1 },
        },
        time = 60,
    },
    order = "m[prosephina]",
} }

data:extend{
    {
        type = "ambient-sound",
        name="prosephina-1",
        sound = {
            filename ="__dea-dia-system__/music/prosephina/HoliznaCC0 - Spring On The Horizon.ogg"
        },
        track_type="main-track",
        planet="prosephina"
    },
    {
        type = "ambient-sound",
        name="prosephina-2",
        sound = {
            filename ="__dea-dia-system__/music/prosephina/HoliznaCC0 - Cabin Fever.ogg"
        },
        track_type="main-track",
        planet="prosephina"
    },
    {
        type = "ambient-sound",
        name="prosephina-3",
        sound = {
            filename ="__dea-dia-system__/music/prosephina/HoliznaCC0 - An Ocean in Outer Space.ogg"
        },
        track_type="hero-track",
        planet="prosephina"
    }
}