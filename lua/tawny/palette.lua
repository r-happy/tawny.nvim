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
  cursor           = hsl(35.0, 74.0, 78.0),
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
  bg               = hsl(40.0, 46.0, 95.8),
  bg_dim           = hsl(38.0, 32.0, 92.4),
  bg_dark          = hsl(36.0, 26.0, 88.8),
  bg_light         = hsl(42.0, 60.0, 97.2),
  bg_highlight     = hsl(36.0, 28.0, 91.0),
  bg_popup         = hsl(40.0, 48.0, 96.2),
  bg_sidebar       = hsl(38.0, 26.0, 92.8),
  bg_statusline    = hsl(36.0, 24.0, 90.8),
  fg               = hsl(24.0, 24.0, 8.5),
  fg_bright        = hsl(22.0, 28.0, 4.5),
  cursor           = hsl(24.0, 24.0, 8.5),
  fg_dark          = hsl(24.0, 18.0, 22.0),
  fg_dim           = hsl(24.0, 14.0, 28.0),

  border           = hsl(32.0, 20.0, 72.0),
  border_highlight = hsl(31.0, 22.0, 48.0),

  red              = hsl(3.0, 58.0, 38.0),
  red_dim          = hsl(2.0, 45.0, 30.0),
  orange           = hsl(28.0, 78.0, 34.0),
  orange_dim       = hsl(28.0, 68.0, 27.0),
  yellow           = hsl(42.0, 78.0, 27.0),
  yellow_dim       = hsl(43.0, 66.0, 22.0),
  green            = hsl(98.0, 48.0, 26.0),
  green_dim        = hsl(99.0, 42.0, 21.0),
  teal             = hsl(162.0, 45.0, 25.0),
  teal_dim         = hsl(164.0, 38.0, 20.0),
  blue             = hsl(209.0, 56.0, 34.0),
  blue_dim         = hsl(210.0, 44.0, 27.0),
  violet           = hsl(300.0, 28.0, 34.0),
  violet_dim       = hsl(300.0, 22.0, 27.0),
  magenta          = hsl(335.0, 42.0, 36.0),
  cyan             = hsl(186.0, 48.0, 29.0),

  selection        = hsl(36.0, 38.0, 86.0),
  none             = "NONE",

  diff_add         = hsl(95.0, 36.0, 88.0),
  diff_change      = hsl(45.0, 48.0, 86.0),
  diff_delete      = hsl(8.0, 42.0, 88.0),
  diff_text        = hsl(42.0, 48.0, 75.0),

  diag_error_bg    = hsl(8.0, 42.0, 88.0),
  diag_warn_bg     = hsl(45.0, 48.0, 86.0),
  diag_info_bg     = hsl(205.0, 34.0, 89.0),
  diag_hint_bg     = hsl(150.0, 26.0, 88.0),
}

M.colors = M.dark

return M
