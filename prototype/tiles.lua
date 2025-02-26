local resource_autoplace = require("resource-autoplace")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout


local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64 * 9
      },
      side =
      {
        count = 8,
        x = 64 * 9 * 2
      },
      u_transition =
      {
        count = 1,
        x = 64 * 9 * 3
      },
      o_transition =
      {
        count = 1,
        x = 64 * 9 * 4
      }
    }
  }
end


local sea_sand_transition =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/sand.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = { "out-of-map", "empty-space", "oil-ocean-shallow" },
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local sea_tile = table.deepcopy(data.raw["tile"]["water-shallow"])


sea_tile.layer_group = "water-overlay"
sea_tile.autoplace = table.deepcopy(data.raw["tile"]["water"].autoplace)

sea_tile.name = "primal-sea"

sea_tile.default_cover_tile = "landfill"
sea_tile.variants.transition = transition_masks()
sea_tile.transitions = table.deepcopy(data.raw.tile["water"].transitions)
sea_tile.transitions_between_transitions = table.deepcopy(data.raw.tile["water"].transitions_between_transitions)


data:extend({
  { type = "collision-layer", name = "shallow_water_tile" },
  { type = "collision-layer", name = "atmospheric-clouds" },
})

sea_tile.collision_mask = {
  layers = {
    resource = true,
    floor = true,
    shallow_water_tile = true,
    is_object = true
  }
}

data:extend {
  {
    type = "fluid",
    name = "mineral-water",
    icon = "__dea-dia-system__/graphics/icon/mineral-water.png",
    base_color = { r = 0.17, g = 0.23, b = .23, a = 1 },
    flow_color = { r = .76, g = .76, b = .72, a = .5 },
    default_temperature = 60,
  }
}

sea_tile.fluid = "mineral-water"

sea_tile.layer_group = "water"
local ice_rock_huge = table.deepcopy(data.raw["simple-entity"]["lithium-iceberg-huge"])
ice_rock_huge.name = "ice-rock-huge"
local ice_rock_medium = table.deepcopy(data.raw["simple-entity"]["lithium-iceberg-big"])
ice_rock_medium.name = "ice-rock-medium"

ice_rock_huge.minable.results = {
  { type = "item", name = "ice",        amount_min = 10, amount_max = 12 },
  { type = "item", name = "iron-ore",   amount_min = 10, amount_max = 12 },
  { type = "item", name = "copper-ore", amount_min = 10, amount_max = 12 },
  { type = "item", name = "coal",       amount_min = 1,  amount_max = 3 }
}
ice_rock_medium.minable.results = {
  { type = "item", name = "ice",        amount_min = 8, amount_max = 10 },
  { type = "item", name = "iron-ore",   amount_min = 7, amount_max = 10 },
  { type = "item", name = "copper-ore", amount_min = 7, amount_max = 10 }
}


data:extend {
  sea_tile, ice_rock_huge, ice_rock_medium
}

data.extend {
  {
    type = "collision-layer",
    name = "gas-giant-surface"
  }
}


local dae_dia_surface = table.deepcopy(data.raw["tile"]["empty-space"])

dae_dia_surface.name = "dea-dia-surface"
dae_dia_surface.effect = nil
dae_dia_surface.map_color = {
  0.57, 0.42, 0.47, 1.0
}

dae_dia_surface.collision_mask = {
  layers = {
    is_object = true,
    is_lower_object = true,
    transport_belt = true,
    elevated_rail = true,
    elevated_train = true,
    ["gas-giant-surface"] = true
  }
}

dae_dia_surface.destroys_dropped_items = true
dae_dia_surface.variants = {
  empty_transitions = true,
  main = {
    {
      count = 1,
      picture = "__dea-dia-system__/graphics/tiles/dae-dia.png",
      size = 1
    }
  }
}


data:extend {
  dae_dia_surface,
  {
    autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "gas-giant-cloud-3",
          order = "s",
          base_density = 4,
          base_spots_per_km = 3,
          has_starting_area_placement = false,
          regular_rq_factor_multiplier = 1.10,
          starting_rq_factor_multiplier = 2,
          candidate_spot_count = 20,
          tile_restriction= {
            "dea-dia-surface"
          }
        },
    type = "optimized-decorative",
    name = "gas-giant-cloud-3",
    pictures = {
      sheet = {
        filename = "__dea-dia-system__/graphics/decorative/cloud-3.png",
        width = 128,
        height = 56,
        variation_count = 1,
        scale = 1.0
      }
    }
  },
  {
    autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "gas-giant-cloud-2",
          order = "s",
          base_density = 4,
          base_spots_per_km = 1,
          has_starting_area_placement = false,
          regular_rq_factor_multiplier = 1.10,
          starting_rq_factor_multiplier = 2,
          candidate_spot_count = 20,
          tile_restriction= {
            "dea-dia-surface"
          }
        },
    type = "optimized-decorative",
    name = "gas-giant-cloud-2",
    pictures = {
      sheet = {
        filename = "__dea-dia-system__/graphics/decorative/cloud-2.png",
        width = 419,
        height = 256,
        variation_count = 1,
        scale = 1.0
      }
    }
  },
  {
    autoplace =resource_autoplace.resource_autoplace_settings{
      name = "gas-giant-cloud-1",
      order = "s",
      base_density = 1,
      base_spots_per_km = 1,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 2,
      candidate_spot_count = 20,
      tile_restriction= {
        "dea-dia-surface"
      }
    },
    type = "optimized-decorative",
    name = "gas-giant-cloud-1",
    pictures = {
      sheet = {
        filename = "__dea-dia-system__/graphics/decorative/cloud-1.png",
        width = 577,
        height = 256,
        variation_count = 1,
        scale = 1
      }
    }
  }
}

local tile = table.deepcopy(data.raw.tile["space-platform-foundation"])
tile.name = "dae-dia-gas-platform-tile"
tile.collision_mask = { layers = { ground_tile = true } }
tile.map_color = { r = 0.0, g = 0.0, b = 0.0 }
tile.can_be_part_of_blueprint = false
tile.layer_group = "ground-artificial"
tile.allows_being_covered = false

tile.variants.transition = table.deepcopy(data.raw.tile["concrete"].variants.transition)
data:extend { tile }
