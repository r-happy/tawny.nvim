local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  bg               = hsl(22.5, 18.0, 5.5),
  bg_dim           = hsl(20.0, 18.0, 4.0),
  bg_dark          = hsl(15.0, 16.0, 2.8),
  bg_light         = hsl(24.0, 16.0, 8.5),
  bg_highlight     = hsl(23.1, 15.0, 11.5),
  bg_popup         = hsl(20.0, 17.0, 6.8),
  bg_sidebar       = hsl(20.0, 17.0, 4.6),
  bg_statusline    = hsl(20.0, 16.0, 7.2),
  fg               = hsl(33.7, 67.1, 83.3),
  fg_bright        = hsl(40.0, 100.0, 91.2),
  fg_dark          = hsl(29.5, 30.3, 60.6),
  fg_dim           = hsl(28.1, 19.2, 48.0),
  border           = hsl(22.9, 19.3, 21.4),
  border_highlight = hsl(24.6, 21.3, 35.9),

  yellow           = hsl(41.2, 86.2, 68.8),
  yellow_dim       = hsl(36.8, 44.6, 48.8),
  red              = hsl(351.8, 66.9, 65.7),
  red_dim          = hsl(352.9, 34.7, 47.5),
  orange           = hsl(28.1, 82.1, 62.7),
  orange_dim       = hsl(24.7, 54.9, 46.1),
  green            = hsl(90.0, 37.1, 58.8),
  green_dim        = hsl(91.0, 27.7, 43.9),
  teal             = hsl(160.5, 34.6, 58.0),
  teal_dim         = hsl(161.9, 28.8, 42.9),
  blue             = hsl(208.0, 51.8, 66.7),
  blue_dim         = hsl(209.1, 27.8, 50.6),
  violet           = hsl(300.0, 23.2, 67.8),
  violet_dim       = hsl(298.2, 13.5, 50.6),
  magenta          = hsl(334.3, 45.6, 66.9),
  cyan             = hsl(180.8, 39.9, 64.1),

  none             = "NONE",
  selection        = hsl(24.7, 17.2, 19.4),

  diff_add         = hsl(123.5, 19.1, 17.5),
  diff_change      = hsl(41.4, 32.6, 17.5),
  diff_delete      = hsl(357.8, 27.3, 19.4),
  diff_text        = hsl(37.6, 42.1, 23.7),

  diag_error_bg    = hsl(357.8, 27.3, 19.4),
  diag_warn_bg     = hsl(41.4, 32.6, 17.5),
  diag_info_bg     = hsl(205.4, 28.9, 17.6),
  diag_hint_bg     = hsl(168.0, 24.4, 16.1),
}

M.light = {
  bg               = hsl(40.0, 80.0, 97.4),
  bg_dim           = hsl(38.0, 42.0, 93.0),
  bg_dark          = hsl(36.0, 35.0, 88.5),
  bg_light         = hsl(45.0, 100.0, 99.2),
  bg_highlight     = hsl(36.0, 42.0, 89.8),
  bg_popup         = hsl(40.0, 80.0, 98.2),
  bg_sidebar       = hsl(38.0, 42.0, 91.8),
  bg_statusline    = hsl(36.0, 38.0, 89.8),

  fg               = hsl(24.0, 22.0, 12.5),
  fg_bright        = hsl(22.0, 24.0, 6.5),
  fg_dark          = hsl(24.0, 18.0, 29.0),
  fg_dim           = hsl(24.0, 14.0, 41.0),

  border           = hsl(32.0, 25.0, 68.0),
  border_highlight = hsl(31.0, 24.0, 52.5),

  red              = hsl(3.1, 49.0, 44.0),
  red_dim          = hsl(1.4, 43.0, 34.0),
  orange           = hsl(29.2, 72.0, 37.0),
  orange_dim       = hsl(29.5, 67.0, 29.5),
  yellow           = hsl(41.6, 72.0, 30.5),
  yellow_dim       = hsl(42.8, 64.0, 24.0),
  green            = hsl(96.9, 43.0, 29.0),
  green_dim        = hsl(98.9, 40.0, 23.5),
  teal             = hsl(162.6, 40.0, 28.0),
  teal_dim         = hsl(164.7, 36.0, 22.5),
  blue             = hsl(208.6, 43.0, 37.0),
  blue_dim         = hsl(210.4, 40.0, 30.0),
  violet           = hsl(307.5, 20.0, 39.0),
  violet_dim       = hsl(307.5, 20.0, 30.0),
  magenta          = hsl(336.5, 32.0, 41.0),
  cyan             = hsl(185.8, 41.0, 32.5),

  selection        = hsl(34.7, 42.0, 84.5),
  none             = "NONE",

  diff_add         = hsl(86.7, 37.0, 88.5),
  diff_change      = hsl(45.3, 51.7, 86.0),
  diff_delete      = hsl(11.6, 42.5, 88.5),
  diff_text        = hsl(42.1, 52.4, 74.0),

  diag_error_bg    = hsl(11.6, 42.5, 88.5),
  diag_warn_bg     = hsl(45.3, 51.7, 86.0),
  diag_info_bg     = hsl(204.0, 32.3, 90.0),
  diag_hint_bg     = hsl(150.0, 23.5, 89.0),
}

M.colors = M.dark

return M
