local M = {}

function M.setup(opts)
  require("tawny.config").setup(opts)
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

  require("tawny.highlights").setup(colors, config.options)
end

return M
