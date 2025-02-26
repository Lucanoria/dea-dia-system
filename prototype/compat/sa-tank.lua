local technology = data.raw["technology"]
-- move the atomic tank into lemures.
local tank_tech = technology["sa-atomic-tank"]

-- make lignumis ignore this.
tank_tech.lignumis_skip_science_packs = true

local increase_tech_1 = {}
local increase_tech_2 = {}
local increase_tech_3 = {
    technology["t1atom-damage-increase-7"],
    technology["t1atom-shooting-speed-7"]
}

for i = 1, 3, 1 do
    local damage_tech = technology["t1atom-damage-increase-".. tostring(i)]
    table.insert(increase_tech_1,#increase_tech_1+1,damage_tech)
    table.insert(increase_tech_1,#increase_tech_1+1,technology["t1atom-shooting-speed-".. tostring(i)]) 
end

for i = 4, 6, 1 do
    table.insert(increase_tech_2,#increase_tech_2+1,technology["t1atom-damage-increase-".. tostring(i)])
    table.insert(increase_tech_2,#increase_tech_2+1,technology["t1atom-shooting-speed-".. tostring(i)])
end

local tank_cost = tank_tech.unit.ingredients
local tank_requirements = tank_tech.prerequisites

table.insert(tank_cost,#tank_cost+1,{"thermodynamic-science-pack",1})
table.insert(tank_requirements,#tank_requirements+1,"thermodynamic-science-pack")

for index, tech in ipairs(increase_tech_1) do
    local cost = tech.unit.ingredients
    tech.lignumis_skip_science_packs = true
    table.insert(cost,#cost+1,{"thermodynamic-science-pack",1})
end

for index, tech in ipairs(increase_tech_2) do
    local cost = tech.unit.ingredients
    tech.lignumis_skip_science_packs = true
    table.insert(cost,#cost+1,{"thermodynamic-science-pack",1})
    table.insert(cost,#cost+1,{"insulation-science-pack",1})
end

for index, tech in ipairs(increase_tech_3) do
    local cost = tech.unit.ingredients
    local requirements = tech.prerequisites
    tech.lignumis_skip_science_packs = true
    table.insert(requirements,#requirements+1,"planet-discovery-dea-dia")
    table.insert(cost,#cost+1,{"thermodynamic-science-pack",1})
    table.insert(cost,#cost+1,{"insulation-science-pack",1})
    table.insert(cost,#cost+1,{"aerospace-science-pack",1})
end

--update recipes to use magnesium.