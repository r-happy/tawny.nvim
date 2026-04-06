-- tawny dark color scheme for WezTerm
-- https://github.com/your-name/tawny.nvim

return {
  colors = {
    foreground    = "#ead6b4",
    background    = "#2b241f",
    cursor_bg     = "#ead6b4",
    cursor_border = "#ead6b4",
    cursor_fg     = "#2b241f",
    selection_bg  = "#43362d",
    selection_fg  = "#ead6b4",

    ansi = {
      "#241d19", -- black
      "#c86a68", -- red
      "#86a96c", -- green
      "#dfb978", -- yellow
      "#7f98b2", -- blue
      "#b0919e", -- magenta
      "#6f9c89", -- cyan
      "#ead6b4", -- white
    },
    brights = {
      "#5d4d42", -- bright black
      "#c86a68", -- bright red
      "#86a96c", -- bright green
      "#dfb978", -- bright yellow
      "#7f98b2", -- bright blue
      "#b0919e", -- bright magenta
      "#6f9c89", -- bright cyan
      "#ead6b4", -- bright white
    },

    tab_bar = {
      background = "#241d19",
      active_tab = {
        bg_color  = "#2b241f",
        fg_color  = "#ead6b4",
      },
      inactive_tab = {
        bg_color  = "#241d19",
        fg_color  = "#b39a82",
      },
      inactive_tab_hover = {
        bg_color  = "#35302a",
        fg_color  = "#ead6b4",
      },
      new_tab = {
        bg_color  = "#241d19",
        fg_color  = "#b39a82",
      },
      new_tab_hover = {
        bg_color  = "#35302a",
        fg_color  = "#ead6b4",
      },
    },
  },
}
