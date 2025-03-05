thermodynamic_technologies = {
    "cb-cold-alien-tech", "cb-cold-alien-warfare"
}

insulation_technologies = {
    "cb-modular-armor", "cb-power-armor", "cb-power-armor-mk2", "cb-coldjet-ammo-damage-1", "cb-coldjet-ammo-damage-2"
}
table.insert(data.raw["technology"]["cb-cold-alien-tech"].prerequisites, "thermodynamic-science-pack")

for key, value in pairs(thermodynamic_technologies) do
    local tech = data.raw["technology"][value]
    if tech["unit"] ~= nil then
        table.insert(data.raw["technology"][value].unit.ingredients, { "thermodynamic-science-pack", 1 })
    end
end

for key, value in pairs(insulation_technologies) do
    local tech = data.raw["technology"][value]
    if tech["unit"] ~= nil then
        table.insert(data.raw["technology"][value].unit.ingredients, { "insulation-science-pack", 1 })
        table.insert(data.raw["technology"][value].unit.ingredients, { "thermodynamic-science-pack", 1 })
    end
end

-- updating autoplace controls
local nauvis = data.raw.planet.nauvis
if nauvis ~= nil then
    nauvis.map_gen_settings.autoplace_controls["frost_enemy_base"] = nil
end


local aquilo = data.raw.planet.aquilo
if aquilo ~= nil then
    aquilo.pollutant_type = nil
    aquilo.map_gen_settings.autoplace_controls["frost_enemy_base"] = nil
end


-- alter cold biters subgroups, so they show up on bio processing now
data.raw["item"]["cb_alien_cold_artifact"].subgroup = "cold-biters"
data.raw["recipe"]["cb-clean-gland"].subgroup = "cold-biters"
data.raw["recipe"]["cb-cold-extract"].subgroup = "cold-biters"
data.raw["recipe"]["cb-artifact-to-oil"].subgroup = "cold-biters"
