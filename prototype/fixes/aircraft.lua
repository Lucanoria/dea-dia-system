local cargo_ship_tech = data.raw["technology"]["lex-flying-cargo-ships"]

local ship_techs = {
    cargo_ship_tech,
    data.raw["technology"]["lex-flying-gunship-ships"],
}

table.insert(cargo_ship_tech.effects, #(cargo_ship_tech.effects) + 1, {
    type = "unlock-recipe",
    recipe = "sp-spidertron-dock"
}
)

local engine_tech = data.raw["technology"]["lex-jet-engine"]

local engine_requirements = engine_tech.prerequisites
local engine_ingredients = engine_tech.unit.ingredients

table.insert(engine_requirements, #engine_requirements + 1, "magnesium-rocket-fuel")

table.insert(engine_ingredients, #engine_ingredients + 1, { "insulation-science-pack", 1 })
table.insert(engine_ingredients, #engine_ingredients + 1, { "thermodynamic-science-pack", 1 })


for index, value in ipairs(ship_techs) do
    local ship_requirements = value.prerequisites
    local ship_ingredients = value.unit.ingredients

    table.insert(ship_requirements, #ship_requirements + 1, "planet-discovery-dea-dia")

    table.insert(ship_ingredients, #ship_ingredients + 1, { "insulation-science-pack", 1 })
    table.insert(ship_ingredients, #ship_ingredients + 1, { "thermodynamic-science-pack", 1 })
    table.insert(ship_ingredients, #ship_ingredients + 1, { "aerospace-science-pack", 1 })
end

local heavy_ship = data.raw["technology"]["lex-flying-heavyship-ships"]

local ship_requirements = heavy_ship.prerequisites
local ship_ingredients = heavy_ship.unit.ingredients

table.insert(ship_requirements, #ship_requirements + 1, "planet-discovery-dea-dia")

table.insert(ship_ingredients, #ship_ingredients + 1, { "insulation-science-pack", 1 })
table.insert(ship_ingredients, #ship_ingredients + 1, { "thermodynamic-science-pack", 1 })
table.insert(ship_ingredients, #ship_ingredients + 1, { "aerospace-science-pack", 1 })

--update recipes

data.raw["recipe"]["lex-flying-gunship"].ingredients = {
    { type = "item", name = "electric-engine-unit",  amount = 60 },
    { type = "item", name = "magnesium-alloy-plate", amount = 100 },
    { type = "item", name = "magnesium-plate",       amount = 400 },
    { type = "item", name = "electronic-circuit",    amount = 40 },
    { type = "item", name = "submachine-gun",        amount = 2 },
    { type = "item", name = "rocket-launcher",       amount = 2 }
}

data.raw["recipe"]["lex-flying-cargo"].ingredients = {
    { type = "item", name = "electric-engine-unit",  amount = 120 },
    { type = "item", name = "magnesium-alloy-plate", amount = 250 },
    { type = "item", name = "magnesium-plate",       amount = 300 },
    { type = "item", name = "advanced-circuit",      amount = 20 },
}

data.raw["recipe"]["lex-flying-heavyship"].ingredients = {
    { type = "item", name = "electric-engine-unit",  amount = 150 },
    { type = "item", name = "magnesium-alloy-plate", amount = 700 },
    { type = "item", name = "advanced-circuit",      amount = 80 },
    { type = "item", name = "processing-unit",       amount = 40 },
    { type = "item", name = "low-density-structure", amount = 200 },
    { type = "item", name = "tank",                  amount = 2 },
    { type = "item", name = "rocket-launcher",       amount = 10 },
}

data.raw["recipe"]["lex-flying-gunship"].category = "heating-or-assembling"
data.raw["recipe"]["lex-flying-cargo"].category = "heating-or-assembling"
data.raw["recipe"]["lex-flying-heavyship"].category = "heating-or-assembling"

local gunship = data.raw["item-with-entity-data"]["lex-flying-gunship"]
local cargoship = data.raw["item-with-entity-data"]["lex-flying-cargo"]
local heavyship = data.raw["item-with-entity-data"]["lex-flying-heavyship"]

gunship.default_import_location = "planet-dea-dia"
cargoship.default_import_location = "planet-dea-dia"
heavyship.default_import_location = "planet-dea-dia"

