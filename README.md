# Sami's Potion Helper

An Elder Scrolls Online addon that automatically manages consumables in your backpack. When you open your inventory, it scans your bag and marks non-crafted, sellable items as junk based on your enabled filters (potions always, with optional food/drink and poisons).

## Features

- **Auto-junk non-crafted potions** — Any sellable potion that was not player-crafted is automatically marked as junk when you open your inventory.
- **Optional food & drink filtering** — When enabled, non-crafted sellable food and drink are also marked as junk.
- **Optional poison filtering** — When enabled, non-crafted sellable poisons are also marked as junk.
- **Settings panel** — Configurable via LibAddonMenu-2.0, including debug and filter toggles.

## Dependencies

| Library | Version |
|---|---|
| [LibAddonMenu-2.0](https://www.esoui.com/downloads/info7-LibAddonMenu.html) | ≥ 41 |

## Settings

Open **Settings → Addons → SamisPotionHelper** to access:

| Option | Default | Description |
|---|---|---|
| Enable Debug | Off | Print debug messages to the chat window |
| Filter Food & Drink | On | Also junk non-crafted, sellable food and drink |
| Filter Poisons | On | Also junk non-crafted, sellable poisons |

## How It Works

1. When the inventory scene opens, the addon iterates through every slot in `BAG_BACKPACK`.
2. Each item is checked against enabled filters:
   - **Potions** are always considered.
   - **Food & Drink** are considered when the setting is enabled.
   - **Poisons** are considered when the setting is enabled.
3. Matching items are marked junk only if they are **non-crafted and sellable**.

## Version

`1.0.1`

## Author

samihaize

## License

See [LICENSE.md](LICENSE.md).
