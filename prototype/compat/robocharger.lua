local tech = data.raw["technology"]["robocharger"]
tech.lignumis_skip_science_packs = true

table.insert(tech.prerequisites,#tech.prerequisites+1,"planet-discovery-dea-dia")

tech.unit = {
    count = 200,
    ingredients = {
        { "automation-science-pack",    1 },
        { "logistic-science-pack",      1 },
        { "military-science-pack",      1 },
        { "chemical-science-pack",      1 },
        { "utility-science-pack",       1 },
        { "aerospace-science-pack",     1 }
    },
    time = 30
}

data.raw["technology"]["robocharger2"].lignumis_skip_science_packs = true
data.raw["technology"]["robocharger2"].unit = {
    count = 300,
    ingredients = {
        { "automation-science-pack",    1 },
        { "logistic-science-pack",      1 },
        { "military-science-pack",      1 },
        { "chemical-science-pack",      1 },
        { "utility-science-pack",       1 },
        { "aerospace-science-pack",     1 }
    },
    time = 30
}
data.raw["technology"]["robocharger3"].unit = {
    count = 400,
    ingredients = {
        { "automation-science-pack",    1 },
        { "logistic-science-pack",      1 },
        { "military-science-pack",      1 },
        { "chemical-science-pack",      1 },
        { "utility-science-pack",       1 },
        { "aerospace-science-pack",     1 }
    },
    time = 30
}