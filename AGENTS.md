# Repository Guidelines

## Project Structure & Module Organization
`colors/tawny.lua` is the Neovim colorscheme entrypoint. Core Lua code lives under `lua/tawny/`: `init.lua` loads the scheme, `config.lua` merges user options, `palette.lua` defines dark and light palettes, and `highlights/` splits highlight groups by concern (`editor.lua`, `syntax.lua`, `treesitter.lua`, `lsp.lua`, `plugins.lua`). Companion theme files for other tools live in `tmux/` and `wezterm/`.

## Build, Test, and Development Commands
There is no build step for this repository. Use Neovim directly for local verification:

```sh
nvim --clean -u NORC "+set rtp+=." "+colorscheme tawny"
```

Use this variant to exercise setup code:

```sh
nvim --clean -u NORC "+set rtp+=." "+lua require('tawny').setup({ variant = 'light' })" "+colorscheme tawny"
```

Before opening a PR, manually check dark/light mode, transparency, and any plugin highlight groups you changed.

## Coding Style & Naming Conventions
Follow the existing Lua style in this repo: two-space indentation is not used here; keep the current space-aligned tables and compact function definitions where they improve readability. Use `local M = {}` module tables, lowercase snake_case keys, and descriptive filenames that match the exported concern. Keep highlight definitions grouped by feature, not by color. Avoid introducing unrelated formatting churn because the repo has no enforced formatter config.

## Testing Guidelines
There is no automated test suite yet. Treat manual Neovim smoke tests as required for every change. Verify:

- the colorscheme loads without errors
- both `dark` and `light` variants render correctly
- changed highlight groups apply in the relevant UI or plugin

If you add tests later, place them in a top-level `tests/` directory and document the run command in `README.md`.

## Commit & Pull Request Guidelines
Recent history uses short, imperative commit subjects such as `add snacks`, `fix`, and `sync tmux, wezterm`. Prefer concise messages like `adjust lsp diagnostic colors` or `sync wezterm palette`. PRs should include a brief summary, note any affected plugins or terminals, and attach screenshots when visuals change. Link related issues when applicable.
