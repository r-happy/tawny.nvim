local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  bg            = hsl(22.5, 22.2, 7.1),
  bg_dim        = hsl(20.0, 23.1, 5.1),
  bg_dark       = hsl(15.0, 22.2, 3.5),
  bg_light      = hsl(24.0, 17.9, 11.0),
  bg_highlight  = hsl(23.1, 17.3, 14.7),
  bg_popup      = hsl(20.0, 20.0, 8.8),
  bg_sidebar    = hsl(20.0, 20.0, 5.9),
  bg_statusline = hsl(20.0, 18.4, 9.6),
  fg            = hsl(33.7, 67.1, 83.3),
  fg_bright     = hsl(40.0, 100.0, 91.2),
  fg_dark       = hsl(29.5, 30.3, 60.6),
  fg_dim        = hsl(28.1, 19.2, 48.0),
  border        = hsl(22.9, 19.3, 21.4),
  border_highlight = hsl(24.6, 21.3, 35.9),

  yellow        = hsl(41.2, 86.2, 68.8),
  yellow_dim    = hsl(36.8, 44.6, 48.8),
  red           = hsl(351.8, 66.9, 65.7),
  red_dim       = hsl(352.9, 34.7, 47.5),
  orange        = hsl(28.1, 82.1, 62.7),
  orange_dim    = hsl(24.7, 54.9, 46.1),
  green         = hsl(90.0, 37.1, 58.8),
  green_dim     = hsl(91.0, 27.7, 43.9),
  teal          = hsl(160.5, 34.6, 58.0),
  teal_dim      = hsl(161.9, 28.8, 42.9),
  blue          = hsl(208.0, 51.8, 66.7),
  blue_dim      = hsl(209.1, 27.8, 50.6),
  violet        = hsl(300.0, 23.2, 67.8),
  violet_dim    = hsl(298.2, 13.5, 50.6),
  magenta       = hsl(334.3, 45.6, 66.9),
  cyan          = hsl(180.8, 39.9, 64.1),

  none          = "NONE",
  selection     = hsl(24.7, 17.2, 19.4),

  diff_add      = hsl(123.5, 19.1, 17.5),
  diff_change   = hsl(41.4, 32.6, 17.5),
  diff_delete   = hsl(357.8, 27.3, 19.4),
  diff_text     = hsl(37.6, 42.1, 23.7),

  diag_error_bg = hsl(357.8, 27.3, 19.4),
  diag_warn_bg  = hsl(41.4, 32.6, 17.5),
  diag_info_bg  = hsl(205.4, 28.9, 17.6),
  diag_hint_bg  = hsl(168.0, 24.4, 16.1),
}

M.light = {
  bg            = hsl(37.1, 56.8, 92.7),
  bg_dim        = hsl(36.4, 45.2, 87.8),
  bg_dark       = hsl(37.3, 40.7, 82.2),
  bg_light      = hsl(35.3, 100.0, 96.7),
  bg_highlight  = hsl(34.9, 50.6, 83.3),
  bg_popup      = hsl(36.0, 71.4, 94.5),
  bg_sidebar    = hsl(35.6, 50.0, 87.5),
  bg_statusline = hsl(34.3, 45.5, 84.9),
  fg            = hsl(25.0, 25.5, 18.4),
  fg_bright     = hsl(22.5, 28.6, 11.0),
  fg_dark       = hsl(24.3, 20.7, 35.1),
  fg_dim        = hsl(24.3, 17.5, 47.1),
  border        = hsl(32.5, 31.6, 70.2),
  border_highlight = hsl(31.0, 25.4, 55.3),

  red           = hsl(3.1, 45.7, 49.8),
  red_dim       = hsl(1.4, 41.6, 39.6),
  orange        = hsl(29.2, 69.7, 42.7),
  orange_dim    = hsl(29.5, 65.9, 33.3),
  yellow        = hsl(41.6, 68.9, 35.3),
  yellow_dim    = hsl(42.8, 61.7, 27.6),
  green         = hsl(96.9, 40.2, 34.1),
  green_dim     = hsl(98.9, 38.6, 27.5),
  teal          = hsl(162.6, 37.3, 32.5),
  teal_dim      = hsl(164.7, 34.8, 26.5),
  blue          = hsl(208.6, 40.4, 42.7),
  blue_dim      = hsl(210.4, 38.3, 34.3),
  violet        = hsl(307.5, 17.9, 43.9),
  violet_dim    = hsl(307.5, 18.4, 34.1),
  magenta       = hsl(336.5, 28.9, 46.9),
  cyan          = hsl(185.8, 38.3, 36.9),

  selection     = hsl(34.7, 46.4, 81.0),
  none          = "NONE",

  diff_add      = hsl(86.7, 37.0, 85.7),
  diff_change   = hsl(45.3, 51.7, 82.9),
  diff_delete   = hsl(11.6, 42.5, 85.7),
  diff_text     = hsl(42.1, 52.4, 71.2),

  diag_error_bg = hsl(11.6, 42.5, 85.7),
  diag_warn_bg  = hsl(45.3, 51.7, 82.9),
  diag_info_bg  = hsl(204.0, 32.3, 87.8),
  diag_hint_bg  = hsl(150.0, 23.5, 86.7),
}

M.colors = M.dark

return M
