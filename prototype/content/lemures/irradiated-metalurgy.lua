-- convert rhenium to tungsten using uranium to force it to decay.
data:extend {
    {
        type = "technology",
        name = "irradiated-metallurgy",
        icon = "__dea-dia-system__/graphics/icon/irradiated-metallurgy-tech-icon.png",
        icon_size=256,
        subgroup = "vulcanus-processes",
        unit = {
            count = 1000,
            ingredients = {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "military-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "thermodynamic-science-pack", 1 },
                { "metallurgic-science-pack",   1 },
            },
            time = 60,
        },
        prerequisites = {
            "frontrider-enrichment-process","thermodynamic-science-pack"
        },
        essential = false,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "irradiated-metallurgy"
            }
        },
    }, {
    type = "recipe",
    name = "irradiated-metallurgy",
    icon = "__dea-dia-system__/graphics/icon/irradiated-metallurgy.png",
    category = "centrifuging",
    subgroup = "vulcanus-processes",
    ingredients = {
        { type = "item", name = "rhenium-dust", amount = 10 },
        { type = "item", name = "lava-cake",    amount = 3 },
        { type = "item", name = "uranium-235",  amount = 1 },
        { type = "item", name = "thorium",      amount = 4 },
    },
    results = {
        { type = "item", name = "tungsten-ore", amount = 1, probability = .4 },
        { type = "item", name = "uranium-235",  amount = 1 },
        { type = "item", name = "uranium-235",  amount = 1, probability = .25 },
        { type = "item", name = "stone",        amount = 1 },
        { type = "item", name = "stone",        amount = 1, probability = .1 },
    }
}
}
