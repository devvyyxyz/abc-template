# `assets/` — Resource pack scaffold

This folder contains resource-pack assets (textures, models, sounds, etc.). Use the structure below when adding assets:

- `assets/minecraft/textures/` — vanilla namespaced textures (use these if you are replacing vanilla textures).
- `assets/<your_namespace>/textures/` — namespaced assets for resource pack consumers and mods that look up namespaced resources.
- `pack.mcmeta` — required metadata file; set `pack.pack_format` appropriate for the target Minecraft versions.
- `pack.png` — optional 128×128 icon shown in the resource pack selector.

Quick tips

- Test locally by copying `assets/` to Minecraft's `resourcepacks/` folder and enabling the pack in Options → Resource Packs.
- Keep `assets/` organized by purpose (textures/, models/, sounds/). Add small `README.md` files in subfolders if you have many assets.
