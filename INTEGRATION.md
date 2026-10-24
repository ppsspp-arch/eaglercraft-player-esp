# Eaglercraft 26.3 Lua integration

## Package format

This ZIP contains `metadata.json`, `main.lua`, `icon.svg`, `README.md`, and `INTEGRATION.md`. Community discussion reports that Eaglercraft 26.3 accepts `.lau` files and ZIPs containing `metadata.json` and `main.lua`, but this has not been verified against official loader documentation. Metadata requirements may vary by loader.

## Core API implemented here

- `PlayerESP.toggle()` flips the enabled flag.
- `PlayerESP.on_key_pressed(key)` toggles when `key == "N"`.
- `PlayerESP.render(players, draw_box)` draws 2D boxes for valid player records when enabled and returns the number of boxes drawn.
- `PlayerESP.get_status()` returns the current state and last box count.

Each item in `players` should be a table with `is_player = true`, numeric `screen_x`, `screen_y`, `screen_width`, and `screen_height` fields, and optionally `name`. Coordinates are screen-space pixels. The callback signature is `draw_box(left, top, right, bottom, color, name)`.

## Adapter still required

A compatible host must register the N key event, discover player entities, calculate their screen-space bounds from world coordinates, and supply a `draw_box` callback during its HUD/render event. Those functions are loader-specific. The exact Eaglercraft 26.3 Lua API has not been verified, so this repository deliberately does not claim those hooks work automatically.

The core provides filtering and box drawing logic, but without the adapter it cannot detect in-game players or draw boxes in the client. This is not yet a standalone working ESP.
