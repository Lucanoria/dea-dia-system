-- remove the tech from the silo.
local silo_tech = data.raw["technology"]["rocket-silo"]

for index, value in ipairs(silo_tech.effects) do
    if value.recipe == "space-solar-panel" then
        table.remove(silo_tech.effects, index)
        return
    end
end

data:extend {
    {
        type = "technology",
        lignumis_skip_science_packs = true,
        name = "space-solar-panel",
        icon = "__space-panels__/graphics/panel-icon.png",
        icon_size = 256,
        essential = false,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "space-solar-panel"
            }
        },
        prerequisites = {
            "planet-discovery-dea-dia", "solar-energy"
        },
        unit = {
            count = 250,
            ingredients = {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "insulation-science-pack",    1 },
                { "thermodynamic-science-pack", 1 },
                { "aerospace-science-pack",     1 }
            },
            time = 60,
        },
        order = "d[solar]-e[solar-panel]",
    }

}
