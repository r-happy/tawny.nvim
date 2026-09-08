# Tawny for Visual Studio Code

Tawny pairs warm text and muted syntax accents with neutral dark or paper-like
light backgrounds. Both variants share their syntax roles with the Neovim and
Zed themes.

## Themes

- Tawny
- Tawny Light

Open **Preferences: Color Theme** and choose either theme after installing the extension.

The theme includes TextMate and semantic highlighting, Markdown styling,
search and selection states, translucent diff overlays, terminal colors,
and coordinated focus, button, notification, and debugging colors.

Language extensions may classify tokens differently or supply custom colors.
Use **Developer: Inspect Editor Tokens and Scopes** to inspect a mismatch.

## Development and packaging

From this directory, press `F5` in VS Code to launch an Extension Development Host.

To create a distributable `.vsix` package:

```sh
npx @vscode/vsce package
```

The theme definitions are generated from the shared palette at
[`../lua/tawny/palette.lua`](../lua/tawny/palette.lua). Regenerate them from the
repository root with:

```sh
make generate-companion-themes
make check
```
