# Tawny for Visual Studio Code

Tawny is a warm, earthy color theme with dark and light variants.

## Themes

- Tawny
- Tawny Light

Open **Preferences: Color Theme** and choose either theme after installing the extension.

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
```
