require("control.lib")
local platform_radius = 25

local excluded_names ={ "lex-flying-gunship", "lex-flying-cargo", "lex-flying-heavyship" }

-- builds the gas collector platform after the starter was placed.
local function build_collector(entity, player)
    local surface, position, force = entity.surface, entity.position, entity.force

    -- we only need the position
    surface.create_entity({
        name = "gas-collector-roboport",
        position = position,
        force = force
    })
    --create the platform that the player will build on.
    local tiles = {}
    for x = position.x - platform_radius, position.x + platform_radius do
        for y = position.y - platform_radius, position.y + platform_radius do
            table.insert(tiles, #tiles + 1, {
                position = { x = x, y = y },
                name = "dae-dia-gas-platform-tile"
            })
        end
    end
    surface.set_tiles(tiles, true, false, true, false)
end


local function destroy_entities(surface,area)
    
    local to_be_destroyed = surface.find_entities_filtered({
        type = { "construction-robot", "logistic-robot", "following-robot" },
        name= {"lex-aircraft-leg","character"},
        area = destroy_area,
        invert = true
    })

    for index, value in pairs(to_be_destroyed) do
        if not value.valid then
            goto continue
        end
        if value.is_player() then
            goto continue
        end
        if table_contains(excluded_names,value.name) then
            goto continue
        end
        value.die()
        ::continue::
    end
    local corpses = surface.find_entities_filtered({
        type = { "corpse",},
        area = destroy_area
    })
    for index, value in pairs(corpses) do
        if not value.valid then
            goto continue
        end
        value.destroy()
        ::continue::
    end

end


local function mine_collector(entity, player)
    local position = entity.position
    local surface = entity.surface
    -- reset the surface tiles
    if entity.surface.name == "planet-dea-dia" then
        local tiles = {}
        for x = position.x - platform_radius, position.x + platform_radius do
            for y = position.y - platform_radius, position.y + platform_radius do
                table.insert(tiles, #tiles + 1, {
                    position = { x = x, y = y },
                    name = "dea-dia-surface"
                })
            end
        end
        surface.set_tiles(tiles, true, false, true, false)
    end
    -- destroy the pump too.
    local collector = surface.find_entity('gas-collector', position)

    if collector ~= nil then
        collector.destroy()
    end

    destroy_area = { {
        position.x - platform_radius - 1,
        position.y - platform_radius - 1,
    }, {
        position.x + platform_radius + 1,
        position.y + platform_radius + 1,
    }
    }
    surface.destroy_decoratives {
        name = {
            "space-platform-decorative-1x1",
            "space-platform-decorative-2x2",
            "space-platform-decorative-4x4",
            "space-platform-decorative-pipes-1x1",
            "space-platform-decorative-pipes-1x2",
            "space-platform-decorative-pipes-2x1",
            "space-platform-decorative-tiny",
        },
        area = destroy_area
    }
    destroy_entities(surface,destroy_area)
end


script.on_event(defines.events.on_built_entity, function(event)
    build_collector(event.entity, event.player)
end, { {
    filter = "name",
    name = "gas-collector"
} })

script.on_event(defines.events.on_robot_built_entity, function(event)
    build_collector(event.entity)
end, { {
    filter = "name",
    name = "gas-collector"
} })


script.on_event(defines.events.on_entity_died, function(event)
    mine_collector(event.entity)
end, { {
    filter = "name",
    name = "gas-collector-roboport"
} })

script.on_event(defines.events.on_player_mined_entity, function(event)
    mine_collector(event.entity, event.player)
end, { {
    filter = "name",
    name = "gas-collector-roboport"
} })

script.on_event(defines.events.on_robot_mined_entity, function(event)
    mine_collector(event.entity)
end, { {
    filter = "name",
    name = "gas-collector-roboport"
} })
