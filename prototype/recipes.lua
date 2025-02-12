data:extend{
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = "gel-lube",
        icons =
        {
            {
                icon = data.raw["fluid"]["lubricant"].icon,
            },
            {
                icon = "__dea-dia-system__/graphics/icon/slimy-gel.png",
                scale = .25,
                shift = {
                    x = -16,
                    y = -16
                }
            }
        },
        energy_required = 5,
        ingredients = {
            { type = "fluid", name = "slimy-gel",  amount = 20 },
            { type = "item", name = "carbon",  amount = 1 }
        },
        results = {
            { type = "fluid", name = "lubricant", amount = 20 },
        }
    }
}