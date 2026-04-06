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
- Dark and light mode (follows `vim.o.background`)
- Optional transparency
- Customizable styles

## Color Palette

| Name       | Hex       |
|------------|-----------|
| Background | `#2b241f` |
| Foreground | `#ead6b4` |
| Red        | `#c86a68` |
| Orange     | `#cf9150` |
| Yellow     | `#dfb978` |
| Green      | `#86a96c` |
| Teal       | `#6f9c89` |
| Blue       | `#7f98b2` |
| Violet     | `#b0919e` |

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "rhappy/tawny.nvim",
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
  "rhappy/tawny.nvim",
  config = function()
    require("tawny").setup()
    vim.cmd("colorscheme tawny")
  end,
}
```

## Configuration

```lua
require("tawny").setup({
  -- "dark" | "light" | nil (nil follows vim.o.background)
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
-- Option 1: via vim.o.background
vim.o.background = "light"
vim.cmd("colorscheme tawny")

-- Option 2: via setup option
require("tawny").setup({ variant = "light" })
vim.cmd("colorscheme tawny")
```

## License

MIT
