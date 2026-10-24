# Eaglercraft Player ESP — Lua package

**Version 0.3.0 · adapter-required**

This repository now builds **two separate ZIP packages** from GitHub Actions:

1. **Player ESP ZIP** — the Lua ESP core, metadata, icon, and integration docs.
2. **Loader starter ZIP** — documentation explaining what is needed to identify and package the correct loader.

> Important: the loader ZIP is **not a working loader**. The exact Eaglercraft 26.3 loader and API have not been verified, so this repository does not bundle an unrelated or made-up loader. The ESP itself is also not plug-and-play until a compatible host adapter is implemented.

## Download the ZIPs

Open the repository's **Actions** tab, select the latest **Build separate ZIP packages** workflow run, and download the two artifacts:
- `player-esp-zip`
- `loader-starter-zip`

If the workflow has not run yet, push/commit the workflow or use **Actions → Build separate ZIP packages → Run workflow** if manual runs are enabled.

## Features in the ESP core

- Press **N** through the host's key-event adapter to toggle ESP on/off.
- Filter records marked `is_player = true`.
- Draw a 2D box around records with screen-space `screen_x`, `screen_y`, `screen_width`, and `screen_height` values.
- Optional `name` is passed to the drawing callback.

## Required host adapter

The loader integration must:
1. Supply the current player/entity list and mark actual player entities with `is_player = true`.
2. Project each player's bounds into screen pixels and fill the four `screen_*` fields.
3. Call `PlayerESP.render(players, draw_box)` during the HUD/render event.
4. Forward the N key event to `PlayerESP.on_key_pressed("N")`.

See `INTEGRATION.md` for the data contract.

## Limitations

- Player discovery, 3D-to-2D projection, event registration, and actual drawing depend on the loader and are not implemented in this package.
- The exact Eaglercraft 26.3 Lua API and metadata schema remain unverified.
- Use only on worlds/servers where visual ESP is permitted.
