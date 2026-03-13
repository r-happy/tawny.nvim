local M = {}

function M.setup(opts)
  require("tawny.config").setup(opts)
end

function M.load()
  local config  = require("tawny.config")
  local palette = require("tawny.palette")

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

  vim.g.colors_name   = "tawny"
  vim.o.termguicolors = true

  local variant = config.options.variant
  local colors
  if variant == "light" or (variant == nil and vim.o.background == "light") then
    colors = palette.light
    vim.o.background = "light"
  else
    colors = palette.dark
    vim.o.background = "dark"
  end

  require("tawny.highlights").setup(colors, config.options)
end

return M
