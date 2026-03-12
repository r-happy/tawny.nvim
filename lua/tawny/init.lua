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

  require("tawny.highlights").setup(palette.colors, config.options)
end

return M
