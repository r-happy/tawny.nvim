local M = {}

function M.setup(opts)
  require("tawny.config").setup(opts)
end

local function set_terminal_colors(c)
  vim.g.terminal_color_0  = c.bg_dark
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = c.violet
  vim.g.terminal_color_6  = c.teal
  vim.g.terminal_color_7  = c.fg_dark
  vim.g.terminal_color_8  = c.fg_dim
  vim.g.terminal_color_9  = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.magenta or c.violet
  vim.g.terminal_color_14 = c.cyan or c.teal
  vim.g.terminal_color_15 = c.fg_bright
end

function M.load(variant)
  local config  = require("tawny.config")
  local palette = require("tawny.palette")

  -- `:colorscheme tawny` must work even if setup() was never called.
  if type(config.options) ~= "table" or type(config.options.overrides) ~= "function" then
    config.setup()
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

  vim.o.termguicolors = true

  local colors
  variant = variant or config.options.variant
  if variant == "light" then
    colors = palette.light
    vim.g.colors_name = "tawny-light"
    vim.o.background = "light"
  else
    colors = palette.dark
    vim.g.colors_name = "tawny"
    vim.o.background = "dark"
  end

  if config.options.terminal_colors ~= false then
    set_terminal_colors(colors)
  end

  require("tawny.highlights").setup(colors, config.options)
end

return M
