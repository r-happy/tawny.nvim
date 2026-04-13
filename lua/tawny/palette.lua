local M = {}

M.dark = {
  bg            = "#28211d",
  bg_dim        = "#211a17",
  bg_light      = "#312c27",
  fg            = "#e2d1b3",
  border        = "#584a40",

  -- accent colors
  yellow        = "#cdb07a",
  fg_dim        = "#aa947d",
  red           = "#b67a70",
  orange        = "#bc8a58",
  green         = "#7e9670",
  teal          = "#6d8f82",
  blue          = "#798da0",
  violet        = "#9f8b95",
  none          = "NONE",
  selection     = "#43362d",
  diff_add      = "#313b2e",
  diff_change   = "#403523",
  diff_delete   = "#432c2a",
  diff_text     = "#524329",
  diag_error_bg = "#3f2a28",
  diag_warn_bg  = "#403221",
  diag_info_bg  = "#293440",
  diag_hint_bg  = "#293731",

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
