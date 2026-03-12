local M = {}

M.defaults = {
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = true },
  },
  overrides = function(_) return {} end,
}


M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
