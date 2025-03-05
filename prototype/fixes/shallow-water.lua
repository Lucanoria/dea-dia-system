--== shallow water collisions ==--
for _, entity in pairs(data.raw["offshore-pump"]) do
  if entity.tile_buildability_rules then
    for _, rule in pairs(entity.tile_buildability_rules) do
      if rule.required_tiles and rule.required_tiles.layers and rule.required_tiles.layers.water_tile then
        rule.required_tiles.layers.shallow_water_tile = true
        rule.required_tiles.layers["gas-giant-surface"] = true
      end
      if rule.colliding_tiles and rule.colliding_tiles.layers and rule.colliding_tiles.layers.water_tile then
        rule.colliding_tiles.layers.shallow_water_tile = true
        rule.colliding_tiles.layers["gas-giant-surface"] = true
      end
    end
  end
end

local assemblers = { "assembling-machine", "furnace", "rocket-silo" }

--== shallow water collisions for assemblers==--
for _, name in pairs(assemblers) do
  for _, entity in pairs(data.raw[name]) do
    if entity.tile_buildability_rules then
      for _, rule in pairs(entity.tile_buildability_rules) do
        if rule.colliding_tiles and rule.colliding_tiles.layers and rule.colliding_tiles.layers.water_tile then
          rule.colliding_tiles.layers.shallow_water_tile = true
        end
      end
    end
  end
end
