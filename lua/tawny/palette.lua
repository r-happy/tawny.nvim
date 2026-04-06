local M = {}

M.dark = {
  bg        = "#2b241f",
  bg_dim    = "#241d19",
  bg_light  = "#35302a",
  fg        = "#ead6b4",
  border    = "#5d4d42",

  -- accent colors
  yellow    = "#dfb978",
  fg_dim    = "#b39a82",
  red       = "#c86a68",
  orange    = "#cf9150",
  green     = "#86a96c",
  teal      = "#6f9c89",
  blue      = "#7f98b2",
  violet    = "#b0919e",
  none      = "NONE",
  selection = "#43362d",
  diff_add  = "#31402d",
  diff_change = "#433722",
  diff_delete = "#472a28",
  diff_text = "#584728",
  diag_error_bg = "#432927",
  diag_warn_bg  = "#43331f",
  diag_info_bg  = "#253544",
  diag_hint_bg  = "#273932",

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
