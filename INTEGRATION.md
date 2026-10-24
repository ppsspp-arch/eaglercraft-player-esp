# Integration notes

## Toggle key

The intended key is **N**. The userscript logs `ON` or `OFF` in the browser console when the key is pressed. `main.lua` exposes `on_key_pressed("N")` for a loader to call.

## Not a functional ESP yet

This scaffold does not locate players, inspect game entities, or draw boxes/outlines. A compatible mod loader must expose documented game/player APIs and connect the `enabled` state to a render hook before visible ESP can work. Eaglercraft does not necessarily run Lua files natively, so placing `main.lua` in a ZIP alone will not execute it.

## Test the toggle

1. Open the target game only with a loader/userscript environment that you trust and are allowed to use.
2. Open the browser developer console.
3. Press **N** and look for the scaffold's ON/OFF message.

If nothing appears, the userscript may not be installed or permitted to run on the page.
