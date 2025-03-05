data:extend {
    {
        type = "item",
        name = "thorium",
        drop_sound = data.raw.item["depleted-uranium-fuel-cell"].drop_sound,
        icon = "__dea-dia-system__/graphics/icon/thorium.png",
        inventory_move_sound = data.raw.item["depleted-uranium-fuel-cell"].drop_sound,
        order = "a[uranium-processing]-t[thorium]",
        pick_sound = data.raw.item["depleted-uranium-fuel-cell"].pick_sound,
        stack_size = 100,
        subgroup = "uranium-processing",
        weight = 50000
    },
    {
        burnt_result = "depleted-uranium-fuel-cell",
        drop_sound = data.raw.item["depleted-uranium-fuel-cell"].drop_sound,
        fuel_category = "nuclear",
        fuel_value = "6GJ",
        icon = "__dea-dia-system__/graphics/icon/thorium-fuel-cell.png",
        inventory_move_sound = data.raw.item["depleted-uranium-fuel-cell"].drop_sound,
        name = "thorium-fuel-cell",
        order = "b[uranium-products]-ac[thorium-fuel-cell]",
        pick_sound = data.raw.item["depleted-uranium-fuel-cell"].pick_sound,
        pictures = {
            layers = {
                {
                    filename = "__dea-dia-system__/graphics/icon/thorium-fuel-cell.png",
                    mipmap_count = 4,
                    scale = 0.5,
                    size = 64
                },
                {
                    draw_as_light = true,
                    filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
                    flags = {
                        "light"
                    },
                    scale = 0.5,
                    size = 64
                }
            }
        },
        stack_size = 50,
        subgroup = "uranium-processing",
        type = "item",
        weight = 100000
    },
    {
        type = "recipe",
        name = "thorium-extraction",
        enabled = false,
        allow_productivity = true,
        icon = "__dea-dia-system__/graphics/icon/thorium.png",
        order = "a[uranium-processing]-t[thorium]",
        subgroup = "uranium-processing",
        category = "centrifuging",
        ingredients =
        {
            { type = "item", name = "mineral-water-barrel", amount = 20 },
        },
        results = {
            { type = "item", name = "barrel",      amount = 20 },
            { type = "item", name = "thorium",     amount = 1, probability = .1 },
            { type = "item", name = "uranium-235", amount = 1, probability = .01 },
            { type = "item", name = "uranium-238", amount = 1, probability = .01 }
        }
    }, {
    type = "recipe",
    name = "thorium-fuel-cell",
    allow_productivity = true,
    enabled = false,
    category = "centrifuging",
    order = "a[uranium-processing]-t[thorium-fuel-cell]",
    subgroup = "uranium-processing",
    ingredients =
    {
        { type = "item", name = "iron-plate",  amount = 10 },
        { type = "item", name = "thorium",     amount = 18 },
        { type = "item", name = "uranium-235", amount = 1 },
        { type = "item", name = "uranium-238", amount = 1 }
    },
    results = {
        { type = "item", name = "thorium-fuel-cell", amount = 1 }
    },

}, {
    type = "recipe",
    name = "frontrider-enrichment-process",
    enabled = false,
    allow_productivity = true,
    category = "centrifuging",
    order = "a[uranium-processing]-t[thorium-reprocessing]",
    subgroup = "uranium-processing",
    icon = "__dea-dia-system__/graphics/icon/frontrider-enrichment-process.png",
    ingredients =
    {
        { type = "item", name = "thorium",     amount = 30 },
        { type = "item", name = "uranium-235", amount = 1 },
    },
    results = {
        { type = "item", name = "uranium-235", amount = 3 },
        { type = "item", name = "uranium-238", amount = 7 },
        { type = "item", name = "thorium",     amount = 20 },
    }
}, {
    type = "technology",
    name = "thorium-processing",
    lignumis_skip_science_packs = true,
    icon = "__dea-dia-system__/graphics/icon/thorium.png",
    icon_size = 64,
    order = "a[uranium-processing]-t[thorium]",
    prerequisites = {
        "insulation-science-pack"
    },
    unit = {
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "production-science-pack", 1 },
            { "insulation-science-pack", 1 }
        },
        time = 10,
        count = 80
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "thorium-extraction"
        },
        {
            type = "unlock-recipe",
            recipe = "thorium-fuel-cell"
        }
    }
}, {
    type = "technology",
    name = "frontrider-enrichment-process",
    lignumis_skip_science_packs = true,
    icon = "__dea-dia-system__/graphics/icon/frontrider-enrichment-process-tech-icon.png",
    icon_size = 256,
    order = "a[uranium-processing]-t[thorium-enrichment]",
    prerequisites = {
        "thorium-processing", "kovarex-enrichment-process"
    },
    unit = {
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "production-science-pack", 1 },
            { "insulation-science-pack", 1 }
        },
        time = 10,
        count = 80
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "frontrider-enrichment-process"
        }
    }
}
}
