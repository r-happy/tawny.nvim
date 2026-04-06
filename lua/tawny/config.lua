local M = {}

M.defaults = {
  transparent = false,
  variant = nil, -- "dark" | "light" | nil (follows vim.o.background)
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = true },
  },
  overrides = function(_) return {} end,
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

return M
