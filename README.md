# Eaglercraft Player ESP scaffold

**Status: prototype scaffold — not a working ESP yet.** This repository does not currently detect players or draw highlights.

## Toggle key

The intended toggle key is **N**. The JavaScript helper below toggles an enabled flag and displays its state, but it does not hook into Eaglercraft's renderer or player list.

## Files

- `main.lua` — Lua scaffold with an N-key toggle function.
- `metadata.json` — package metadata.
- `src/player-esp.user.js` — standalone browser userscript scaffold.
- `INTEGRATION.md` — loader integration notes.

## Important compatibility note

Eaglercraft builds and mod loaders expose different APIs. This project does not assume that the game supports Lua natively. Use only with a compatible loader and in environments where you have permission to run mods.
