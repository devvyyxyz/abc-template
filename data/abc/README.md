# `data/abc` — Datapack namespace scaffold

This folder is the datapack namespace. It contains the functions and tags the datapack uses.

Included files

- `functions/load.mcfunction` — runs on datapack load/reload. Use this to set up scoreboard objectives, run one-time setup commands, or display a load message.
- `functions/tick.mcfunction` — runs every tick if your namespace's tick function is listed in `data/minecraft/tags/functions/tick.json`.
- `functions/example.mcfunction` — example that gives the executor a diamond and prints a message.

How to call functions

- In-game: `/function abc:<function_name>` (replace `abc` with your namespace if you rename it).
- From other functions: use the `function` command, e.g. `function abc:example`.

Recommended additions

- `setup.mcfunction` — more complex setup steps separated from `load.mcfunction`.
- `tests/` — a small folder with functions you can trigger manually to test behaviours.
- `README.md` inside `functions/` if you have many functions, documenting each one.

Changing the namespace

If you rename the namespace from `abc` to something else, rename this folder and update the function references in tags and other files.
