data:extend {
  {
    type = "technology", lignumis_skip_science_packs = true, name = "stack-inserter-from-gel",
    icons = {
      {
        icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
        icon_size = 256
      },
      {
        icon = "__space-age__/graphics/technology/stack-inserter.png",
        icon_size = 256
      }
    },
    localised_description = { "technology-description.stack-inserter" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stack-inserter-from-gel"
      },
      {
        type = "belt-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = { "bulk-inserter", "carbon-fiber-from-gel" },
    unit =
    {
      count = 1000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "utility-science-pack",    1 },
        { "space-science-pack",      1 },
        { "insulation-science-pack", 1 }
      },
      time = 60
    }
  }, {
  type = "recipe",
  name = "stack-inserter-from-gel",
  enabled = false,
  energy_required = 0.5,
  category = "crafting-with-fluid",
  ingredients =
  {
    { type = "item",  name = "bulk-inserter",   amount = 1 },
    { type = "item",  name = "processing-unit", amount = 1 },
    { type = "item",  name = "carbon-fiber",    amount = 2 },
    { type = "fluid", name = "slimy-gel",       amount = 200 }
  },
  results = { { type = "item", name = "stack-inserter", amount = 1 } }
},
  {
    type = "technology", lignumis_skip_science_packs = true, name = "gel-inserter-capacity-bonus",
    localised_name = { "technology-name.inserter-capacity-bonus" },
    localised_description = { "technology-description.inserter-capacity-bonus" },
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = { "stack-inserter-from-gel" },
    unit =
    {
      count = 2000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "utility-science-pack",    1 },
        { "space-science-pack",      1 },
        { "insulation-science-pack", 1 }
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology", lignumis_skip_science_packs = true, name = "carbon-fiber-from-gel",
    icons = { {
      icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
      icon_size = 256
    },
      {
        icon = "__space-age__/graphics/technology/carbon-fiber.png",
        icon_size = 256
      } },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "carbon-fiber-from-gel"
      }
    },
    prerequisites = { "utility-science-pack", "gel-polymerization", "prosephina-convector" },
    unit =
    {
      count = 2000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "utility-science-pack",    1 },
        { "space-science-pack",      1 },
        { "insulation-science-pack", 1 }
      },
      time = 60
    },
  }, {
  type = "recipe",
  name = "carbon-fiber-from-gel",
  subgroup = "slimeweed",
  icons = {
    {
      icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
      icon_size = 256
    },
    {
      icon = "__space-age__/graphics/icons/carbon-fiber.png",
      icon_size = 64
    } },
  enabled = false,
  allow_productivity = true,
  energy_required = 0.5,
  category = "heating",
  ingredients =
  {
    { type = "item",  name = "fiber",         amount = 20 },
    { type = "fluid", name = "petroleum-gas", amount = 400 }
  },
  results = { { type = "item", name = "carbon-fiber", amount = 2 } }
},
  {
    type = "technology",
    name = "bioflux-from-gel",
    icons = { {
      icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
      icon_size = 256
    },
      {
        icon = "__space-age__/graphics/technology/bioflux.png",
        icon_size = 256
      } },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioflux-from-gel"
      }
    },
    prerequisites = { "utility-science-pack", "gel-polymerization", "agricultural-science-pack", "planet-discovery-dea-dia" },
    unit =
    {
      count = 2000,
      ingredients =
      {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     1 },
        { "production-science-pack",   1 },
        { "utility-science-pack",      1 },
        { "space-science-pack",        1 },
        { "agricultural-science-pack", 1 },
        { "insulation-science-pack",   1 }
      },
      time = 60
    },
  }, {
  type = "recipe",
  name = "bioflux-from-gel",
  subgroup = "slimeweed",
  icons = {
    {
      icon = "__dea-dia-system__/graphics/icon/slimeweed-processing.png",
      icon_size = 256
    },
    {
      icon = "__space-age__/graphics/icons/bioflux.png",
      icon_size = 64
    }
  },
  allow_productivity = true,
  enabled = false,
  energy_required = 0.5,
  category = "organic-or-chemistry",
  ingredients =
  {
    { type = "fluid", name = "ammonia",          amount = 20 },
    { type = "fluid", name = "slimy-gel",        amount = 500 },
    { type = "item",  name = "slime-weed-bloom", amount = 2 }
  },
  results = {
    { type = "item", name = "bioflux", amount = 1 }
  }
}, {
  type = "recipe",
  name = "slimeweed-with-nutrients",
  subgroup = "slimeweed",
  allow_productivity = true,
  category = "hydroponics",
  icons = {
    {
      icon = "__dea-dia-system__/graphics/icon/slime-weed-3.png",
      icon_size = 64
    },
    {
      icon = "__space-age__/graphics/icons/nutrients.png",
      icon_size = 64,
      scale = .2,
      shift = { 16, 16 }
    }
  },
  energy_required = 15,
  ingredients = {
    { type = "item",  name = "slime-weed", amount = 1 },
    { type = "item",  name = "nutrients",  amount = 4 },
    { type = "fluid", name = "water",      amount = 200 },
  },
  results = {
    { type = "item", name = "slime-weed", amount = 8 }
  }
},
  {
    type = "technology",
    lignumis_skip_science_packs = true,
    name = "advanced-slimeweed-farming",
    subgroup = "slimeweed",
    unit = {
      count = 500,
      ingredients =
      {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     1 },
        { "production-science-pack",   1 },
        { "utility-science-pack",      1 },
        { "space-science-pack",        1 },
        { "agricultural-science-pack", 1 },
        { "insulation-science-pack",   1 },
      },
      time = 60
    },
    prerequisites = {
      "slimeweed-farming", "bioflux-from-gel"
    },
    icons = {
      {
        icon = "__space-age__/graphics/icons/nutrients.png",
        icon_size = 64,
      },
      {
        icon = "__dea-dia-system__/graphics/icon/slimeweed-farming.png",
        icon_size = 256,
        scale = .5
      }
    },
    effects = {
      {
        type   = "unlock-recipe",
        recipe = "slimeweed-with-nutrients"
      }
    }
  }
}
