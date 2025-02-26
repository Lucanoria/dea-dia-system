local function add_dea_dia_layers_to_masks(tbl)
	if type(tbl) ~= "table" then
		return
	end

	if tbl.layers and tbl.layers.water_tile and not tbl.layers["gas-giant-surface"] then
		tbl.layers["gas-giant-surface"] = true
	end

	for _, v in pairs(tbl) do
		if type(v) == "table" then
			add_dea_dia_layers_to_masks(v)
		end
	end
end

for _, projectile in pairs(data.raw["projectile"]) do
	add_dea_dia_layers_to_masks(projectile)
end