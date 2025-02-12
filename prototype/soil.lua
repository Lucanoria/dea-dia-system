local soil_name = "rich-soil"

data:extend{{
    default_import_location = "prosephina",
    type = "item",
    name = soil_name,
    icon_size = 64,
    icon_mipmaps = 3,
    icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
    order = "a-b-a",
    stack_size = 50
}}



if mods["dredgeworks"] then
    do_not_submerge["rich-soil"] = true
end


data:extend {
    -- allows the player to get some ores out of soil without any machines.
    {
        type = "recipe",
        category = "crafting",
        name = "soil-shifting",
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
            }, {
            icon = data.raw.item["iron-ore"].icon,
            scale = .25,
            shift = {
                x = -10,
                y = 10
            }
        }
        , {
            icon = data.raw.item["copper-ore"].icon,
            scale = .25,
            shift = {
                x = 10,
                y = 10
            }
        }
        },
        ingredients = {
            { type = "item", name = soil_name, amount = 1 }
        },
        results = {
            { type = "item", name = "iron-ore",  amount = 1, probability = .25 },
            { type = "item", name = "copper-ore", amount = 1, probability = .1 },
            { type = "item", name = "stone",     amount = 1, probability = .5 },
            -- wood has a higher probability because we want to give the player more fuel.
            { type = "item", name = "wood",      amount = 1, probability = .75 },
        },
        enabled = true
    },
    -- proper pythomining of said soil.
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-leeching-iron",
        energy_required        = 5,
        icons                  = {
            {
                icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
            }, {
            icon = data.raw.item["iron-ore"].icon,
            scale = .25,
            shift = {
                x = 0,
                y = 0
            }
        }
        },
        result_is_always_fresh = true,
        ingredients            = {
            { type = "item",  name = soil_name,       amount = 2 },
            { type = "item",  name = "slime-weed",    amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 50 }
        },
        results                = {
            { type = "item", name = "iron-ore",  amount = 4 },
            { type = "item", name = "wood",      amount = 1 },
            { type = "item", name = "slime-weed", amount = 4 }
        },
        enabled                = false
    },
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-leeching-copper",
        energy_required        = 5,
        icons                  = {
            {
                icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
            }
            , {
            icon = data.raw.item["copper-ore"].icon,
            scale = .25,
            shift = {
                x = 0,
                y = 0
            }
        }
        },
        result_is_always_fresh = true,
        ingredients            = {
            { type = "item",  name = soil_name,       amount = 2 },
            { type = "item",  name = "slime-weed",    amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 50 }
        },
        results                = {
            { type = "item", name = "copper-ore", amount = 4 },
            { type = "item", name = "wood",      amount = 1 },
            { type = "item", name = "slime-weed", amount = 4 }
        },
        enabled                = false
    },
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-root-growing",
        energy_required        = 5,
        icons                  = {
            {
                icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
            }
            , {
            icon = data.raw.item["wood"].icon,
            scale = .25,
            shift = {
                x = 0,
                y = 0
            }
        }
        },
        result_is_always_fresh = true,
        ingredients            = {
            { type = "item",  name = soil_name,       amount = 2 },
            { type = "item",  name = "slime-weed",    amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 50 }
        },
        results                = {
            { type = "item", name = "wood",      amount = 10 },
            { type = "item", name = "slime-weed", amount = 2 }
        },
        enabled                = false
    }
}
