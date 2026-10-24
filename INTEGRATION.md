# Eaglercraft 26.3 Lua integration

## Package format

The project ZIP uses the reported layout:

- metadata.json
- main.lua
- icon.svg
- README.md
- INTEGRATION.md

Community discussion reports that Eaglercraft 26.3 accepts .lau files and ZIPs containing metadata.json and main.lua, but this has not been verified against official loader documentation. Loader versions may expect different metadata fields or an icon format.

## Toggle contract

The Lua entry exposes:

- PlayerESP.toggle() — flips the enabled flag.
- PlayerESP.on_key_pressed(key) — toggles when key == "N".
- PlayerESP.get_status() — returns a status string.

The code uses plain Lua and does not assume a particular global API. The selected loader must execute main.lua and, if it supports the needed integration, call on_key_pressed("N") from its key event.

## What is not implemented

No documented Eaglercraft 26.3 Lua event/render API was available to verify here. Therefore this package does **not** register its own keyboard listener, access player entities, or draw ESP highlights. It is a mod-format scaffold, not a standalone loader and not a functional ESP yet.

To implement real rendering safely, the exact loader name/version and its API documentation are needed. Do not assume Fabric, Forge, EaglerForge, or browser userscript APIs work in this Lua runtime.
