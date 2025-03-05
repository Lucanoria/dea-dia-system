-- determine if the current entity is an aircraft.
local function is_aircraft(entity)
    if entity == nil then
       game.print("spidertron was null when checking for an aircraft!")
       return false 
    end
    return  entity.name == "lex-flying-cargo" or entity.name == "lex-flying-gunship" or entity.name == "lex-flying-heavyship"
end

remote.add_interface("dea_dia_system", {
    is_aircraft = is_aircraft
})

-- teleport the aircraft when it reached the correct waypoint.

script.on_event("on_spidertron_patrol_waypoint_reached", function(event)
    if event.waypoint.type ~= "liftoff" then return end

    local aircraft = event.spidertron

    local old_surface = aircraft.surface 
    local old_position = aircraft.position
    -- flight checklist
        -- check if the target surface is generated
        -- check for passenger
        -- check for enough boosters
        -- check for soiling cargo
    --teleport
        -- go to 0,0 on the target surface

    --notify spidertron patrols about it.
    script.raise_event("dea-dia-on-landed", {
        entity = aircraft,
        old_surface_index = old_surface.index,
        old_position = old_position
    })

end)