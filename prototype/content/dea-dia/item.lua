data:extend {
    {
        default_import_location = "planet-dea-dia",
        type = "item",
        name = "magnesium-alloy-plate",
        subgroup = "raw-material",
        order = "a[smelting]-dz[magnesium-alloy-plate]",
        icon_size = 64,
        icon = "__dea-dia-system__/graphics/icon/magnesium-alloy.png",
        stack_size = 50,
        weight = 2000,
    }, {
    type = "recipe",
    name = "magnesium-alloy-plate",
    subgroup = "raw-material",
    order = "a[smelting]-dz[magnesium-alloy-plate]",
    category = "heating-or-metallurgy",
    icon_size = 64,
    enabled = false,
    energy_required = 10,
    icon = "__dea-dia-system__/graphics/icon/magnesium-alloy.png",
    surface_conditions = {
        {
            property = "magnetic-field",
            min = 99
        }, {
        property = "pressure",
        min = 1800
    }
    },
    ingredients = {
        { type = "fluid", name = "lithium-brine",  amount = 10 },
        { type = "item",  name = "carbon",         amount = 1 },
        { type = "item",  name = "magnesium-dust", amount = 6 },
    }, results = {
    { type = "item", name = "magnesium-alloy-plate", amount = 1 }
}
},
    {
        type = "recipe",
        name = "fluorine-plastic",
        order = "a[plastic]-dz[fluorine-plastic]",
        category = "chemistry",
        icon_size = 64,
        energy_required = 2,
        icons = {

            {
                icon = "__space-age__/graphics/icons/fluid/fluorine.png",
            },
            {
                icon = "__base__/graphics/icons/plastic-bar.png",
            }

        },
        ingredients = {
            { type = "fluid", name = "fluorine",      amount = 10 },
            { type = "fluid", name = "petroleum-gas", amount = 20 },
        }, results = {
        { type = "item", name = "plastic-bar", amount = 1 }
    }
    },
    {
        type = "recipe",
        name = "carbon-synthesis",
        order = "a[carbon]-dz[carbon-synthesis]",
        category = "chemistry",
        icon_size = 64,
        energy_required = 2,
        icons = {

            {
                icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
            },
            {
                icon = "__space-age__/graphics/icons/carbon.png",
                scale= .7
            }

        },
        ingredients = {
            { type = "fluid", name = "petroleum-gas", amount = 100 },
        }, results = {
        { type = "item", name = "carbon", amount = 1 }
    }
    },
    {
        type = "recipe",
        name = "gas-rocket-fuel",
        order = "a[rocket-fuel]-dz[gas-rocket-fuel]",
        category = "chemistry",
        icon_size = 64,
        crafting_machine_tint = {
            primary = {
                a = 1,
                b = 0.40800000000000001,
                g = 0.74199999999999999,
                r = 0.99600000000000009
            },
            quaternary = {
                a = 1,
                b = 0.26400000000000001,
                g = 0.5620000000000001,
                r = 0.65600000000000005
            },
            secondary = {
                a = 1,
                b = 0.16800000000000002,
                g = 0.39199999999999999,
                r = 0.446
            },
            tertiary = {
                a = 1,
                b = 0.38700000000000001,
                g = 0.38799999999999999,
                r = 0.34699999999999998
            }
        },
        energy_required = 10,
        icons = {
            {
                icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
            },
            {
                icon = "__space-age__/graphics/icons/ammonia-rocket-fuel.png",
            }
        },
        ingredients = {
            { type = "fluid", name = "ammonia",       amount = 500 },
            { type = "fluid", name = "petroleum-gas", amount = 40 },
            { type = "item",  name = "solid-fuel",    amount = 3 },
        }, results = {
        { type = "item", name = "rocket-fuel", amount = 1 }
    }
    }, {
    type = "technology",lignumis_skip_science_packs=true,    name = "alternative-chemistry",
    icon = "__dea-dia-system__/graphics/icon/alternative-polymer-tech-icon.png",
    icon_size = 256,
    essential = false,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "fluorine-plastic"
        }, {
        type = "unlock-recipe",
        recipe = "gas-rocket-fuel"
    }, {
        type = "unlock-recipe",
        recipe = "carbon-synthesis"
    }
    },
    prerequisites = {
        "planet-discovery-dea-dia"
    },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "military-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "aerospace-science-pack",  1 }
        },
        time = 60,
    },
    order = "d[chemistry]-e[alternative-polymers]",
}
}
