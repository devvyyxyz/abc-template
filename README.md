# ABC Template — Datapack & Resource Pack Template

This repository is a balanced template for creating Minecraft datapacks and resource packs (Java edition). You can use it as:

- a datapack-only project (logic + functions),
- a resource-pack-only project (assets like textures/models/sounds), or
- a combined development workspace (both `data/` and `assets/` present).

Two short install flows below are split so you can quickly follow the one you need.

## Quick Install — Datapack

1. Download or clone this repository.
2. Copy the `data/` folder (or the whole repository) to your world's `datapacks` folder:
   - Location: `.minecraft/saves/[Your World Name]/datapacks/`
3. In-game run `/reload` or restart the world. Verify `load.mcfunction` ran (use `say`/`tellraw` tests in `load.mcfunction`).

Notes:
- Datapacks must live in a world's `datapacks/` folder (not in `resourcepacks/`).
- Keep `assets/` if you plan to also use resource assets locally; it won't interfere with datapack execution.

## Quick Install — Resource Pack

1. Download or clone this repository.
2. Copy the `assets/` folder (or the whole repository) to your Minecraft `resourcepacks` folder:
   - Location: `~/.minecraft/resourcepacks/` (or `%appdata%/Roaming/.minecraft/resourcepacks/` on Windows)
3. In Minecraft: Options → Resource Packs → Open Pack Folder (or use the resource pack menu) and enable the pack.

Notes:
- Resource packs use `assets/` and a `pack.mcmeta` that must include the resource pack's `pack_format`.
- You can distribute a resource pack as a ZIP containing `assets/` and `pack.mcmeta`.

## Quick Install — Combined / Development Workflow

If you want both datapack logic and resource assets during development, keep both `data/` and `assets/` in the repo. For local testing:

- Copy `data/` into your world's `datapacks/` and copy `assets/` into `~/.minecraft/resourcepacks/`.
- Alternatively use the helper scripts included to move/backup unwanted directories automatically.

## What you will need — Datapack (key items)

- `data/<namespace>/functions/`: your functions and entry points (`load.mcfunction`, `tick.mcfunction`, etc.).
- `data/minecraft/tags/functions/`: tags (`load.json`, `tick.json`) that call your namespace functions automatically.
- `pack.mcmeta` (datapack): contains a `pack.pack_format` number appropriate for datapacks. Update this when targeting different Minecraft versions.
- Namespace: a short identifier (example: `abc`) used as `abc:<function_name>` when calling functions.

Quick checklist:
- Create/adjust `data/<namespace>/functions/load.mcfunction` for setup commands.
- Add `data/minecraft/tags/functions/load.json` that references your namespace load function.

## What you will need — Resource Pack (key items)

- `assets/<namespace>/textures/` (or `assets/minecraft/textures/`) for images and models.
- `pack.mcmeta` (resource pack): contains `pack.pack_format` for resource packs — this value differs from datapack `pack_format` and is version-dependent.
- `pack.png` (optional): 128×128 PNG shown in the resource pack selector.

Quick checklist:
- Place textures under `assets/minecraft/textures/...` or under your namespace folder for namespaced assets.
- Update `pack.mcmeta` with a resource pack `pack_format` compatible with your target Minecraft versions.

## Files & Paths (summary)

- `pack.mcmeta`: required for both pack types; contains `pack.pack_format` and `description`. Make sure it uses the correct `pack_format` for the pack type (datapack vs resource pack).
- `data/`: datapack logic (commands, functions, tags).
- `assets/`: resource pack content (textures, models, sounds).
- `README.md`, `LICENSE`, `pack.png`: docs, license, and optional icon.

## Helper scripts

Two scripts are included to help convert the repo into the variant you want:

- `make-datapack.sh` — moves or deletes `assets/` so the repo becomes datapack-only.
- `make-resourcepack.sh` — moves or deletes `data/` so the repo becomes resource-pack-only.

Usage (make executable first):
```bash
chmod +x make-datapack.sh make-resourcepack.sh
./make-datapack.sh       # default: move 'assets' to a timestamped backup
./make-resourcepack.sh   # default: move 'data'   to a timestamped backup
./make-datapack.sh --delete       # permanently delete 'assets'
./make-resourcepack.sh --delete   # permanently delete 'data'
```

## Recommended edits when starting a project

- For datapacks: set your namespace, update `pack.mcmeta` pack_format, and document functions in `data/<namespace>/README.md`.
- For resource packs: add `pack.png`, organize textures under `assets/`, and set the resource pack `pack_format`.
- Use Git for version control and keep backups when deleting directories.

## Want me to do more?

- I can make the helper scripts executable and commit the permission change.
- I can add a small `data/<namespace>/README.md` scaffold documenting the included functions.
- I can add a `Makefile` or simple `package.json` scripts to run the helper scripts consistently.

Which of the above would you like me to do next? (Pick one or say "none")

## Publishing & CI (Modrinth)

If you plan to publish releases automatically (for example via GitHub Actions) and upload to Modrinth, add these repository secrets to your repository settings:

- `MODRINTH_API_TOKEN`: a Modrinth API token with project publishing permissions. Create this token in your Modrinth account settings → API tokens.
- `MODRINTH_PROJECT_ID`: the Modrinth project ID for your mod/resource (can be found in the project's Modrinth page URL or in project settings).

Notes:
- Store these values as encrypted repository secrets (e.g., GitHub: Settings → Secrets → Actions) rather than committing them into source.
- Typical CI usage: the action reads these secrets to authenticate to Modrinth and upload a build/artifact.
- I can add a sample GitHub Actions workflow that builds a ZIP and uploads a release to Modrinth using these secrets — tell me if you want that.

## License

See `LICENSE` for details.
