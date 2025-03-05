local spawner_autoplace = {
    control = "floater-spawner",
    order = "b[enemy]-misc",
    force = "enemy",
    probability_expression = "enemy_autoplace_base(0, 6)",
    richness_expression = 1,
    tile_restriction = {
        "dea-dia-surface"
    }
}

local hit_effect = {
    type = "create-entity",
    entity_name = "enemy-damaged-explosion",
    offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    damage_type_filters = "fire"
}

local run_animation = {
    {
        animation_speed = 0.4,
        direction_count = 16,
        filenames = {
            "__dea-dia-system__/graphics/entity/floater/move-0.png",
            "__dea-dia-system__/graphics/entity/floater/move-1.png",
            "__dea-dia-system__/graphics/entity/floater/move-2.png",
            "__dea-dia-system__/graphics/entity/floater/move-3.png",
        },
        frame_count = 11,
        height = 1600 / 8,
        width = 2400 / 8,
        line_length = 8,
        lines_per_file = 8,
        slice = 11,
        usage = "enemy"
    },
    {
        animation_speed = 0.4,
        direction_count = 16,
        draw_as_shadow = true,
        filenames = {
            "__dea-dia-system__/graphics/entity/floater/move-shadow-0.png",
            "__dea-dia-system__/graphics/entity/floater/move-shadow-1.png",
            "__dea-dia-system__/graphics/entity/floater/move-shadow-2.png",
            "__dea-dia-system__/graphics/entity/floater/move-shadow-3.png",
        },
        frame_count = 11,
        height = 1600 / 8,
        width = 2400 / 8,
        line_length = 8,
        lines_per_file = 8,
        slice = 11,
        usage = "enemy"
    },
}

data:extend {
    {
        type = "autoplace-control",
        name = "floater-spawner",
        category = "enemy",
        can_be_disabled = true
    },
    {
        type = "unit",
        name = "floater",
        icon = "__dea-dia-system__/graphics/icon/floater.png",
        flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable" },
        max_health = 50,
        order = "b-a-a",
        subgroup = "enemies",
        resistances = {
            electric = {
                type = "electric",
                percentage = 100
            },
            fire = {
                type = "fire",
                percentage = 100
            },
            explosion = {
                type = "explosion",
                percentage = 50
            },
        },
        healing_per_tick = 0.01,
        collision_box = { { -0.2, -0.2 }, { 0.2, 0.2 } },
        selection_box = { { -0.4, -0.7 }, { 0.4, 0.4 } },
        damaged_trigger_effect = hit_effect,
        attack_parameters =
        {
            type = "projectile",
            range = 0.5,
            cooldown = 35,
            cooldown_deviation = 0.15,
            ammo_category = "melee",
            ammo_type = {
                target_type = "entity",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            type = "damage",
                            damage = { amount = 40, type = "electric" }
                        }
                    }
                }
            },
            animation = {
                layers = run_animation
            },
            range_mode = "bounding-box-to-bounding-box"
        },
        impact_category = "organic",
        vision_distance = 30,
        movement_speed = 0.2,
        distance_per_frame = 0.125,
        absorptions_to_join_attack = { pollution = 4 },
        distraction_cooldown = 300,
        min_pursue_time = 10 * 60,
        max_pursue_distance = 50,
        affected_by_tiles = false,
        dying_explosion = "grenade-explosion",
        collision_mask = {
            layers = {}
        },
        run_animation = {
            layers = run_animation
        },
        ai_settings = { destroy_when_commands_fail = true, allow_try_return_to_spawner = true }
    },
    {
        type                         = "unit-spawner",
        name                         = "floater-spawner",
        created_effect               = {
            type = "direct",
            action_delivery = {
                type = "instant",
                source_effects = {
                    type = "script",
                    effect_id = "floater-nest-spawned"
                }
            }
        },

        icon                         = "__base__/graphics/icons/biter-spawner.png",
        flags                        = { "placeable-player", "placeable-enemy", "not-repairable", "not-selectable-in-game" },
        max_health                   = 100000,
        order                        = "b-d-a",
        subgroup                     = "enemies",
        working_sound                = nil,
        dying_sound                  = nil,
        healing_per_tick             = 0.02,
        collision_box                = nil,
        map_generator_bounding_box   = { { -3.7, -3.2 }, { 3.7, 3.2 } },
        selection_box                = nil,
        damaged_trigger_effect       = nil,
        impact_category              = "organic",
        -- in ticks per 1 pu
        absorptions_per_second       = { pollution = { absolute = 20, proportional = 0.01 } },
        max_count_of_owned_units     = 7,
        max_friends_around_to_spawn  = 20,
        graphics_set                 =
        {
            animations =
            {
                filename = "__dea-dia-system__/graphics/blank.png",
                priority = "high",
                scale = 1,
                width = 64,
                height = 64,
                line_length = 1,
                lines_per_file = 1,
                draw_as_shadow = false,
                animation_speed = 1
            }
        },
        collision_mask               = {
            layers = {}
        },
        result_units                 = (function()
            local res = {}
            res[1] = { "floater", { { 0.0, 1.0 }, { 0.6, 0.0 } } }
            if not data.is_demo then
                -- from evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3
                -- this means for example that when the evolution_factor is 0.45 the probability of spawning
                -- a small biter is 66% while probability for medium biter is 33%.
                --res[2] = {"medium-biter", {{0.2, 0.0}, {0.6, 0.3}, {0.7, 0.1}}}
                -- for evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/8, big-biter 4/8, behemoth biter 3/8
                --res[3] = {"big-biter", {{0.5, 0.0}, {1.0, 0.4}}}
                --res[4] = {"behemoth-biter", {{0.9, 0.0}, {1.0, 0.3}}}
            end
            return res
        end)(),
        -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
        spawning_cooldown            = { 360, 150 },
        spawning_radius              = 10,
        spawning_spacing             = 3,
        max_spawn_shift              = 0,
        max_richness_for_spawn_shift = 100,
        autoplace                    = spawner_autoplace,
        call_for_help_radius         = 50,
        spawn_decoration             = nil,
    }
}
