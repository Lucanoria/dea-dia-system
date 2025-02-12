-- making the animation set looks like a pain.
local insulated_belt = table.deepcopy(data.raw["transport-belt"]["fast-transport-belt"])
local insulated_underground_belt = table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"])
local insulated_splitter = table.deepcopy(data.raw["splitter-belt"]["fast-splitter"])

insulated_belt.name = "insulated-belt"
insulated_belt.heating_energy = "0J"


insulated_underground_belt.name = "insulated-underground-belt"
insulated_underground_belt.heating_energy = "0J"

insulated_belt.related_underground_belt = insulated_underground_belt.name

insulated_splitter.name = "insulated-splitter"
insulated_splitter.heating_energy = "0J"

data:extend{
    insulated_belt,insulated_splitter,insulated_underground_belt
}