local resource_autoplace = require("resource-autoplace")

data:extend {
  {
    type = "fluid",
    name = "natrocarbonatite",
    icon = "__dea-dia-system__/graphics/icon/natrocarbonatite.png",
    base_color = { r = 0.59, g = 0.35, b = .24, a = 1 },
    flow_color = { r = .32, g = .21, b = .15, a = .5 },
    default_temperature = 300,
  }
}

local natrocarbonatite = table.deepcopy(data.raw["resource"]["crude-oil"])

natrocarbonatite.autoplace = resource_autoplace.resource_autoplace_settings {
  name = "natrocarbonatite",
  order = "c",     -- Other resources are "b"; oil won't get placed if something else is already there.
  base_density = 20,
  base_spots_per_km2 = .5,
  random_probability = 1 / 64,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,     -- don't randomize spot size
  additional_richness = 220000,     -- this increases the total everywhere, so base_density needs to be decreased to compensate
  has_starting_area_placement = false,
  regular_rq_factor_multiplier = 1
}

natrocarbonatite.name = "natrocarbonatite"
natrocarbonatite.icon = "__dea-dia-system__/graphics/icon/natrocarbonatite.png"
natrocarbonatite.minable.results[1].name = "natrocarbonatite"

data:extend { natrocarbonatite,
  {
    category = "resource",
    localised_name = { "natrocarbonatite" },
    name = "natrocarbonatite",
    order = "b-d",
    richness = true,
    type = "autoplace-control"
  }
}
