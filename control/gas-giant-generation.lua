
-- spawn the fake "wind tiles" on all chunks
script.on_event(defines.events.on_chunk_generated, function(event)
    if event.surface.name == "planet-dea-dia" then
        for x = event.area.left_top.x, event.area.right_bottom.x, 2 do 
            for y = event.area.left_top.y, event.area.right_bottom.y, 2 do 
                event.surface.create_entity{
                    name= "dae-dia-winds-1",
                    position = {x,y}
                }
            end
        end
    end
end)