data:extend {
    {
        type = "equipment-category",
        name = "flying"
    },
    {
        default_import_location = "prosephina",
        type = "item",
        name = "armor-plate-equipment",
        icon = "__dea-dia-system__/graphics/icon/armor-plate.png",
        place_as_equipment_result = "armor-plate-equipment",
        subgroup = "equipment",
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
            { type = "item", name = "rubber",       amount = 5 },
            { type = "item", name = "steel-plate",  amount = 20 },
            { type = "item", name = "copper-plate", amount = 5 },
        },
        category = "basic-crafting",
        subgroup = "equipment",
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
        "insulation-science-pack","military-2"
    },
    unit = {
        count = 300,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "military-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "insulation-science-pack",       1 },
            { "metallurgic-science-pack", 1 },
        },
        time = 60,
    },
    order = "m[armor]",
}
}



local grid = table.deepcopy(data.raw["equipment-grid"]["huge-equipment-grid"])

grid.name = "mech-equipment-grid"
grid.equipment_categories = { "armor", "flying" }

data:extend {
    grid
}

local thruster_equipment =  {
    type = "movement-bonus-equipment",
    name = "thruster-equipment",
    sprite =
    {
        filename = "__dea-dia-system__/graphics/equipment/rocket-engine-equipment.png",
        width = 128,
        height = 128,
        priority = "medium",
        scale = 0.5
    },
    shape =
    {
        width = 2,
        height = 2,
        type = "full"
    },
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_consumption = "400kW",
    movement_bonus = 0.5,
    categories = { "flying" }
}