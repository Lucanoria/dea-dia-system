local large_power_pole = table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

large_power_pole.name = "large-electric-pole"
large_power_pole.collision_mask = {
    layers = {
        elevated_rail = true,
        object = true,
        cliff = true
    }
}
large_power_pole.icon = "__dea-dia-system__/graphics/icon/large-electric-pole.png"
large_power_pole.maximum_wire_distance = 64
large_power_pole.collision_box = { { -3.5, -3 }, { 2.5, 3 } }
large_power_pole.selection_box = { { -3.5, -3 }, { 2.5, 3 } }
large_power_pole.minable.result = large_power_pole.name

large_power_pole.pictures = {
    layers = {
        {
            direction_count = 4,
            filename = "__dea-dia-system__/graphics/entity/large-electric-pole.png",
            height = 500,
            width = 2000 / 4,
            --scale=.9,
            priority = "extra-high",
            --shift = {1.6, -1.1}
        }
    }
}
large_power_pole.connection_points =
{
  {
    shadow =
    {
      copper = { 5.8125, 3.375 },
      green = { 5.8125, 3.375 },
      red = { 5.8125, 3.375 }
    },
    wire =
    {
      copper = { -0.65625, -1.25 },
      green = { 3.375, -1.25 },
      red = { -4.6875, -1.25 }
    }
  },
  {
    shadow =
    {
      copper = { 2, 3.3125 },
      green = { 4.78125, 4.65625 },
      red = { -0.75, 2.03125 }
    },
    wire =
    {
      copper = { -0.6875, -1.1875 },
      green = { 2.09375, 0.125 },
      red = { -3.5, -2.53125 }
    }
  },
  {
    shadow =
    {
      copper = { 2.03125, 3.34375 },
      green = { 1.9375, 5.1875 },
      red = { 2.15625, 1.5 }
    },
    wire =
    {
      copper = { -0.625, -2.8125 },
      green = { -0.78125, 0.53125 },
      red = { -0.5625, -4.1875 }
    }
  },
  {
    shadow =
    {
      copper = { 2, 3.375 },
      green = { -0.9375, 4.5625 },
      red = { 4.96875, 2.09375 }
    },
    wire =
    {
      copper = { -0.6875, -1.1875 },
      green = { -3.65625, 0.0625 },
      red = { 2.28125, -2.46875 }
    }
  }
}
large_power_pole.supply_area_distance = 0

data:extend {
    {
        default_import_location = "prosephina",
        type = "item",
        name = large_power_pole.name,
        icon = large_power_pole.icon,
        icon_size = 64,
        place_result = large_power_pole.name,
        stack_size = 50,
        scale = 0.5,
    },
    large_power_pole,
    {
        type = "recipe",
        category = "heating-or-assembling",
        name = large_power_pole.name,
        enabled = false,
        icon = large_power_pole.icon,
        ingredients = {
            { type = "item", name = "rubber",      amount = 6 },
            { type = "item", name = "steel-plate", amount = 5 },
            { type = "item", name = "concrete",    amount = 4 },
            { type = "item", name = "copper-cable", amount = 16 },
        },
        results =
        {
            { type = "item", name = large_power_pole.name, amount = 1 }
        }
    },
    {
        type = "technology",
        name = large_power_pole.name,
        icon = "__dea-dia-system__/graphics/icon/large-electric-pole-tech-icon.png",
        icon_size = 256,
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "utility-science-pack", 1 }, { "chemical-science-pack", 1 }, { "insulation-science-pack", 1 } },
            time = 10,
            count = 40,
        },
        prerequisites = {
            "insulation-science-pack"
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = large_power_pole.name
            }
        }
    }
}
