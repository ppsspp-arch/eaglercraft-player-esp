-- Eaglercraft 26.3 Lua ESP core
-- Toggle key: N
--
-- IMPORTANT: No verified Eaglercraft 26.3 Lua game API is available here.
-- This module implements player filtering and box drawing against an adapter
-- supplied by the loader. It does not pretend that unknown game APIs exist.
--
-- Adapter contract:
--   PlayerESP.on_key_pressed("N")
--   PlayerESP.render(players, draw_box)
-- players: array of tables. Each player must provide:
--   is_player = true
--   screen_x, screen_y, screen_width, screen_height (screen-space pixels)
-- optional: name
-- draw_box(left, top, right, bottom, color, name)
-- The host must populate player data and call render during its HUD/render event.

local PlayerESP = {
    enabled = false,
    toggle_key = "N",
    name = "Eaglercraft Player ESP",
    version = "0.3.0",
    box_color = "#42FF72",
    boxes_drawn = 0
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

local function is_number(value)
    return type(value) == "number"
end

-- Draws 2D rectangles for player records already projected into screen space.
-- Returns the number of boxes drawn. Actual world/entity lookup and 3D-to-2D
-- projection are host responsibilities because their APIs differ by loader.
function PlayerESP.render(players, draw_box)
    PlayerESP.boxes_drawn = 0

    if not PlayerESP.enabled or type(players) ~= "table" or type(draw_box) ~= "function" then
        return 0
    end

    for _, player in pairs(players) do
        if type(player) == "table"
            and player.is_player == true
            and is_number(player.screen_x)
            and is_number(player.screen_y)
            and is_number(player.screen_width)
            and is_number(player.screen_height)
            and player.screen_width > 0
            and player.screen_height > 0 then

            local left = player.screen_x
            local top = player.screen_y
            local right = left + player.screen_width
            local bottom = top + player.screen_height

            draw_box(left, top, right, bottom, PlayerESP.box_color, player.name)
            PlayerESP.boxes_drawn = PlayerESP.boxes_drawn + 1
        end
    end

    return PlayerESP.boxes_drawn
end

function PlayerESP.get_status()
    if not PlayerESP.enabled then
        return "ESP OFF"
    end
    return "ESP ON (" .. tostring(PlayerESP.boxes_drawn) .. " boxes last render)"
end

return PlayerESP
