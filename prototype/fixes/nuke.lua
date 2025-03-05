-- taken from cerys, makes the gas giant surfaces immune to nuke spawning.
local function add_dea_dia_layers_to_masks(tbl, layer)
	if type(tbl) ~= "table" then
		return
	end

	if tbl.layers and tbl.layers.water_tile and not tbl.layers[layer] then
		tbl.layers[layer] = true
	end

	for _, v in pairs(tbl) do
		if type(v) == "table" then
			add_dea_dia_layers_to_masks(v,layer)
		end
	end
end


for _, projectile in pairs(data.raw["projectile"]) do
	add_dea_dia_layers_to_masks(projectile,"gas-platform-surface")
    add_dea_dia_layers_to_masks(projectile,"gas-giant-surface")
end