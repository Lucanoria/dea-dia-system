data:extend {
    {
        type = "recipe-category",
        name = "heating"
    },
    {
        type = "recipe-category",
        name = "heating-or-chemistry"
    },
    {
        type = "recipe-category",
        name = "heating-or-assembling"
    },
    {
        type = "recipe-category",
        name = "bending"
    },
    {
        type = "recipe-category",
        name = "hydroponics"
    },{
        type = "recipe-category",
        name = "gas-mining"
    },
    {
    type = "recipe-category",
    name = "heating-or-metallurgy"
}, {
    type = "recipe-category",
    name = "air-collection"
},{
    type="recipe-category",
    name= "forging-or-chemistry"
},
    {
        type = "item-subgroup",
        name = "slimeweed",
        group = "bioprocessing",
        order = "dle[slimeweed]",
    },
    {
        type = "item-subgroup",
        name = "canning",
        group = "bioprocessing",
        order = "c[canning]",
    },
    {
        type = "item-subgroup",
        name = "soil-processing",
        group = "bioprocessing",
        order = "dlea[soil-processing]",
    }
    , {
    type = "item-subgroup",
    name = "cold-biters",
    group = "bioprocessing",
    order = "dlec[cold-biters]",
},
    {
        type = "item-subgroup",
        name = "gas-giant",
        group = "space",
        order = "z[gas-giant]"
    },
    {
        type = "custom-event",
        name = "dea-dia-on-landed",
    }
}

require("prototype.entity.entity")
require("prototype.equipment")
require("prototype.planet.planet")
require("prototype.science")
require("prototype.extras.extras")
require("prototype.content.content")
require("prototype.tiles")
require("prototype.recipes")
require("prototype.resources.resources")
require("prototype.technology")
require("prototype.module")

local gleba = data.raw.planet["gleba"]
local vulcanus = data.raw.planet["vulcanus"]
local fulgora = data.raw.planet["fulgora"]
local aquilo = data.raw.planet["aquilo"]

-- remove the space solar panel unlock from the rocket.
local tech = data.raw.technology["rocket-silo"]
if tech and tech.effects then
    for key, value in ipairs(tech.effects) do
        if value.type == "unlock-recipe" then
            if value.recipe == "space-solar-panel" then
                table.remove(tech.effects, key)
            end
        end
    end
end
