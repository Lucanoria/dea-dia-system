data:extend {
  {
    type = "technology", lignumis_skip_science_packs = true,
    name = "slimeweed-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__dea-dia-system__/graphics/icon/slimeweed-processing.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "gel-polymerization",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "slime-weed-processing",
        change = 0.1
      }
    },
    prerequisites = { "gel-polymerization" },
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "insulation-science-pack", 1 },
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    lignumis_skip_science_packs = true,
    name = "slimeweed-ore-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__dea-dia-system__/graphics/icon/slimeweed-ore-productivity-tech-icon.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "soil-leeching-iron",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "soil-leeching-copper",
        change = 0.1
      }
    },
    prerequisites = { "insulation-science-pack", "production-science-pack" },
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "insulation-science-pack", 1 },
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology", 
    name = "coolant-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__dea-dia-system__/graphics/icon/coolant-productivity-tech-icon.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "fluoroketone",
        change = 0.1
      }
    },
    prerequisites = { "thermodynamic-science-pack", "advanced-oil-processing", "coal-liquefaction", "production-science-pack" , "cryogenic-science-pack"},
    unit =
    {
      count_formula = "1.7^L*1250",
      ingredients =
      {
        { "automation-science-pack",    1 },
        { "logistic-science-pack",      1 },
        { "chemical-science-pack",      1 },
        { "production-science-pack",    1 },
        { "thermodynamic-science-pack", 1 },
        { "cryogenic-science-pack",     1 },
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  }
}
