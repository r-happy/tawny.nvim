local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  bg               = hsl(25.0, 2.0, 8.0),
  bg_dim           = hsl(25.0, 2.0, 7.0),
  bg_dark          = hsl(25.0, 2.0, 5.4),
  bg_light         = hsl(25.0, 3.0, 10.8),
  bg_highlight     = hsl(25.0, 3.0, 13.8),
  bg_popup         = hsl(25.0, 3.0, 9.6),
  bg_sidebar       = hsl(25.0, 2.0, 7.4),
  bg_statusline    = hsl(25.0, 3.0, 9.4),

  fg               = hsl(33.7, 24.0, 72.0),
  fg_bright        = hsl(40.0, 40.0, 88.0),
  cursor           = hsl(35.0, 40.0, 75.0),
  fg_dark          = hsl(29.5, 18.0, 58.0),
  fg_dim           = hsl(28.1, 10.0, 46.0),

  border           = hsl(22.9, 10.0, 21.0),
  border_highlight = hsl(24.6, 13.0, 35.0),

  yellow           = hsl(41.2, 50.0, 70.0),
  yellow_dim       = hsl(36.8, 30.0, 47.0),

  red              = hsl(351.8, 52.0, 63.0),
  red_dim          = hsl(352.9, 28.0, 46.0),

  orange           = hsl(28.1, 55.0, 69.0),
  orange_dim       = hsl(24.7, 38.0, 45.0),

  green            = hsl(90.0, 28.0, 68.0),
  green_dim        = hsl(91.0, 22.0, 42.0),

  teal             = hsl(160.5, 25.0, 68.0),
  teal_dim         = hsl(161.9, 21.0, 41.0),

  blue             = hsl(208.0, 36.0, 70.0),
  blue_dim         = hsl(209.1, 23.0, 48.0),

  violet           = hsl(300.0, 18.0, 70.0),
  violet_dim       = hsl(298.2, 11.0, 48.0),

  magenta          = hsl(334.3, 28.0, 70.0),
  cyan             = hsl(180.8, 28.0, 69.0),

  none             = "NONE",
  selection        = hsl(24.7, 11.0, 18.0),

  diff_add         = hsl(123.5, 15.0, 16.5),
  diff_change      = hsl(41.4, 23.0, 16.5),
  diff_delete      = hsl(357.8, 21.0, 18.0),
  diff_text        = hsl(37.6, 30.0, 22.0),

  diag_error_bg    = hsl(357.8, 21.0, 18.0),
  diag_warn_bg     = hsl(41.4, 23.0, 16.5),
  diag_info_bg     = hsl(205.4, 21.0, 16.5),
  diag_hint_bg     = hsl(168.0, 18.0, 15.5),
}

M.light = {
  bg               = hsl(40.0, 16.0, 97.0),
  bg_dim           = hsl(38.0, 12.0, 94.0),
  bg_dark          = hsl(36.0, 10.0, 90.0),
  bg_light         = hsl(42.0, 18.0, 98.4),
  bg_highlight     = hsl(36.0, 12.0, 92.5),
  bg_popup         = hsl(40.0, 14.0, 97.4),
  bg_sidebar       = hsl(38.0, 10.0, 94.0),
  bg_statusline    = hsl(36.0, 10.0, 91.8),

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
