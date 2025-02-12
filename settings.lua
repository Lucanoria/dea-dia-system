-- force the frost biters to spawn only on lemures, disable temp check so I don't need deal with it.
cb_spawn_planet = data.raw["string-setting"]["fb-spawn-planet"]
temp_check = data.raw["bool-setting"]["cb-disable-temperature-check"]

cb_spawn_planet.allowed_values = { "lemures" }
cb_spawn_planet.default_value = "lemures"
cb_spawn_planet.value = "lemures"
-- cb_spawn_planet.hidden = true

-- temp_check.hidden = true
temp_check.default_value = true
temp_check.value = true
