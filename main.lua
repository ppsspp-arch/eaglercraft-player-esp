-- Eaglercraft Player ESP scaffold
-- Intended toggle: N
-- NOTE: This is not a functional ESP. A compatible loader must call on_key_pressed
-- and connect enabled state to real player detection/rendering APIs.

local PlayerESP = {
    enabled = false,
    toggle_key = "N"
}

function PlayerESP.toggle()
    PlayerESP.enabled = not PlayerESP.enabled
    return PlayerESP.enabled
end

function PlayerESP.on_key_pressed(key)
    if key == PlayerESP.toggle_key then
        local enabled = PlayerESP.toggle()
        return enabled
    end
    return PlayerESP.enabled
end

function PlayerESP.get_status()
    if PlayerESP.enabled then
        return "Player ESP scaffold: ON (N to toggle)"
    end
    return "Player ESP scaffold: OFF (N to toggle)"
end

return PlayerESP
