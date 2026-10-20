local M = {}
local hsl = require("tawny.util.color").hsl

M.dark = {
  bg               = hsl(32.0, 8.0, 9.4),
  bg_dim           = hsl(32.0, 8.0, 8.0),
  bg_dark          = hsl(32.0, 8.0, 6.5),
  bg_light         = hsl(35.0, 14.0, 15.0),
  bg_highlight     = hsl(35.0, 14.0, 15.5),
  bg_popup         = hsl(32.0, 12.0, 10.7),
  bg_sidebar       = hsl(32.0, 10.0, 8.7),
  bg_statusline    = hsl(32.0, 10.0, 7.3),

  border           = hsl(35.0, 10.0, 18.0),
  border_highlight = hsl(35.0, 12.0, 28.0),

  selection        = hsl(35.0, 18.0, 22.0),

  -- warm readable foreground
  fg               = hsl(41.5, 18.3, 86.1),
  fg_dim           = hsl(35.0, 9.0, 52.0),
  comment          = hsl(38.0, 8.0, 58.0),
  fg_bright        = hsl(40.0, 24.0, 88.0),
  cursor           = hsl(40.0, 38.0, 76.0),
  fg_dark          = hsl(38.0, 12.0, 66.0),

  -- Honeyed strings, brass types, and copper keywords.
  tawny            = hsl(35.0, 52.0, 65.0),
  yellow           = hsl(47.0, 62.0, 68.0),
  yellow_dim       = hsl(47.0, 30.0, 49.0),

  orange           = hsl(28.0, 55.0, 62.0),
  orange_dim       = hsl(27.0, 30.0, 57.0),

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

  border           = hsl(38.0, 12.0, 72.0),
  border_highlight = hsl(38.0, 12.0, 48.0),

  red              = hsl(3.0, 58.0, 38.0),
  red_dim          = hsl(2.0, 45.0, 30.0),
  orange           = hsl(28.0, 78.0, 34.0),
  orange_dim       = hsl(28.0, 68.0, 27.0),
  yellow           = hsl(42.0, 78.0, 27.0),
  yellow_dim       = hsl(43.0, 66.0, 22.0),
  green            = hsl(88.0, 36.0, 28.0),
  green_dim        = hsl(88.0, 30.0, 22.0),
  teal             = hsl(162.0, 45.0, 25.0),
  teal_dim         = hsl(164.0, 38.0, 20.0),
  blue             = hsl(210.0, 45.0, 33.0),
  blue_dim         = hsl(210.0, 34.0, 27.0),
  tawny            = hsl(34.0, 62.0, 32.0),
  violet           = hsl(300.0, 28.0, 34.0),
  violet_dim       = hsl(300.0, 22.0, 27.0),
  magenta          = hsl(335.0, 42.0, 36.0),
  cyan             = hsl(186.0, 48.0, 29.0),

  selection        = hsl(38.0, 28.0, 88.0),
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

-- Syntax roles stay in the palette so highlights and companion themes agree.
M.light.string   = M.light.green
M.light.type     = M.light.violet
M.light.number   = M.light.magenta
M.light.constant = M.light.magenta
M.light.comment  = hsl(33.0, 9.0, 40.0)

M.colors = M.dark

return M
