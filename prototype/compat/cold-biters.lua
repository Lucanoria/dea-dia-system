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
