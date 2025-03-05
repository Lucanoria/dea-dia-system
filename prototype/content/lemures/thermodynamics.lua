data:extend {
    {
        type = "item",
        name = "lava-cake",
        stack_size = 50,
        icon = "__dea-dia-system__/graphics/icon/lava-cake.png",
        pictures = {
            layers = {
                {
                    filename = "__dea-dia-system__/graphics/icon/lava-cake.png",
                    width = 64,
                    height = 64
                }, {
                filename = "__dea-dia-system__/graphics/icon/lava-cake-glow.png",
                draw_as_light = true,
                width = 64,
                height = 64
            }
            }
        },
        spoil_result = "stone",
        spoil_ticks = 8000,
        fuel_value = "100MJ",
        subgroup = "vulcanus-processes",
        fuel_category = "chemical"
    },
    {
        type = "recipe",
        name = "natrocarbonatite-processing",
        allow_productivity = true,
        category = "oil-processing",
        subgroup = "vulcanus-processes",
        energy_required = 4,
        enabled = false,
        icon = "__dea-dia-system__/graphics/icon/natrocarbonatite.png",
        ingredients = {
            { type = "fluid", name = "natrocarbonatite", amount = 250 },
            { type = "item",  name = "calcite",          amount = 1 },
        }, results = {
        { type = "item",  name = "carbon",        amount = 3 },
        { type = "item",  name = "stone",         amount = 10 },
        { type = "fluid", name = "water",         amount = 100 },
        { type = "fluid", name = "petroleum-gas", amount = 100 },
    } }, {
    type = "recipe",
    name = "lava-plate-processing",
    allow_productivity = true,

    category = "heating-or-assembling",
    subgroup = "vulcanus-processes",
    energy_required = 2,
    enabled = false,
    icons =
    {
        {
            icon = "__space-age__/graphics/icons/fluid/lava.png"
        },
        {
            icon = "__base__/graphics/icons/iron-plate.png",
            scale = .3,
            shift = {
                y = 10,
                x = -10
            }
        },
        {
            icon = "__base__/graphics/icons/copper-plate.png",
            scale = .3,
            shift = {
                y = 10,
                x = 10
            }
        }
    },
    ingredients = {
        { type = "fluid", name = "lava",        amount = 200 },
        { type = "item",  name = "calcite",     amount = 1 },
        { type = "item",  name = "stone-brick", amount = 4 },
    }, results = {

    { type = "item", name = "iron-plate",   amount = 10 },
    { type = "item", name = "copper-plate", amount = 10 },
    { type = "item", name = "stone",        amount = 1 },
}
},
    {
        type                                = "recipe",
        category                            = "heating-or-assembling",
        name                                = "lava-cake",
        subgroup = "vulcanus-processes",
        allow_productivity = true,

        enabled                             = false,
        preserve_products_in_machine_output = true,
        icon                                = "__dea-dia-system__/graphics/icon/lava-cake.png",
        surface_conditions                  = {
            {
                property = "pressure",
                max = 300
            }
        },
        energy_required                     = 1,
        ingredients                         = {
            { type = "fluid", name = "lava", amount = 100 }
        },
        results                             =
        {
            { type = "item", name = "lava-cake", amount = 1 },
        }
    }
 }
