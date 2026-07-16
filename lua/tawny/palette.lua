local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  -- olive-gray base
  bg               = hsl(72.0, 6.0, 15.5),
  bg_dim           = hsl(72.0, 6.0, 13.0),
  bg_dark          = hsl(72.0, 7.0, 11.0),
  bg_light         = hsl(72.0, 6.0, 18.5),
  bg_highlight     = hsl(72.0, 7.0, 22.0),
  bg_popup         = hsl(72.0, 6.0, 16.5),
  bg_sidebar       = hsl(72.0, 6.0, 14.0),
  bg_statusline    = hsl(72.0, 6.0, 13.5),

  -- warm readable foreground
  fg               = hsl(40.0, 18.0, 80.0),
  fg_bright        = hsl(40.0, 24.0, 88.0),
  cursor           = hsl(40.0, 38.0, 76.0),
  fg_dark          = hsl(38.0, 12.0, 66.0),
  fg_dim           = hsl(55.0, 7.0, 52.0),
  comment          = hsl(60.0, 8.0, 58.0),

  border           = hsl(72.0, 7.0, 27.0),
  border_highlight = hsl(68.0, 8.0, 38.0),

  -- tawny accents with restrained Monokai influence
  yellow           = hsl(47.0, 62.0, 68.0),
  yellow_dim       = hsl(47.0, 30.0, 49.0),

  orange           = hsl(28.0, 55.0, 62.0),
  orange_dim       = hsl(27.0, 30.0, 47.0),

  -- slightly pinker than the original red
  red              = hsl(347.0, 54.0, 67.0),
  red_dim          = hsl(347.0, 28.0, 50.0),

  -- muted yellow-green rather than vivid Monokai green
  green            = hsl(84.0, 38.0, 64.0),
  green_dim        = hsl(84.0, 22.0, 45.0),

  teal             = hsl(165.0, 25.0, 62.0),
  teal_dim         = hsl(165.0, 16.0, 44.0),

  blue             = hsl(212.0, 42.0, 68.0),
  blue_dim         = hsl(212.0, 24.0, 50.0),

  violet           = hsl(290.0, 27.0, 70.0),
  violet_dim       = hsl(290.0, 16.0, 52.0),

  magenta          = hsl(331.0, 38.0, 69.0),
  cyan             = hsl(186.0, 28.0, 64.0),

  none             = "NONE",
  selection        = hsl(72.0, 8.0, 24.0),

  diff_add         = hsl(123.0, 18.0, 20.0),
  diff_change      = hsl(42.0, 24.0, 20.0),
  diff_delete      = hsl(357.0, 22.0, 21.0),
  diff_text        = hsl(38.0, 28.0, 26.0),

  diag_error_bg    = hsl(357.0, 22.0, 21.0),
  diag_warn_bg     = hsl(42.0, 24.0, 20.0),
  diag_info_bg     = hsl(205.0, 22.0, 20.0),
  diag_hint_bg     = hsl(168.0, 18.0, 19.0),
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
