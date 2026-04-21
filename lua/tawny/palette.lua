local M = {}

M.dark = {
  bg            = "#171310",
  bg_dim        = "#14100d",
  bg_light      = "#221e1b",
  fg            = "#f0d3ae",
  fg_dim        = "#9a7f68",
  border        = "#3a2c26",

  yellow        = "#f1bc63",
  red           = "#d45f70",
  orange        = "#e08a3f",
  green         = "#83aa5f",
  teal          = "#64a08b",
  blue          = "#739bc4",
  violet        = "#b08fae",

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
  red       = "#b24334",
  orange    = "#a96114",
  yellow    = "#8d6a14",
  green     = "#44712b",
  teal      = "#326653",
  blue      = "#426b93",
  violet    = "#7a5370",
  border    = "#c8b8a0",
  selection = "#e8d8c0",
  none      = "NONE",
}

M.colors = M.dark

return M
