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

local recipes = data.raw["recipe"]
print("adding sulfur recipes to productivity")
for key, value in pairs(recipes) do
    print(value.name)
    if (value.category ~= "parameters") then
        local next = next(value.results)
        if next then
            if value.results[1].name == "sulfur" then
                print("added " .. value.name)
                table.insert(data.raw["technology"]["sulfur-productivity"].effects, {
                    recipe = value.name,
                    type = "change-recipe-productivity",
                    change = 0.1
                })
            end
        end
    end
end


table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "primal-sea")
--table.insert(data.raw.item["space-platform-foundation"].place_as_tile.tile_condition, "dae-dia-winds")


-- update the equipment grid of the mech armor to fit the custom equ
local mech_armor = data.raw["armor"]["mech-armor"]
mech_armor.equipment_grid = "mech-equipment-grid"


table.insert(data.raw["technology"]["promethium-science-pack"].prerequisites,"insulation-science-pack")
table.insert(data.raw["technology"]["promethium-science-pack"].prerequisites,"thermodynamic-science-pack")