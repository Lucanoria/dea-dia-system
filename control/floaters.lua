-- make the nests indestructible.
script.on_event(defines.events.on_script_trigger_effect,function(event)
    if event.effect_id ~= "floater-nest-spawned" then return end
    event.source_entity.destructible = false
end)