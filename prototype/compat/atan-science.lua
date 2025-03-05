if mods["atan-nuclear-science"] then
    table.insert(data.raw["technology"]["frontrider-enrichment-process"].unit.ingredients,(#data.raw["technology"]["frontrider-enrichment-process"].unit.ingredients)+1,{
        "nuclear-science-pack",1
    })
end