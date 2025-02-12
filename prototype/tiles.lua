local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

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

if mods["Cerys-Moon-of-Fulgora"] ~= nil then
  sea_tile.collision_mask = {
    layers = {
      resource = true,
      floor = true,
      cerys_water_tile = true
    }
  } 
else
  data:extend({
    { type = "collision-layer", name = "shallow_water_tile" },
  })
  
  sea_tile.collision_mask = {
    layers = {
      resource = true,
      floor = true,
      shallow_water_tile = true
    }
  } 
end
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
sea_tile.transitions = sea_sand_transition

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


data:extend {
  {
    type = "tile-effect",
    name = "dae-dia-winds",
    shader = "water",
    water = {
      shader_variation = "water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 1,
      secondary_texture_variations_rows = 1,


      animation_speed = 0.8,
      animation_scale = { 0.40, 0.68 },
      tick_scale = 6,

      specular_lightness = { 4, 10, 1 },
      foam_color = { 8, 2, 2 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.0, 0.2 },
      reflection_threshold = { 3, 2 },
      specular_threshold = { 0.0, 0.0 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  }, {
  name = "dae-dia-winds",
  type = "tile",
  order = "z[other]-b[empty-space]",
  subgroup = "special-tiles",
  collision_mask =
  {
    layers =
    {
      ground_tile = true,
      water_tile = true,
      empty_space = true,
      resource = true,
      floor = true,
      item = true,
      object = true,
      doodad = true
    },
  },
  layer_group = "zero",
  layer = 0,
  effect = "dae-dia-winds",
  effect_color = { 0.5, 0.507, 0 },
  effect_color_secondary = { 0, 68, 25 },
  particle_tints =
  {
    primary = { 0, 0, 0, 0 },
    secondary = { 0, 0, 0, 0 },
  },
  variants =
  {
    main =
    {
      {
        picture = "__space-age__/graphics/terrain/empty-space.png",
        count = 1,
        size = 1
      }
    },
    empty_transitions = true
  },
  map_color = { 0, 0, 0 },
  absorptions_per_second = tile_pollution.out_of_map,
  autoplace = { probability_expression = 1 },
  default_cover_tile = "space-platform-foundation"
},
}
