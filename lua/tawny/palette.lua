local M = {}

M.dark = {
  bg        = "#14100d",
  bg_dim    = "#100c09",
  bg_light  = "#1a1613",
  fg        = "#e0c99a",
  fg_dim    = "#7a6650",
  red       = "#b85c4a",
  orange    = "#c07a3a",
  yellow    = "#c9a05a",
  green     = "#6a8c55",
  teal      = "#5a8070",
  blue      = "#7090a0",
  violet    = "#9a7a8a",
  border    = "#3a2c26",
  selection = "#201c1b",
  none      = "NONE",
}

M.light = {
  bg        = "#f5ede0",
  bg_dim    = "#ede5d8",
  bg_light  = "#faf5ed",
  fg        = "#3a2c20",
  fg_dim    = "#8a7060",
  red       = "#9e3a2a",
  orange    = "#8a5010",
  yellow    = "#7a5a10",
  green     = "#3a6025",
  teal      = "#2a5545",
  blue      = "#3a5a70",
  violet    = "#6a4a5a",
  border    = "#c8b8a0",
  selection = "#e8d8c0",
  none      = "NONE",
}

-- backward compat
M.colors = M.dark

return M
