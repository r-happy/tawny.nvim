-- tawny dark color scheme for WezTerm
-- https://github.com/your-name/tawny.nvim

return {
  colors = {
    foreground    = "#e2d1b3",
    background    = "#28211d",
    cursor_bg     = "#e2d1b3",
    cursor_border = "#e2d1b3",
    cursor_fg     = "#28211d",
    selection_bg  = "#43362d",
    selection_fg  = "#e2d1b3",

    ansi = {
      "#211a17", -- black
      "#b67a70", -- red
      "#7e9670", -- green
      "#cdb07a", -- yellow
      "#798da0", -- blue
      "#9f8b95", -- magenta
      "#6d8f82", -- cyan
      "#e2d1b3", -- white
    },
    brights = {
      "#584a40", -- bright black
      "#b67a70", -- bright red
      "#7e9670", -- bright green
      "#cdb07a", -- bright yellow
      "#798da0", -- bright blue
      "#9f8b95", -- bright magenta
      "#6d8f82", -- bright cyan
      "#e2d1b3", -- bright white
    },

    tab_bar = {
      background = "#211a17",
      active_tab = {
        bg_color  = "#28211d",
        fg_color  = "#e2d1b3",
      },
      inactive_tab = {
        bg_color  = "#211a17",
        fg_color  = "#aa947d",
      },
      inactive_tab_hover = {
        bg_color  = "#312c27",
        fg_color  = "#e2d1b3",
      },
      new_tab = {
        bg_color  = "#211a17",
        fg_color  = "#aa947d",
      },
      new_tab_hover = {
        bg_color  = "#312c27",
        fg_color  = "#e2d1b3",
      },
    },
  },
}
