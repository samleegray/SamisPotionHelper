# Sami's Potion Helper

An Elder Scrolls Online addon that automatically manages potions in your backpack. When you open your inventory, it scans your bag and marks any non-crafted, sellable potions as junk — keeping your inventory clean while preserving potions you made yourself.

## Features

- **Auto-junk non-crafted potions** — Any sellable potion that was not player-crafted is automatically marked as junk when you open your inventory.
- **Crafted potion caching** — Crafted potions are tracked by slot index for quick lookup.
- **Potion effect categorisation** — Internal effect mask table covers common potion types (Heroism, Tri-Stat, Bi-Stat, Endurance, Unstoppable, Physical/Spell/Dual Resists).
- **Settings panel** — Configurable via LibAddonMenu-2.0, with a debug-message toggle.

## Dependencies

| Library | Version |
|---|---|
| [LibAddonMenu-2.0](https://www.esoui.com/downloads/info7-LibAddonMenu.html) | ≥ 41 |

## Settings

Open **Settings → Addons → SamisPotionHelper** to access:

| Option | Default | Description |
|---|---|---|
| Enable Debug | Off | Print debug messages to the chat window |

## How It Works

1. When the inventory scene opens, the addon iterates through every slot in `BAG_BACKPACK`.
2. Each potion item is checked:
   - If it was **crafted** (has a creator name), its link is cached.
   - If it is **non-crafted and sellable**, it is immediately flagged as junk.
3. The cached potion list is updated on every inventory open.

## Version

`1.0.0`

## Author

samihaize

## License

See [LICENSE.md](LICENSE.md).
