-- Eaglercraft 26.3 Lua mod-format scaffold
-- Toggle key: N
--
-- Compatibility contract:
-- This file deliberately uses plain Lua only. No documented Eaglercraft 26.3
-- Lua event/render API has been verified, so this does NOT register game hooks,
-- find players, or draw ESP outlines. A compatible host/loader must call
-- PlayerESP.on_key_pressed("N") from its key event and connect rendering later.

local PlayerESP = {
    enabled = false,
    toggle_key = "N",
    name = "Eaglercraft Player ESP scaffold",
    version = "0.2.0"
}

function PlayerESP.toggle()
    PlayerESP.enabled = not PlayerESP.enabled
    return PlayerESP.enabled
end

function PlayerESP.on_key_pressed(key)
    if key == PlayerESP.toggle_key then
        return PlayerESP.toggle()
    end
    return PlayerESP.enabled
end

function PlayerESP.get_status()
    return PlayerESP.enabled and "Scaffold ON (no player rendering)" or "Scaffold OFF"
end

-- Some Lua mod hosts execute main.lua as a script and ignore return values;
-- others permit require()-style modules. The code above is intentionally
-- standalone and does not depend on either behavior to parse.
return PlayerESP
