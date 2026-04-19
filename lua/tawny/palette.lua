local M = {}

M.dark = {
  bg            = "#171310",
  bg_dim        = "#14100d",
  bg_light      = "#221e1b",
  fg            = "#f0d3ae",
  fg_dim        = "#9a7f68",
  border        = "#3a2c26",

  yellow        = "#ddb46e",
  red           = "#c05868",
  orange        = "#c97a3a",
  green         = "#7a9860",
  teal          = "#5e8c7a",
  blue          = "#6888a8",
  violet        = "#a48494",

  none          = "NONE",
  selection     = "#3a2e28",

  diff_add      = "#2c3828",
  diff_change   = "#43351f",
  diff_delete   = "#432927",
  diff_text     = "#5a4727",

  diag_error_bg = "#432927",
  diag_warn_bg  = "#43351f",
  diag_info_bg  = "#24303d",
  diag_hint_bg  = "#25352f",
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

M.colors = M.dark

return M
