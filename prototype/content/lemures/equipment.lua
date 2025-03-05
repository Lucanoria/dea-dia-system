-- simple armor plate, a shield that has more armor but charges slower.
data:extend {
    {
        default_import_location = "lemures",
        type = "item",
        name = "armor-plate-equipment",
        icon = "__dea-dia-system__/graphics/icon/armor-plate.png",
        place_as_equipment_result = "armor-plate-equipment",
        subgroup = "military-equipment",
        order = "b[shield]-b[armor-plate-equipment]",
        stack_size = 20,
        weight = 300 * kg
    },
    {
        type = "recipe",
        name = "armor-plate-equipment",
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "electronic-circuit",       amount = 1 },
            { type = "item", name = "rhenium-plate",  amount = 20 },
            { type = "item", name = "copper-plate", amount = 5 },
        },
        subgroup = "military-equipment",
        order = "b[shield]-b[armor-plate-equipment]",
        results = {
            { type = "item", name = "armor-plate-equipment", amount = 1 },
        }
    },
    {
        type = "energy-shield-equipment",
        name = "armor-plate-equipment",
        sprite =
        {
            filename = "__dea-dia-system__/graphics/equipment/armor-plate.png",
            width = 128,
            height = 128,
            priority = "medium",
            scale = 0.5
        },
        shape =
        {
            width = 1,
            height = 1,
            type = "full"
        },
        max_shield_value = 20,
        energy_source =
        {
            type = "electric",
            buffer_capacity = "10kJ",
            input_flow_limit = "20kW",
            usage_priority = "primary-input"
        },
        energy_per_shield = "100kJ",
        categories = { "armor" },
        order = "b[shield]-b[armor-plate-equipment]",
    }, {
    type = "technology",
    lignumis_skip_science_packs=true, 
    name = "armor-plate-equipment",
    icon = "__dea-dia-system__/graphics/icon/armor-plate-tech-icon.png",
    icon_size = 256,
    essential = false,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "armor-plate-equipment"
        }
    },
    prerequisites = {
        "thermodynamic-science-pack", "military-2"
    },
    unit = {
        count = 300,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "military-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "thermodynamic-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
        },
        time = 60,
    },
    order = "m[armor]",
}
}



local grid = data.raw["equipment-grid"]["huge-equipment-grid"]

table.insert(grid.equipment_categories, #(grid.equipment_categories) + 1, "flying")
