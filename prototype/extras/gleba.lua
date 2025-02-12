data:extend {

  {
    type = "technology",
    name = "stack-inserter-from-gel",
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
        { "insulation-science-pack",      1 }
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
    type = "technology",
    name = "gel-inserter-capacity-bonus",
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
        { "insulation-science-pack",      1 }
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "carbon-fiber-from-gel",
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
        { "insulation-science-pack",      1 }
      },
      time = 60
    },
    upgrade = true
  }, {
  type = "recipe",
  name = "carbon-fiber-from-gel",
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
  energy_required = 0.5,
  category = "heating",
  ingredients =
  {
    { type = "item",  name = "fiber",   amount = 20 },
    { type = "fluid", name = "methane", amount = 400 }
  },
  results = { { type = "item", name = "carbon-fiber", amount = 2 } }
}
}
