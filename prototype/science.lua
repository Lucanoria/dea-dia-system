local meld = require("meld")


local science_pack = {
    type = "tool",
    name = "insulation-science-pack",
    stack_size = 200,
    durability = 1,
    weight = 1000,
    order = "sda[insulation-science-pack-pack]",
    subgroup = "science-pack",
}


local thermodynamic_science_pack = {
    type = "tool",
    name = "thermodynamic-science-pack",
    stack_size = 200,
    durability = 1,
    weight = 1000,
    order = "sdb[thermodynamic-science-pack-pack]",
    subgroup = "science-pack",
}

local flask = quality_glassware.request_flask(
-- Unique identifier for what this flask is used for. This is used to allow overriding it in the config.
    science_pack.name,
    {
        -- Prefer a round flask with blue liquid inside
        { model = "sphere_tubed", variant = "liquid_green" },
        -- If that's taken use the first flask shape found with blue liquid that's available.
        { variant = "liquid_lime" },
    }
)

local thermodynamic_flask = quality_glassware.request_flask(
-- Unique identifier for what this flask is used for. This is used to allow overriding it in the config.
    thermodynamic_science_pack.name,
    {
        -- Prefer a round flask with blue liquid inside
        { model = "sphere_tubed",   variant = "liquid_red" },
        -- If that's taken use the first flask shape found with blue liquid that's available.
        { variant = "liquid_orange" },
    }
)

local technology = {
    type = "technology",
    name = science_pack.name,
    research_trigger = {
        type = "craft-fluid",
        fluid = "slimy-gel",
        count = 10000
    },
    prerequisites = {
        "slimeweed-processing"
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = science_pack.name
        },
        {
            type   = "unlock-recipe",
            recipe = "gel-rubber"
        }
    }
}

local thermodynamic_technology = {
    type = "technology",
    name = thermodynamic_science_pack.name,
    prerequisites = {
        "natrocarbonatite-processing","fossil-processing"
    },
    research_trigger = {
        type = "craft-item",
        item = "magnesium-plate",
        count = 20
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = thermodynamic_science_pack.name
        }
    }
}

meld(technology, quality_glassware.technology_graphics_for(flask, meld))
meld(thermodynamic_technology, quality_glassware.technology_graphics_for(thermodynamic_flask, meld))

science_pack.icons = {
    quality_glassware.item_graphics_for(flask),
    {
        icon = "__core__/graphics/add-icon-white.png",
        icon_size = 32,
        shift = { 8, 8 },
        scale = 0.25,
    }
}
thermodynamic_science_pack.icons = {
    quality_glassware.item_graphics_for(thermodynamic_flask),
    {
        icon = "__core__/graphics/add-icon-white.png",
        icon_size = 32,
        shift = { 8, 8 },
        scale = 0.25,
    }
}
data:extend({
    {
        type = "recipe",
        category = "organic-or-chemistry",
        name = science_pack.name,
        enabled = false,
        icon = science_pack.icons[0],
        ingredients = {
            { type = "fluid", name = "slimy-gel",     amount = 200 },
            { type = "fluid", name = "mineral-water", amount = 1000 },
            { type = "item",  name = "rubber",        amount = 2 },
            { type = "item",  name = "iron-plate",    amount = 1 },
        },
        results =
        {
            { type = "item", name = science_pack.name, amount = 1 }
        }
    },
    {
        type = "recipe",
        category = "crafting-with-fluid",
        name = thermodynamic_science_pack.name,
        enabled = false,
        icon = thermodynamic_science_pack.icons[0],
        surface_conditions = {
            {
                property = "pressure",
                max = 300
            }
        },
        ingredients = {
            { type = "item", name = "lava-cake",    amount = 3 },
            { type = "fluid", name = "water",          amount = 100 },
            { type = "item", name = "magnesium-plate", amount = 2 }
        },
        results =
        {
            { type = "item", name = thermodynamic_science_pack.name, amount = 1 }
        }
    },
    science_pack, technology, thermodynamic_technology, thermodynamic_science_pack })

local lab_inputs = data.raw.lab.lab.inputs
lab_inputs[#lab_inputs + 1] = "insulation-science-pack"
lab_inputs[#lab_inputs + 1] = thermodynamic_science_pack.name
