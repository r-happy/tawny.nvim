local M = {}

function M.setup(colors, opts)
  local groups = {}
  local modules = { "editor", "syntax", "treesitter", "lsp", "plugins" }

  for _, mod in ipairs(modules) do
    local ok, m = pcall(require, "tawny.highlights." .. mod)
    if ok then
      groups = vim.tbl_extend("force", groups, m.get(colors, opts))
    end
  end

  local overrides = opts.overrides(colors)
  groups = vim.tbl_extend("force", groups, overrides)

  for name, val in pairs(groups) do
    vim.api.nvim_set_hl(0, name, val)
  end
end

return M
