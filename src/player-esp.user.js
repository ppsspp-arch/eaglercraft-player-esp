// ==UserScript==
// @name         Eaglercraft Player ESP scaffold
// @namespace    local.eaglercraft.playeresp
// @version      0.1.0
// @description  N toggles a status-only scaffold; no player highlighting is implemented.
// @match        https://eaglercraft.com/*
// @grant        none
// ==/UserScript==

(() => {
  'use strict';
  let enabled = false;
  let lastNotice = 0;

  window.addEventListener('keydown', (event) => {
    if (event.code !== 'KeyN' || event.repeat ||
        event.target instanceof HTMLInputElement ||
        event.target instanceof HTMLTextAreaElement ||
        event.target?.isContentEditable) return;

    enabled = !enabled;
    const now = Date.now();
    if (now - lastNotice > 250) {
      console.info(`[Player ESP scaffold] ${enabled ? 'ON' : 'OFF'} — N toggles; player highlighting is not implemented.`);
      lastNotice = now;
    }
  }, true);
})();
