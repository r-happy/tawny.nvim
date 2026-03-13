local M = {}

M.dark = {
  bg        = "#171310",
  bg_dim    = "#14100d",
  bg_light  = "#221e1b",
  fg        = "#f0d3ae",
  fg_dim    = "#7a6650",
  red       = "#b85c4a",
  orange    = "#c07a3a",
  yellow    = "#ddb46e",
  green     = "#6a8c55",
  teal      = "#5a8070",
  blue      = "#7090a0",
  violet    = "#a48494",
  border    = "#3a2c26",
  selection = "#282423",
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
