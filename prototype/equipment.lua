data:extend {
    {
        type = "equipment-category",
        name = "flying"
    },

}
-- make the mech suit and aircraft accept flight equipment.
local grids = {
    data.raw["equipment-grid"]["huge-equipment-grid"],
    data.raw["equipment-grid"]["lex-flying-cargo-grid"],
    data.raw["equipment-grid"]["lex-flying-gunship-grid"],
    data.raw["equipment-grid"]["lex-flying-heavyship-grid"],
    data.raw["equipment-grid"]["lex-flying-heavyship-grid"]
}

for index, grid in ipairs(grids) do
    table.insert(grid.equipment_categories, #(grid.equipment_categories) + 1, "flying")
end
