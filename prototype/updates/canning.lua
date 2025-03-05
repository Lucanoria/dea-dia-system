local function canning_recipe(target, source_amount, stack_size, spoil_time)
    if stack_size == nil then
        stack_size = 1
    end
    if source_amount == nil then
        source_amount = 1
    end
    local name = "canned-" .. target.name
    data:extend { {
        type = "recipe",
        name = name,
        subgroup = "canning",
        enabled = false,
        energy_required = 0.5,
        category = "chemistry",
        ingredients =
        {
            { type = "fluid", name = "water",     amount = 100 },
            { type = "item",  name = target.name, amount = source_amount },
            { type = "item",  name = "barrel",    amount = 1 },
            { type = "item",  name = "nutrients", amount = 20 }
        },
        results = {
            { type = "item", name = name, amount = 1 }
        }
    } }

    local item = {
        type = target.type,
        name = name,
        subgroup = "canning",
        stack_size = stack_size,
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/can.png",
            },
            {
                icon = target.icon,
                icon_size = 64,
                scale = 0.2,
                shift = { 0, 6 }
            }
        }
    }
    if spoil_time ~= nil then
        item.spoil_ticks = spoil_time
        item.spoil_result = target.name
    end
    -- canned consumables will retain their original effect.
    if target.type == "capsule" then
        item.capsule_action = table.deepcopy(target.capsule_action)
    end
    data:extend {
        item
    }
    return item
end

canning_recipe(data.raw["item"]["iron-bacteria"], 1, 1, 60 * 60 * 15)
canning_recipe(data.raw["item"]["copper-bacteria"], 1, 1, 60 * 60 * 15)
canning_recipe(data.raw["item"]["slime-weed"], 10, 1, 60 * 60 * 15)

-- 6 hour jail for the bioflux. Not really meant for transport, just to keep it on yourself.
canning_recipe(data.raw["capsule"]["bioflux"], 1,50, 60 * 60 * 60 * 6)

local fish_can = canning_recipe(data.raw["capsule"]["raw-fish"], 3, 50)
fish_can.icons = nil
fish_can.icon = "__dea-dia-system__/graphics/icon/fish-can.png"


data:extend {
    {
        type = "technology",
        name = "bacteria-canning",
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/can.png",
                icon_size = 64
            },
            {
                icon = "__space-age__/graphics/technology/bacteria-cultivation.png",
                icon_size = 256,
                scale = .5
            }
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "canned-copper-bacteria"
            },
            {
                type = "unlock-recipe",
                recipe = "canned-iron-bacteria"
            }
        },
        prerequisites = { "utility-science-pack", "gel-polymerization", "agricultural-science-pack", "planet-discovery-dea-dia" },
        unit =
        {
            count = 2000,
            ingredients =
            {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "production-science-pack",    1 },
                { "utility-science-pack",       1 },
                { "space-science-pack",         1 },
                { "agricultural-science-pack",  1 },
                { "insulation-science-pack",    1 },
                { "thermodynamic-science-pack", 1 },
                { "aerospace-science-pack",     1 }
            },
            time = 60
        }
    }
    ,
    {
        type = "technology",
        name = "slimeweed-canning",
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/can.png",
                icon_size = 64
            },
            {
                icon = "__dea-dia-system__/graphics/icon/slimeweed-farming.png",
                icon_size = 256,
                scale = .5
            }
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "canned-slime-weed"
            }
        },
        prerequisites = { "utility-science-pack", "advanced-slimeweed-farming", "planet-discovery-dea-dia" },
        unit =
        {
            count = 2000,
            ingredients =
            {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "production-science-pack",    1 },
                { "utility-science-pack",       1 },
                { "space-science-pack",         1 },
                { "agricultural-science-pack",  1 },
                { "insulation-science-pack",    1 },
                { "thermodynamic-science-pack", 1 },
                { "aerospace-science-pack",     1 }
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "bioflux-canning",
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/can.png",
                icon_size = 64
            },
            {
                icon = "__space-age__/graphics/technology/bioflux.png",
                icon_size = 256,
                scale = .5
            }
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "canned-bioflux"
            }
        },
        prerequisites = { "utility-science-pack", "planet-discovery-dea-dia" },
        unit =
        {
            count = 2000,
            ingredients =
            {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "production-science-pack",    1 },
                { "utility-science-pack",       1 },
                { "space-science-pack",         1 },
                { "agricultural-science-pack",  1 },
                { "insulation-science-pack",    1 },
                { "thermodynamic-science-pack", 1 },
                { "aerospace-science-pack",     1 }
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "fish-canning",
        icons = {
            {
                icon = "__dea-dia-system__/graphics/icon/fish-can-tech-icon.png",
                icon_size = 256,
            }
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "canned-raw-fish"
            }
        },
        prerequisites = { "utility-science-pack", "planet-discovery-dea-dia" },
        unit =
        {
            count = 2000,
            ingredients =
            {
                { "automation-science-pack",   1 },
                { "logistic-science-pack",     1 },
                { "chemical-science-pack",     1 },
                { "production-science-pack",   1 },
                { "utility-science-pack",      1 },
                { "agricultural-science-pack", 1 },
                { "space-science-pack",        1 },
            },
            time = 60
        }
    }
}
