local M = {}

M.dark = {
  bg            = "#15110f",
  bg_dim        = "#110d0b",
  bg_light      = "#211b17",
  fg            = "#d8b995",
  fg_dim        = "#8b7562",
  border        = "#342923",

  yellow        = "#c59a56",
  red           = "#a85b5f",
  orange        = "#b8753d",
  green         = "#6f8450",
  teal          = "#5f8878",
  blue          = "#667f9a",
  violet        = "#927d94",

  none          = "NONE",
  selection     = "#332923",

  diff_add      = "#263024",
  diff_change   = "#382f20",
  diff_delete   = "#372524",
  diff_text     = "#4a3d27",

  diag_error_bg = "#372524",
  diag_warn_bg  = "#382f20",
  diag_info_bg  = "#202936",
  diag_hint_bg  = "#222f2a",
}

M.light = {
  bg        = "#efe6d8",
  bg_dim    = "#e4dacb",
  bg_light  = "#f7f0e6",
  fg        = "#33271d",
  fg_dim    = "#7f6a5b",
  red       = "#96493f",
  orange    = "#8f5f2d",
  yellow    = "#7c641f",
  green     = "#526b3c",
  teal      = "#426759",
  blue      = "#526f8c",
  violet    = "#735d72",
  border    = "#b9aa96",
  selection = "#ddccb4",
  none      = "NONE",
}

M.colors = M.dark

return M
