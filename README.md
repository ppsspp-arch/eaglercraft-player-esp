# Eaglercraft Player ESP — Lua package

**Version 0.3.0 · adapter-required**

The Lua core now filters supplied player records and draws 2D rectangles through a renderer callback. It does not yet connect to a specific Eaglercraft 26.3 Lua runtime because that loader's entity/render API has not been verified.

## Features in the core

- Press **N** through the host's key-event adapter to toggle ESP on/off.
- Filter records marked `is_player = true`.
- Draw a 2D box around records with screen-space `screen_x`, `screen_y`, `screen_width`, and `screen_height` values.
- Optional `name` is passed to the drawing callback.

## Required host adapter

The loader integration must:
1. Supply the current player/entity list and mark actual player entities with `is_player = true`.
2. Project each player's bounds into screen pixels and fill the four `screen_*` fields.
3. Call `PlayerESP.render(players, draw_box)` during the HUD/render event. `draw_box(left, top, right, bottom, color, name)` must draw a rectangle in screen space.
4. Forward the N key event to `PlayerESP.on_key_pressed("N")`.

See `INTEGRATION.md` for the data contract.

## Limitations

- This is not plug-and-play ESP yet: player discovery, 3D-to-2D projection, event registration, and the actual drawing primitive depend on the loader and are not implemented in this package.
- The exact Eaglercraft 26.3 Lua API and metadata schema remain unverified; no unknown API names have been invented.
- Use only on worlds/servers where visual ESP is permitted.
