-- sidegraded productivity module, that does less but with less enegry cost and a quality downgrade.
data:extend {
  {
    type = "module-category",
    name = "spation-keeping",
    order = "s[speed]-[stationkeeping]"
  }
}

data:extend {
  {
    art_style = "vanilla",
    localised_description = {
      "item-desciption.stationkeeping-module"
    },
    beacon_tint = {
      primary = {
        0.44100000000000001,
        0.71399999999999997,
        1,
        1
      },
      secondary = {
        0.38799999999999999,
        0.97599999999999998,
        1,
        1
      }
    },
    category = "speed",
    color_hint = {
      text = "S"
    },
    drop_sound = data.raw.item["empty-module-slot"].drop_sound,
    effect = {
      consumption = 0.1,
      quality = -.5,
      speed = 0.15,
      pollution = 3,
    },
    icon = "__dea-dia-system__/graphics/icon/stationkeeping-module.png",
    inventory_move_sound = data.raw.item["empty-module-slot"].drop_sound,
    name = "stationkeeping-module",
    order = "b[speed]-a2[stationkeeping-module-1]",
    pick_sound = data.raw.item["empty-module-slot"].drop_sound,
    requires_beacon_alt_mode = false,
    stack_size = 50,
    subgroup = "module",
    tier = 1,
    type = "module",
    weight = 20000
  }, {
  art_style = "vanilla",
  localised_description = {
    "item-desciption.stationkeeping-module"
  },
  beacon_tint = {
    primary = {
      0.44100000000000001,
      0.71399999999999997,
      1,
      1
    },
    secondary = {
      0.38799999999999999,
      0.97599999999999998,
      1,
      1
    }
  },
  category = "speed",
  color_hint = {
    text = "S"
  },
  drop_sound = data.raw.item["empty-module-slot"].drop_sound,
  effect = {
    consumption = 0.2,
    quality = -.6,
    speed = 0.3,
    pollution = 5,
  },
  inventory_move_sound = data.raw.item["empty-module-slot"].drop_sound,
  name = "stationkeeping-module-2",
  order = "b[speed]-a2[stationkeeping-module-2]",
  icon = "__dea-dia-system__/graphics/icon/stationkeeping-module-2.png",
  pick_sound = data.raw.item["empty-module-slot"].drop_sound,
  requires_beacon_alt_mode = false,
  stack_size = 50,
  subgroup = "module",
  tier = 1,
  type = "module",
  weight = 20000
},
  {
    art_style = "vanilla",
    localised_description = {
      "item-desciption.stationkeeping-module"
    },
    beacon_tint = {
      primary = {
        0.44100000000000001,
        0.71399999999999997,
        1,
        1
      },
      secondary = {
        0.38799999999999999,
        0.97599999999999998,
        1,
        1
      }
    },
    category = "speed",
    color_hint = {
      text = "S"
    },
    drop_sound = data.raw.item["empty-module-slot"].drop_sound,
    effect = {
      consumption = 0.3,
      quality = -.7,
      speed = 0.45,
      pollution = 8,
    },
    icon = "__dea-dia-system__/graphics/icon/stationkeeping-module-3.png",
    inventory_move_sound = data.raw.item["empty-module-slot"].drop_sound,
    name = "stationkeeping-module-3",
    order = "b[speed]-a2[stationkeeping-module-3]",
    pick_sound = data.raw.item["empty-module-slot"].drop_sound,
    requires_beacon_alt_mode = false,
    stack_size = 50,
    subgroup = "module",
    tier = 1,
    type = "module",
    weight = 20000
  },
}

data:extend {
  {
    category = "electronics",
    energy_required = 15,
    type = "recipe",
    name = "stationkeeping-module",
    enabled = false,
    allow_productivity = false,
    order = "b[speed]-a2[stationkeeping-module-1]",
    subgroup = "module",
    ingredients =
    {
      {
        amount = 5,
        name = "advanced-circuit",
        type = "item"
      },
      {
        amount = 5,
        name = "electronic-circuit",
        type = "item"
      }
    },
    results = {
      {
        amount = 1,
        name = "stationkeeping-module",
        type = "item"
      }
    }
  }, {
  category = "electronics",
  enabled = false,
  energy_required = 30,
  order = "a[speed]-a2[stationkeeping-module-2]",
  ingredients = {
    {
      amount = 4,
      name = "stationkeeping-module",
      type = "item"
    },
    {
      amount = 5,
      name = "advanced-circuit",
      type = "item"
    },
    {
      amount = 5,
      name = "processing-unit",
      type = "item"
    }
  },
  name = "stationkeeping-module-2",
  results = {
    {
      amount = 1,
      name = "stationkeeping-module-2",
      type = "item"
    }
  },
  type = "recipe"
},
  {
    category = "electronics",
    enabled = false,
    energy_required = 60,
    ingredients = {
      {
        amount = 4,
        name = "stationkeeping-module-2",
        type = "item"
      },
      {
        amount = 5,
        name = "advanced-circuit",
        type = "item"
      },
      {
        amount = 5,
        name = "processing-unit",
        type = "item"
      },
      {
        amount = 1,
        name = "rhenium-alloy-plate",
        type = "item"
      }
    },
    name = "stationkeeping-module-3",
    results = {
      {
        amount = 1,
        name = "stationkeeping-module-3",
        type = "item"
      }
    },
    type = "recipe"
  },
  {
    type = "technology",
    ignumis_skip_science_packs = true,
    name = "stationkeeping-module",
    subgroup = "module",
    icon = "__dea-dia-system__/graphics/icon/stationkeeping-module.png",
    icon_size = 64,
    prerequisites = {
      "modules",
      "insulation-science-pack"
    }, unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "insulation-science-pack", 1 }
    },
    time = 30,
    count = 50,
  },
    effects = {
      {
        type   = "unlock-recipe",
        recipe = "stationkeeping-module"
      }
    }
  },
  {
    type = "technology",
    ignumis_skip_science_packs = true,
    name = "stationkeeping-module-2",
    subgroup = "module",
    icon = "__dea-dia-system__/graphics/icon/stationkeeping-module-2.png",
    icon_size = 64,
    prerequisites = {
      "stationkeeping-module",
      "thermodynamic-science-pack"
    }, unit = {
    ingredients = {
      { "automation-science-pack",    1 },
      { "logistic-science-pack",      1 },
      { "chemical-science-pack",      1 },
      { "insulation-science-pack",    1 },
      { "thermodynamic-science-pack", 1 }
    },
    time = 30,
    count = 200,
  },
    effects = {
      {
        type   = "unlock-recipe",
        recipe = "stationkeeping-module-2"
      }
    }
  }, {
  type = "technology",
  ignumis_skip_science_packs = true,
  name = "stationkeeping-module-3",
  subgroup = "module",
  icon = "__dea-dia-system__/graphics/icon/stationkeeping-module-3.png",
  icon_size = 64,
  prerequisites = {
    "stationkeeping-module-2",
    "planet-discovery-dea-dia"
  }, unit = {
  ingredients = {
    { "automation-science-pack",    1 },
    { "logistic-science-pack",      1 },
    { "chemical-science-pack",      1 },
    { "insulation-science-pack",    1 },
    { "thermodynamic-science-pack", 1 },
    { "aerospace-science-pack",     1 }
  },
  time = 30,
  count = 200,
},
  effects = {
    {
      type   = "unlock-recipe",
      recipe = "stationkeeping-module-3"
    }
  }
},
}
