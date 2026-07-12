local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  -- Background
  bg               = hsl(25.0, 8.0, 12.5), -- #221f1d
  bg_dim           = hsl(25.0, 7.0, 10.5),
  bg_dark          = hsl(25.0, 8.0, 8.5),
  bg_light         = hsl(25.0, 9.0, 15.5),
  bg_highlight     = hsl(25.0, 10.0, 18.5),
  bg_popup         = hsl(25.0, 9.0, 14.0),
  bg_sidebar       = hsl(25.0, 7.0, 10.8),
  bg_statusline    = hsl(25.0, 9.0, 14.5),

  -- Foreground
  fg               = hsl(31.8, 24.6, 72.9),
  fg_bright        = hsl(35.6, 49.1, 89.2),
  cursor           = hsl(34.4, 49.6, 75.9),
  fg_dark          = hsl(29.1, 15.6, 58.6),

  -- UI用。コード本文には原則使用しない
  fg_dim           = hsl(25.7, 8.2, 44.0),

  -- コメント専用
  comment          = hsl(25.7, 8.2, 50.0),

  border           = hsl(24.0, 21.7, 22.5),
  border_highlight = hsl(23.7, 19.4, 38.4),

  yellow           = hsl(40.9, 57.8, 63.7),
  yellow_dim       = hsl(40.7, 25.5, 45.3),

  red              = hsl(354.2, 55.1, 63.3),
  red_dim          = hsl(355.2, 28.0, 55.9),

  orange           = hsl(24.6, 61.9, 62.9),
  orange_dim       = hsl(24.3, 29.8, 48.6),

  green            = hsl(82.1, 31.8, 58.0),
  green_dim        = hsl(82.5, 17.4, 45.1),

  teal             = hsl(153.6, 30.8, 58.0),
  teal_dim         = hsl(153.2, 16.0, 46.7),

  blue             = hsl(207.4, 64.0, 65.1),
  blue_dim         = hsl(208.1, 25.6, 51.0),

  violet           = hsl(261.2, 45.5, 72.0),
  violet_dim       = hsl(260.0, 15.5, 54.5),

  magenta          = hsl(325.9, 42.5, 65.9),
  cyan             = hsl(185.9, 39.8, 59.6),

  none             = "NONE",
  selection        = hsl(24.4, 27.3, 19.4),

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
