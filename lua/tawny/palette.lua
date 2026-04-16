local M = {}

M.dark = {
  bg            = "#28211d",
  bg_dim        = "#211a17",
  bg_light      = "#312c27",
  fg            = "#e2d1b3",
  fg_dim        = "#b39a80",
  border        = "#4c4037",

  yellow        = "#d6bc82",
  red           = "#b67a70",
  orange        = "#cb7b42",
  green         = "#86a06c",
  teal          = "#5f958a",
  blue          = "#7096b8",
  violet        = "#a482a8",

  none          = "NONE",
  selection     = "#4b3b31",

  diff_add      = "#34402f",
  diff_change   = "#463821",
  diff_delete   = "#472d2b",
  diff_text     = "#5a4727",

  diag_error_bg = "#452b29",
  diag_warn_bg  = "#46331f",
  diag_info_bg  = "#2b3744",
  diag_hint_bg  = "#2b3b35",
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
