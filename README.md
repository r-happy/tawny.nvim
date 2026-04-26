# tawny.nvim

A warm, earthy Neovim colorscheme with muted tones inspired by tawny browns and natural hues.

<!-- ![tawny.nvim screenshot](./assets/screenshot.png) -->

## Features

- Comprehensive syntax highlighting (Vim syntax + TreeSitter)
- LSP diagnostics support
- Popular plugin integrations:
  - [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  - [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) / [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) / [blink.cmp](https://github.com/Saghen/blink.cmp)
  - [which-key](https://github.com/folke/which-key.nvim)
  - [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
  - [mini.nvim](https://github.com/echasnovski/mini.nvim)
  - [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
- Dark and light colorschemes
- Optional transparency
- Customizable styles

## Color Palette

| Name       | Hex       |
| ---------- | --------- |
| Background | `#2b241f` |
| Foreground | `#e2d1b3` |
| Red        | `#b67a70` |
| Orange     | `#bc8a58` |
| Yellow     | `#cdb07a` |
| Green      | `#7e9670` |
| Teal       | `#6d8f82` |
| Blue       | `#798da0` |
| Violet     | `#9f8b95` |

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "r-happy/tawny.nvim",
  priority = 1000,
  config = function()
    require("tawny").setup()
    vim.cmd("colorscheme tawny")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "r-happy/tawny.nvim",
  config = function()
    require("tawny").setup()
    vim.cmd("colorscheme tawny")
  end,
}
```

## Configuration

```lua
require("tawny").setup({
  -- "dark" | "light" | nil
  -- Used when calling require("tawny").load() directly.
  -- :colorscheme tawny and :colorscheme tawny-light are fixed.
  variant = nil,

  -- Enable transparent background
  transparent = false,

  -- Customize highlight styles
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = true },
  },

  -- Override specific highlight groups
  overrides = function(colors)
    return {
      -- Example: make Normal background transparent
      -- Normal = { bg = colors.none },
    }
  end,
})
```

### Light mode

```lua
vim.cmd("colorscheme tawny-light")
```

## License

MIT
