local sounds = require("__base__.prototypes.entity.sounds")
local covers = {
  north = {
    layers = {
      {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe-covers/steel-pipe-cover-north.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  east = {
    layers = {
      {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe-covers/steel-pipe-cover-east.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  south = {
    layers = {
      {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe-covers/steel-pipe-cover-south.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  west = {
    layers = {
      {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe-covers/steel-pipe-cover-west.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
}

local collision_mask = {
  layers = {
    elevated_rail = true,
    item = true,
    object = true,
    player = true,
  },
  consider_tile_transitions=true
}
data:extend({
  {
    type = "recipe",
    name = "insulated-pipe",
    enabled = false,
    category = "heating-or-assembling",
    ingredients = {
      { type = "item",  name = "pipe",      amount = 1 },
      { type = "item",  name = "rubber",    amount = 1 },
      { type = "fluid", name = "slimy-gel", amount = 50 },
    },
    results = { { type = "item", name = "insulated-pipe", amount = 1 } },
  },
  {
    type = "item",
    name = "insulated-pipe",
    icon = "__dea-dia-system__/graphics/icon/insulated-pipe.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-aa[steel-pipe]",
    place_result = "insulated-pipe",
    stack_size = 50,
  },
  {
    type = "pipe",
    name = "insulated-pipe",
    collision_mask = collision_mask,
    icon = "__dea-dia-system__/graphics/icon/insulated-pipe.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "insulated-pipe" },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.29 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    fluid_box = {
      volume = 125,
      pipe_connections = {
        { direction = defines.direction.north, position = { 0, 0 } },
        { direction = defines.direction.east,  position = { 0, 0 } },
        { direction = defines.direction.south, position = { 0, 0 } },
        { direction = defines.direction.west,  position = { 0, 0 } },
      },
      hide_connection_info = true,
    },
    max_health = 100,
    corpse = "pipe-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 50,
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = sounds.pipe,
    pictures = {
      straight_vertical_single = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-straight-vertical-single.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        scale = 0.5,
      },
      straight_vertical = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-straight-vertical.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      straight_vertical_window = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-straight-vertical-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      straight_horizontal_window = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-straight-horizontal-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      straight_horizontal = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-straight-horizontal.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      corner_up_right = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-corner-up-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      corner_up_left = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-corner-up-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      corner_down_right = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-corner-down-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      corner_down_left = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-corner-down-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      t_up = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-t-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      t_down = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-t-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      t_right = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-t-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      t_left = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-t-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      cross = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-cross.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      ending_up = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-ending-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      ending_down = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-ending-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      ending_right = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-ending-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      ending_left = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-ending-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      straight_vertical_single_visualization = data.raw.pipe.pipe.pictures.straight_vertical_single_visualization,
      straight_vertical_visualization = data.raw.pipe.pipe.pictures.straight_vertical_visualization,
      straight_vertical_window_visualization = data.raw.pipe.pipe.pictures.straight_vertical_window_visualization,
      straight_horizontal_window_visualization = data.raw.pipe.pipe.pictures.straight_horizontal_window_visualization,
      straight_horizontal_visualization = data.raw.pipe.pipe.pictures.straight_horizontal_visualization,
      corner_up_right_visualization = data.raw.pipe.pipe.pictures.corner_up_right_visualization,
      corner_up_left_visualization = data.raw.pipe.pipe.pictures.corner_up_left_visualization,
      corner_down_right_visualization = data.raw.pipe.pipe.pictures.corner_down_right_visualization,
      corner_down_left_visualization = data.raw.pipe.pipe.pictures.corner_down_left_visualization,
      t_up_visualization = data.raw.pipe.pipe.pictures.t_up_visualization,
      t_down_visualization = data.raw.pipe.pipe.pictures.t_down_visualization,
      t_right_visualization = data.raw.pipe.pipe.pictures.t_right_visualization,
      t_left_visualization = data.raw.pipe.pipe.pictures.t_left_visualization,
      cross_visualization = data.raw.pipe.pipe.pictures.cross_visualization,
      ending_up_visualization = data.raw.pipe.pipe.pictures.ending_up_visualization,
      ending_down_visualization = data.raw.pipe.pipe.pictures.ending_down_visualization,
      ending_right_visualization = data.raw.pipe.pipe.pictures.ending_right_visualization,
      ending_left_visualization = data.raw.pipe.pipe.pictures.ending_left_visualization,
      straight_vertical_single_disabled_visualization = data.raw.pipe.pipe.pictures
          .straight_vertical_single_disabled_visualization,
      straight_vertical_disabled_visualization = data.raw.pipe.pipe.pictures.straight_vertical_disabled_visualization,
      straight_vertical_window_disabled_visualization = data.raw.pipe.pipe.pictures
          .straight_vertical_window_disabled_visualization,
      straight_horizontal_window_disabled_visualization = data.raw.pipe.pipe.pictures
          .straight_horizontal_window_disabled_visualization,
      straight_horizontal_disabled_visualization = data.raw.pipe.pipe.pictures
          .straight_horizontal_disabled_visualization,
      corner_up_right_disabled_visualization = data.raw.pipe.pipe.pictures.corner_up_right_disabled_visualization,
      corner_up_left_disabled_visualization = data.raw.pipe.pipe.pictures.corner_up_left_disabled_visualization,
      corner_down_right_disabled_visualization = data.raw.pipe.pipe.pictures.corner_down_right_disabled_visualization,
      corner_down_left_disabled_visualization = data.raw.pipe.pipe.pictures.corner_down_left_disabled_visualization,
      t_up_disabled_visualization = data.raw.pipe.pipe.pictures.t_up_disabled_visualization,
      t_down_disabled_visualization = data.raw.pipe.pipe.pictures.t_down_disabled_visualization,
      t_right_disabled_visualization = data.raw.pipe.pipe.pictures.t_right_disabled_visualization,
      t_left_disabled_visualization = data.raw.pipe.pipe.pictures.t_left_disabled_visualization,
      cross_disabled_visualization = data.raw.pipe.pipe.pictures.cross_disabled_visualization,
      ending_up_disabled_visualization = data.raw.pipe.pipe.pictures.ending_up_disabled_visualization,
      ending_down_disabled_visualization = data.raw.pipe.pipe.pictures.ending_down_disabled_visualization,
      ending_right_disabled_visualization = data.raw.pipe.pipe.pictures.ending_right_disabled_visualization,
      ending_left_disabled_visualization = data.raw.pipe.pipe.pictures.ending_left_disabled_visualization,
      horizontal_window_background = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-horizontal-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      vertical_window_background = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-vertical-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      fluid_background = {
        filename = "__base__/graphics/entity/pipe/fluid-background.png",
        priority = "extra-high",
        width = 64,
        height = 40,
        scale = 0.5,
      },
      low_temperature_flow = {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 18,
      },
      middle_temperature_flow = {
        filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 18,
      },
      high_temperature_flow = {
        filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 18,
      },
      gas_flow = {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1,
      },
    },
    horizontal_window_bounding_box = { { -0.25, -0.28125 }, { 0.25, 0.15625 } },
    vertical_window_bounding_box = { { -0.28125, -0.5 }, { 0.03125, 0.125 } },
  },
})


data:extend({
  {
    type = "recipe",
    name = "insulated-pipe-to-ground",
    category = "heating-or-assembling",
    enabled = false,
    ingredients = {
      { type = "item",  name = "pipe-to-ground", amount = 1 },
      { type = "item",  name = "rubber",         amount = 10 },
      { type = "fluid", name = "slimy-gel",      amount = 500 },
      { type = "item",  name = "fiber",          amount = 5 },
    },
    results = { { type = "item", name = "insulated-pipe-to-ground", amount = 2 } },
  },
  {
    type = "item",
    name = "insulated-pipe-to-ground",
    icon = "__dea-dia-system__/graphics/icon/insulated-pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[insulated-pipe-to-ground]",
    place_result = "insulated-pipe-to-ground",
    stack_size = 50,
  },
  {
    type = "pipe-to-ground",
    name = "insulated-pipe-to-ground",
    collision_mask = collision_mask,
    icon = "__dea-dia-system__/graphics/icon/insulated-pipe-to-ground.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "insulated-pipe-to-ground" },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.2 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    fluid_box = {
      volume = 125,
      pipe_covers = covers,
      pipe_connections = {
        { flow_direction = "input-output", direction = defines.direction.north, position = { 0, 0 } },
        {
          flow_direction = "input-output",
          direction = defines.direction.south,
          position = { 0, 0 },
          connection_type = "underground",
          max_underground_distance = 8,
        },
      },
      hide_connection_info = true,
    },
    max_health = 100,
    corpse = "pipe-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 60,
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = sounds.pipe,
    pictures = {
      north = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      south = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      west = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      east = {
        filename = "__dea-dia-system__/graphics/entity/insulated-pipe/steel-pipe-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
    },
    visualization = data.raw["pipe-to-ground"]["pipe-to-ground"].visualization,
  },
})

data:extend { {
  type = "technology",
  name = "insulated-pipe",
  prerequisites = {
    "insulation-science-pack"
  },
  icon = "__dea-dia-system__/graphics/icon/insulated-pipe-tech-icon.png",
  icon_size = 256,
  unit = {
    ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 },{ "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "insulation-science-pack", 1 } },
    time = 10,
    count = 20,
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "insulated-pipe"
    },
    {
      type = "unlock-recipe",
      recipe = "insulated-pipe-to-ground"
    }
  }
} }
