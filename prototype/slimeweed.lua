local name = "slime-weed"
local fiber_name = "fiber"
local rubber_name = "rubber"

slime_weed = table.deepcopy(data.raw["fish"]["fish"])

slime_weed.name = name
slime_weed.attack_reaction = nil
slime_weed.minable = {
    count = 5,
    mining_time = 0.6,
    result = name
}
slime_weed.icon = "__dea-dia-system__/graphics/icon/slime-weed-1.png"
slime_weed.enabled = false
slime_weed.pictures = {
    {
        filename = "__dea-dia-system__/graphics/entity/slimeweed/slimeweed-1.png",
        height = 32,
        priority = "extra-high",
        width = 32
    },
    {
        filename = "__dea-dia-system__/graphics/entity/slimeweed/slimeweed-2.png",
        height = 32,
        priority = "extra-high",
        width = 32
    },
    {
        filename = "__dea-dia-system__/graphics/entity/slimeweed/slimeweed-3.png",
        height = 32,
        priority = "extra-high",
        width = 32
    }
}

slime_weed.factoriopedia_simulation = {
    init =
    "    for x = -8, 8, 1 do\n      for y = -3, 3 do\n        game.surfaces[1].set_tiles{{position = {x, y}, name = \"water\"}}\n      end\n    end\n    game.surfaces[1].create_entity{name = \"slime-weed\", position = {0, 0}}\n  "
}

slime_weed.autoplace = {
    probability_expression = 0.1
}

data:extend {
    slime_weed
}

local methane_name = "methane"

if (mods["Cerys-Moon-of-Fulgora"]) then

else
    data:extend {
        { 
            type = "fluid",
            name = methane_name,
            icon = "__dea-dia-system__/graphics/icon/methane-gas.png",
            base_color = { r = 0.5, g = 0.5, b = 1, a = 1 },
            flow_color = { r = 1, g = 1, b = 1, a = 0 },
            default_temperature = 15,
        }
    }
end

data:extend { {
    type = "fluid",
    name = "slimy-gel",
    icon = "__dea-dia-system__/graphics/icon/slimy-gel.png",
    base_color = { r = 0.8, g = 0.67, b = 63, a = 1 },
	flow_color = { r = .27, g = .31, b = .14, a = .5 },
    default_temperature = 15,
},
    {
        default_import_location = "prosephina",
        type = "item",
        name = name,
        icon = "__dea-dia-system__/graphics/icon/" .. name .. "-1.png",
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
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. name .. "-4.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. name .. "-5.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. name .. "-6.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            } },
        stack_size = 10,
        spoil_result = "spoilage",
        spoil_ticks = 36000,
    },
    {
        default_import_location = "prosephina",
        type = "item",
        name = fiber_name,
        icon = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-1.png",
        pictures = {
            {
                filename = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            } },
        stack_size = 50,
        fuel_acceleration_multiplier = 1,
        fuel_acceleration_multiplier_quality_bonus = 1.1,
        fuel_category = "chemical",
        fuel_top_speed_multiplier = 1,
        fuel_top_speed_multiplier_quality_bonus = 1.4,
        fuel_value = "1MJ",
    },
    {
        default_import_location = "prosephina",
        type = "item",
        name = rubber_name,
        icon = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-1.png",
        pictures = {
            {
                filename = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-4.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            }
        },
        stack_size = 50
    },
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = "slime-weed-processing",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/slimy-gel.png",
            },
            {
                icon = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-1.png",
            }
        },
        energy_required = 25,
        ingredients = {
            { type = "item", name = name, amount = 5 }
        },
        results = {
            { type = "item",  name = "fiber",     amount = 3 },
            { type = "fluid", name = "slimy-gel", amount = 50 },
        }
    },
    {
        type = "recipe",
        category = "hydroponics",
        name = "slimeweed-farming",
        result_is_always_fresh = true,
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/" .. name .. "-4.png"
            }
        },
        energy_required = 25,
        ingredients = {
            { type = "item", name = name, amount = 1 },
            { type = "fluid", name = "mineral-water", amount = 1000 }
        },
        results = {
            { type = "item", name = name, amount = 2 }
        }
    },
    {
        type = "recipe",
        category = "hydroponics",
        name = "slimeweed-sulfur-filtering",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/" .. name .. "-4.png"
            },
            {
                icon = "__base__/graphics/icons/sulfur.png",
            }
        },
        energy_required = 25,
        ingredients = {
            { type = "item", name = name, amount = 1 },
            { type = "item", name = "carbon", amount = 3 },
            { type = "fluid", name = "mineral-water", amount = 500 }
        },
        results = {
            { type = "item", name = "sulfur", amount = 2 }
        }
    }
    ,
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = "gel-methane-processing",
        icons =
        {
            -- if we use methane from another mod then we want their icon.
            {
                icon = "__dea-dia-system__/graphics/icon/methane-gas.png",
            }
        },
        energy_required = 40,
        ingredients = {
            { type = "fluid", name = "slimy-gel", amount = 20 }
        },
        results = {
            { type = "fluid", name = methane_name, amount = 10 },
        }
    },
    
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = "gel-plastic",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/slimy-gel.png",
            },
            {
                icon = "__base__/graphics/icons/plastic-bar.png",
            }
        },
        energy_required = 40,
        ingredients = {
            { type = "fluid", name = methane_name, amount = 30 },
            { type = "item",  name = fiber_name,   amount = 1 }
        },
        results = {
            { type = "item", name = "plastic-bar", amount = 1 },
        }
    },
    {
        type = "recipe",
        category = "heating-or-chemistry",
        name = "gel-rubber",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/" .. rubber_name .. "-1.png",
            }
        },
        auto_recycle = false,
        energy_required = 40,
        ingredients = {
            { type = "fluid", name = "slimy-gel", amount = 40 },
            { type = "item", name = "carbon",    amount = 1 },
            { type = "item", name = "sulfur",  amount = 1 }
        },
        results = {
            { type = "item", name = rubber_name, amount = 2 },
        }
    },
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = "gel-rocket-fuel",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/slimy-gel.png",
                scale = .4,
                shift = {
                    x =16,
                    y =16
                }
            },
            {
                icon = data.raw["item"]["rocket-fuel"].icon,
            }
        },
        energy_required = 40,
        ingredients = {
            { type = "fluid", name = "slimy-gel", amount = 100 },
            { type = "fluid", name = methane_name,    amount = 10 },
        },
        results = {
            { type = "item", name = "rocket-fuel", amount = 1 },
        }
    },
    {
        type = "recipe",
        category = "oil-processing",
        name = "gel-polymerization",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/gel-polymerization.png",
            }
        },
        energy_required = 40,
        ingredients = {
            { type = "fluid", name = "slimy-gel", amount = 1000 },
            { type = "fluid", name = "steam", amount = 50 }
        },
        results = {
            { type = "item", name = fiber_name, amount = 1 }
        }
    },
    {
        type = "recipe",
        category = "smelting",
        name = "fiber-carbon",
        icons =
        {
            {
                icon = "__dea-dia-system__/graphics/icon/" .. fiber_name .. "-1.png",
            },
            {
                icon = "__space-age__/graphics/icons/carbon.png",
            }
        },
        energy_required = 3000,
        ingredients = {

            { type = "item", name = fiber_name,    amount = 4 },
        },
        results = {
            { type = "item", name = "carbon", amount = 1 },
        }
    },
    {
        type = "technology",
        name = "slimeweed-processing",

        icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
        icon_size = 256,
        research_trigger = {
            type = "craft-item",
            item = name,
            count = 100
        },
        prerequisites = {
            "prosephina-greenhouse"
        },
        effects = {
            {
                type   = "unlock-recipe",
                recipe = "slime-weed-processing"
            }
        }
    },
    {
        type = "technology",
        name = "slimeweed-farming",
        research_trigger = {
            type = "craft-fluid",
            fluid = "slimy-gel",
            count = 1000
        },
        prerequisites = {
            "slimeweed-processing"
        },
        icon = "__dea-dia-system__/graphics/icon/slimeweed-farming.png",
        icon_size = 256,
        effects = {
            {
                type   = "unlock-recipe",
                recipe = "slimeweed-farming"
            }
        }
    },
    {
        type = "technology",
        name = "slimeweed-material-processing",

        icon = "__dea-dia-system__/graphics/icon/slimeweed-material-processing.png",
        icon_size = 256,
        research_trigger = {
            type = "craft-item",
            item = fiber_name,
            count = 30
        },
        prerequisites = {
            "slimeweed-processing"
        },
        effects = {
            {
                type   = "unlock-recipe",
                recipe = "gel-plastic"
            },
            {
                type   = "unlock-recipe",
                recipe = "gel-lube"
            },
            {
                type   = "unlock-recipe",
                recipe = "slimeweed-sulfur-filtering"
            },
            {
                type   = "unlock-recipe",
                recipe = "gel-rocket-fuel"
            },{
                type   = "unlock-recipe",
                recipe = "gel-methane-processing"
            }
        }
    },
    {
        type = "technology",
        name = "gel-polymerization",

        icon = "__dea-dia-system__/graphics/icon/gel-polymerization-tech-icon.png",
        icon_size = 256,
        prerequisites = {
            "production-science-pack",
            "slimeweed-material-processing",
            "insulation-science-pack"
        },unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 },{ "chemical-science-pack", 1 }, {"production-science-pack", 1}, { "insulation-science-pack", 1 } },
            time = 10,
            count = 80,
        },
        effects = {
            {
                type   = "unlock-recipe",
                recipe = "gel-polymerization"
            },
            {
                type   = "unlock-recipe",
                recipe = "fiber-carbon"
            }
        }
    },
}
