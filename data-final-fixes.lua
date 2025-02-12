--ensure that we don't convert the slimy gel into jelly.
local stack_inserter_recycling = data.raw["recipe"]["stack-inserter-recycling"]

stack_inserter_recycling.results = {
    {
      amount = 0.25,
      extra_count_fraction = 0.25,
      name = "bulk-inserter",
      type = "item"
    },
    {
      amount = 0.25,
      extra_count_fraction = 0.25,
      name = "processing-unit",
      type = "item"
    },
    {
      amount = 0.5,
      extra_count_fraction = 0.5,
      name = "carbon-fiber",
      type = "item"
    }
  }

--delete one level of belt capacity.
--this may cause issues.
data.raw["technology"]["transport-belt-capacity-2"] = nil



--== shallow water collisions ==--
if mods["Cerys-Moon-of-Fulgora"] == nil then
for _, entity in pairs(data.raw["offshore-pump"]) do
	if entity.tile_buildability_rules then
		for _, rule in pairs(entity.tile_buildability_rules) do
			if rule.required_tiles and rule.required_tiles.layers and rule.required_tiles.layers.water_tile then
				rule.required_tiles.layers.shallow_water_tile = true
			end
			if rule.colliding_tiles and rule.colliding_tiles.layers and rule.colliding_tiles.layers.water_tile then
				rule.colliding_tiles.layers.shallow_water_tile = true
			end
		end
	end
end
end