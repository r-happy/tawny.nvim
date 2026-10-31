local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  -- The editor is the darkest surface; panels and bars sit a step above it.
  bg               = hsl(32.0, 8.0, 6.0),
  bg_dim           = hsl(32.0, 8.0, 7.2),
  bg_dark          = hsl(32.0, 8.0, 3.8),
  bg_light         = hsl(35.0, 14.0, 15.0),
  bg_highlight     = hsl(35.0, 14.0, 15.5),
  bg_popup         = hsl(32.0, 12.0, 10.7),
  bg_sidebar       = hsl(32.0, 10.0, 7.8),
  bg_statusline    = hsl(32.0, 10.0, 9.0),

  border           = hsl(35.0, 10.0, 21.0),
  border_highlight = hsl(35.0, 12.0, 28.0),

  selection        = hsl(35.0, 20.0, 25.0),

  -- warm readable foreground
  fg               = hsl(41.5, 18.3, 86.1),
  fg_dim           = hsl(35.0, 9.0, 52.0),
  comment          = hsl(38.0, 7.0, 55.0),
  fg_bright        = hsl(40.0, 24.0, 88.0),
  cursor           = hsl(40.0, 38.0, 76.0),
  fg_dark          = hsl(38.0, 12.0, 66.0),

  -- Honeyed strings and copper keywords; tawny doubles as the UI accent.
  tawny            = hsl(40.0, 50.0, 67.0),
  yellow           = hsl(47.0, 62.0, 68.0),
  yellow_dim       = hsl(47.0, 30.0, 49.0),

  orange           = hsl(20.0, 48.0, 64.0),
  orange_dim       = hsl(20.0, 30.0, 57.0),

  -- slightly pinker than the original red
  red              = hsl(347.0, 54.0, 67.0),
  red_dim          = hsl(347.0, 28.0, 50.0),

  -- Olive and steel accents balance the warm syntax.
  green            = hsl(88.0, 28.0, 61.0),
  green_dim        = hsl(88.0, 20.0, 45.0),

  teal             = hsl(165.0, 25.0, 62.0),
  teal_dim         = hsl(165.0, 16.0, 55.0),

  blue             = hsl(210.0, 30.0, 66.0),
  blue_dim         = hsl(210.0, 20.0, 50.0),

  violet           = hsl(290.0, 27.0, 70.0),
  violet_dim       = hsl(290.0, 16.0, 52.0),

  magenta          = hsl(331.0, 38.0, 69.0),
  cyan             = hsl(186.0, 28.0, 64.0),

  none             = "NONE",

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
  bg               = hsl(40.0, 30.0, 98.0),
  bg_dim           = hsl(38.0, 22.0, 94.0),
  bg_dark          = hsl(38.0, 20.0, 90.0),
  bg_light         = hsl(38.0, 24.0, 92.0),
  bg_highlight     = hsl(38.0, 24.0, 92.5),
  bg_popup         = hsl(40.0, 32.0, 98.4),
  bg_sidebar       = hsl(38.0, 22.0, 94.0),
  bg_statusline    = hsl(38.0, 22.0, 91.8),

  fg               = hsl(24.0, 18.3, 13.9),
  fg_bright        = hsl(22.0, 28.0, 4.5),
  cursor           = hsl(24.0, 18.3, 13.9),
  fg_dark          = hsl(24.0, 18.0, 22.0),
  fg_dim           = hsl(24.0, 14.0, 28.0),
  comment          = hsl(33.0, 9.0, 40.0),

  border           = hsl(38.0, 12.0, 72.0),
  border_highlight = hsl(38.0, 12.0, 48.0),

  -- Same hues as dark, darkened for paper instead of saturated.
  red              = hsl(352.0, 55.0, 40.0),
  red_dim          = hsl(352.0, 45.0, 32.0),
  orange           = hsl(16.0, 62.0, 38.0),
  orange_dim       = hsl(16.0, 55.0, 30.0),
  yellow           = hsl(44.0, 72.0, 27.0),
  yellow_dim       = hsl(44.0, 60.0, 22.0),
  green            = hsl(88.0, 42.0, 28.0),
  green_dim        = hsl(88.0, 35.0, 22.0),
  teal             = hsl(165.0, 45.0, 24.0),
  teal_dim         = hsl(165.0, 38.0, 20.0),
  blue             = hsl(212.0, 50.0, 38.0),
  blue_dim         = hsl(212.0, 45.0, 30.0),
  tawny            = hsl(36.0, 62.0, 30.0),
  violet           = hsl(290.0, 35.0, 38.0),
  violet_dim       = hsl(290.0, 30.0, 30.0),
  magenta          = hsl(331.0, 50.0, 38.0),
  cyan             = hsl(186.0, 45.0, 27.0),

  selection        = hsl(38.0, 38.0, 85.0),
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
