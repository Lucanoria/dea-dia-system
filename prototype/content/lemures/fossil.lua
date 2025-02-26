local name = "fossil"
local magnesium_name = "magnesium-dust"
data:extend { {
    default_import_location = "lemures",
    type = "item",
    name = magnesium_name,
    icon_size = 64,
    order = "a[smelting]-da[magnesium-dust]",
    weight = 1000,
    icon = "__dea-dia-system__/graphics/icon/" .. magnesium_name .. "-1.png",
    pictures = {
        {
            filename = "__dea-dia-system__/graphics/icon/" .. magnesium_name .. "-1.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        },
        {
            filename = "__dea-dia-system__/graphics/icon/" .. magnesium_name .. "-2.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        },
        {
            filename = "__dea-dia-system__/graphics/icon/" .. magnesium_name .. "-3.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        }
    },
    subgroup = "raw-material",
    stack_size = 50
}, {
    default_import_location = "lemures",
    type = "item",
    name = "magnesium-plate",
    subgroup = "raw-material",
    weight = 1000,
    order = "a[smelting]-d[magnesium-plate]",
    icon_size = 64,
    icon = "__dea-dia-system__/graphics/icon/magnesium-plate.png",
    stack_size = 50
}
}
data:extend { {
    default_import_location = "lemures",
    type = "item",
    name = name,
    icon_size = 64,
    icon = "__dea-dia-system__/graphics/icon/" .. name .. "-1.png",
    order = "a-b-a",
    pictures = {
        {
            filename = "__dea-dia-system__/graphics/icon/" .. name .. "-1.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        },
        {
            filename = "__dea-dia-system__/graphics/icon/" .. name .. "-2.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        },
        {
            filename = "__dea-dia-system__/graphics/icon/" .. name .. "-3.png",
            mipmap_count = 4,
            scale = 0.5,
            size = 64
        } },
    stack_size = 50
},
    {
        type               = "recipe",
        category           = "chemistry",
        name               = "fossil-processing",
        subgroup           = "vulcanus-processes",
        enabled            = false,
        icon               = "__dea-dia-system__/graphics/icon/fossil-3.png",
        surface_conditions = {
            {
                property = "pressure",
                max = 300
            }
        },
        energy_required    = 1,
        ingredients        = {
            { type = "item",  name = "fossil",        amount = 1 },
            { type = "fluid", name = "sulfuric-acid", amount = 100 }
        },
        results            =
        {
            { type = "item",  name = "calcite",      amount = 3 },
            { type = "item",  name = magnesium_name, amount = 4 },
            { type = "item",  name = "sulfur",       amount = 1 },
            { type = "fluid", name = "water",        amount = 50 },
        }
    }, {
    type = "technology",lignumis_skip_science_packs=true,    name = "fossil-processing",
    icon = "__dea-dia-system__/graphics/icon/fossil-processing-tech-icon.png",
    icon_size = 256,
    prerequisites = {
        "planet-discovery-lemures"
    }, research_trigger = {
    type = "mine-entity",
    entity = "fossil"
}, effects = {
    {
        type = "unlock-recipe",
        recipe = "fossil-processing"
    },
    {
        type = "unlock-recipe",
        recipe = "magnesium-plate"
    }
}
}, {
    type            = "recipe",
    category        = "smelting",
    name            = "magnesium-plate",
    enabled         = false,
    icon            = "__dea-dia-system__/graphics/icon/magnesium-plate.png",
    energy_required = 20,
    ingredients     = {
        { type = "item", name = magnesium_name, amount = 3 },
    },
    results         =
    {
        { type = "item", name = "magnesium-plate", amount = 1 },
    }
},
}
