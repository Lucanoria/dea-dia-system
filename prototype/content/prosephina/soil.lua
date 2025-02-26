local soil_name = "rich-soil"

data:extend { {
    default_import_location = "prosephina",
    type = "item",
    name = soil_name,
    icon_size = 64,
    icon_mipmaps = 3,
    icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
    order = "a-b-a",
    stack_size = 50
} }

if mods["dredgeworks"] then
    do_not_submerge["rich-soil"] = true
end

data:extend {
    -- allows the player to get some ores out of soil without any machines.
    {
        type = "recipe",
        category = "crafting",
        name = "soil-shifting",
        subgroup = "soil-processing",
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
            { type = "item", name = "iron-ore",   amount = 1, probability = .25 },
            { type = "item", name = "copper-ore", amount = 1, probability = .1 },
            { type = "item", name = "stone",      amount = 2 },
            { type = "item", name = "stone",      amount = 1, probability = .5 },
            { type = "item", name = "stone",      amount = 1, probability = .25 },
            -- wood has a higher probability because we want to give the player more fuel.
            { type = "item", name = "wood",       amount = 1 },
            { type = "item", name = "wood",       amount = 1, probability = .75 },
            { type = "item", name = "wood",       amount = 1, probability = .25 },
        },
        enabled = true
    },
    {
        type            = "recipe",
        name            = "soil-landfil",
        category        = "heating-or-assembling",
        energy_required = 5,
        icons           = {
            {
                icon = "__base__/graphics/icons/landfill.png",
            }, {
            icon = "__dea-dia-system__/graphics/icon/rich-soil.png",
            shift = {
                10, 10
            },
            scale = .4
        }
        },
        ingredients     = {
            { type = "item",  name = soil_name,       amount = 10 },
            { type = "item",  name = "wood",          amount = 2 },
            { type = "fluid", name = "mineral-water", amount = 100 }
        },
        results         = {
            { type = "item", name = "landfill", amount = 1 }
        },
        enabled         = false
    }, {
    type = "technology",
    lignumis_skip_science_packs = true,
    name = "soil-landfil",
    subgroup               = "soil-processing",
    prerequisites = {
        "insulation-science-pack"
    },
    icon = "__dea-dia-system__/graphics/icon/soil-landfil-tech-icon.png",
    icon_size = 256,
    unit = {
        ingredients = {
            { "automation-science-pack", 1 },
            { "insulation-science-pack", 1 }
        },
        time = 10,
        count = 80,
    },
    effects = {
        {
            type   = "unlock-recipe",
            recipe = "soil-landfil"
        }
    }
},
    -- proper pythomining of said soil.
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-leeching-iron",
        subgroup               = "soil-processing",
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
            { type = "item",  name = soil_name,       amount = 8 },
            { type = "item",  name = "slime-weed",    amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 50 }
        },
        results                = {
            { type = "item", name = "iron-ore",   amount = 16 },
            { type = "item", name = "wood",       amount = 1 },
            { type = "item", name = "slime-weed", amount = 2 }
        },
        enabled                = false
    },
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-leeching-copper",
        subgroup               = "soil-processing",
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
            { type = "item",  name = soil_name,       amount = 8 },
            { type = "item",  name = "slime-weed",    amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 50 }
        },
        results                = {
            { type = "item", name = "copper-ore", amount = 16 },
            { type = "item", name = "wood",       amount = 1 },
            { type = "item", name = "slime-weed", amount = 2 }
        },
        enabled                = false
    },
    {
        type                   = "recipe",
        category               = "hydroponics",
        name                   = "soil-root-growing",
        subgroup               = "soil-processing",
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
            { type = "item", name = "wood",       amount = 10 },
            { type = "item", name = "slime-weed", amount = 2 }
        },
        enabled                = false
    }
}
