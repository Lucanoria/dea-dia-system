-- additional thrusters for aircraft and the mech armor.
data:extend { {
    type = "movement-bonus-equipment",
    name = "thruster-equipment",
    sprite =
    {
        filename = "__dea-dia-system__/graphics/equipment/thruster-equipment.png",
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
},
    {
        default_import_location = "planet-dea-dia",
        type = "item",
        name = "thruster-equipment",
        icon = "__dea-dia-system__/graphics/icon/thruster-equipment.png",
        place_as_equipment_result = "thruster-equipment",
        subgroup = "utility-equipment",
        order = "d[thruster]-e[thruster-equipment]",
        stack_size = 20,
        weight = 300 * kg
    },
    {
        type = "recipe",
        name = "thruster-equipment",
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "processing-unit",       amount = 2 },
            { type = "item", name = "rhenium-alloy-plate", amount = 20 },
            { type = "item", name = "thruster",              amount = 1 },
        },
        subgroup = "equipment",
        order = "d[thruster]-e[thruster-equipment]",
        results = {
            { type = "item", name = "thruster-equipment", amount = 1 },
        }
    }, {type = "technology",lignumis_skip_science_packs=true,    name = "thruster-equipment",
    icon = "__dea-dia-system__/graphics/icon/thruster-equipment-tech-icon.png",
    icon_size = 256,
    essential = false,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "thruster-equipment"
        }
    },
    prerequisites = {
        "planet-discovery-dea-dia", "exoskeleton-equipment"
    },
    unit = {
        count = 5000,
        ingredients = {
            { "automation-science-pack",    1 },
            { "logistic-science-pack",      1 },
            { "military-science-pack",      1 },
            { "chemical-science-pack",      1 },
            { "utility-science-pack",       1 },
            { "insulation-science-pack",    1 },
            { "thermodynamic-science-pack", 1 },
            { "aerospace-science-pack",     1 }
        },
        time = 60,
    },
    order = "d[thruster]-e[thruster-equipment]",
}
}
