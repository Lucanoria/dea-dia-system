local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local function add_crafting_category_if_other_category_exists(category_to_find, category_to_add)
    for _, assembling_machine_type in pairs {
        "assembling-machine",
        "rocket-silo",
        "furnace",
        "character",
    } do
        for _, assembling_machine in pairs(data.raw[assembling_machine_type] or {}) do
            for _, category in pairs(assembling_machine.crafting_categories or {}) do
                if category == category_to_find then
                    table.insert(assembling_machine.crafting_categories, category_to_add)
                    break
                end
            end
        end
    end
end

require("prototype.compat.compat")

add_crafting_category_if_other_category_exists("chemistry", "heating-or-chemistry")
add_crafting_category_if_other_category_exists("crafting-with-fluid", "heating-or-assembling")
add_crafting_category_if_other_category_exists("advanced-crafting", "heating-or-assembling")
add_crafting_category_if_other_category_exists("basic-crafting", "bending")
add_crafting_category_if_other_category_exists("metallurgy", "heating-or-metallurgy")

-- give the convector some unusual recipes.
data.raw["recipe"]["electric-engine-unit"].category = "heating-or-assembling"
data.raw["recipe"]["engine-unit"].category = "heating-or-assembling"
data.raw["recipe"]["flying-robot-frame"].category = "heating-or-assembling"
data.raw["recipe"]["low-density-structure"].category = "heating-or-assembling"

data.raw["recipe"]["piercing-rounds-magazine"].category = "bending"
data.raw["recipe"]["uranium-rounds-magazine"].category = "bending"
data.raw["recipe"]["firearm-magazine"].category = "bending"

data.raw["recipe"]["piercing-shotgun-shell"].category = "bending"
data.raw["recipe"]["shotgun-shell"].category = "bending"

data.raw["recipe"]["flamethrower-turret"].category = "bending"
data.raw["recipe"]["gun-turret"].category = "bending"
data.raw["recipe"]["gate"].category = "bending"

table.insert(data.raw["technology"]["plastic-bar-productivity"].effects, {
    recipe = "gel-plastic",
    type = "change-recipe-productivity",
    change = 0.1
})


table.insert(data.raw["technology"]["plastic-bar-productivity"].effects, {
    recipe = "fluorine-plastic",
    type = "change-recipe-productivity",
    change = 0.1
})

table.insert(data.raw["technology"]["rocket-fuel-productivity"].effects, {
    recipe = "gel-rocket-fuel",
    type = "change-recipe-productivity",
    change = 0.1
})
table.insert(data.raw["technology"]["rocket-fuel-productivity"].effects, {
    recipe = "magnesium-rocket-fuel",
    type = "change-recipe-productivity",
    change = 0.1
})


table.insert(data.raw["technology"]["rocket-fuel-productivity"].effects, {
    recipe = "gas-rocket-fuel",
    type = "change-recipe-productivity",
    change = 0.1
})



local landfill_tile_condition = data.raw.item["landfill"].place_as_tile.tile_condition
-- local space_platform_tile_condition = data.raw.item["space-platform-foundation"].place_as_tile.tile_condition

table.insert(landfill_tile_condition,#landfill_tile_condition+1, "primal-sea")
-- table.insert(space_platform_tile_condition,#space_platform_tile_condition+1, "dae-dia-surface")


table.insert(data.raw["technology"]["promethium-science-pack"].prerequisites, "thermodynamic-science-pack")
table.insert(data.raw["technology"]["promethium-science-pack"].prerequisites, "planet-discovery-dea-dia")


-- alter cold biters subgroups, so they show up on bio processing now
data.raw["item"]["cb_alien_cold_artifact"].subgroup = "cold-biters"
data.raw["recipe"]["cb-clean-gland"].subgroup = "cold-biters"
data.raw["recipe"]["cb-cold-extract"].subgroup = "cold-biters"
data.raw["recipe"]["cb-artifact-to-oil"].subgroup = "cold-biters"

