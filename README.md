# Eaglercraft Player ESP — Lua package scaffold

**Version 0.2.0 · scaffold only**

This project is packaged for the reported Eaglercraft 26.3 Lua mod format (metadata.json + main.lua). Community reports mention this package shape, but an authoritative loader API/schema has not been verified. See INTEGRATION.md.

## Toggle

The intended key is **N**. main.lua exposes on_key_pressed("N") and tracks an enabled flag. A host must call this function from its keyboard event handler.

## Important limitations

- This is **not a working ESP**: it does not detect players or draw boxes/outlines.
- No separate mod loader is bundled. The target client/loader is expected to load this mod package.
- The exact Eaglercraft 26.3 Lua runtime API is unverified, so the code intentionally avoids inventing event/render API names.
- main.lua is plain Lua and may need a small adapter for the specific loader you use.

## Package files

- metadata.json — package metadata and entry point.
- main.lua — standalone Lua toggle-state scaffold.
- icon.svg — project icon.
- INTEGRATION.md — loader compatibility notes.

The browser userscript in src/ is a separate status-only experiment and is **not** part of the Lua ZIP package.
