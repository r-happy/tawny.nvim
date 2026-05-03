-- tawny dark color scheme for WezTerm
-- https://github.com/your-name/tawny.nvim

return {
  colors = {
    foreground    = "#f1d8b8",
    background    = "#16110e",
    cursor_bg     = "#fff0d2",
    cursor_border = "#fff0d2",
    cursor_fg     = "#16110e",
    selection_bg  = "#3a3029",
    selection_fg  = "#f1d8b8",

    ansi = {
      "#0b0807", -- black
      "#e26d7d", -- red
      "#96bd6f", -- green
      "#f4c96b", -- yellow
      "#7eadd6", -- blue
      "#c09ac0", -- magenta
      "#6fb9a1", -- cyan
      "#b99a7c", -- white
    },
    brights = {
      "#927963", -- bright black
      "#e26d7d", -- bright red
      "#96bd6f", -- bright green
      "#f4c96b", -- bright yellow
      "#7eadd6", -- bright blue
      "#d184a5", -- bright magenta
      "#7fc7c8", -- bright cyan
      "#fff0d2", -- bright white
    },

    tab_bar = {
      background = "#100c0a",
      active_tab = {
        bg_color  = "#16110e",
        fg_color  = "#f1d8b8",
      },
      inactive_tab = {
        bg_color  = "#100c0a",
        fg_color  = "#927963",
      },
      inactive_tab_hover = {
        bg_color  = "#211b17",
        fg_color  = "#f1d8b8",
      },
      new_tab = {
        bg_color  = "#100c0a",
        fg_color  = "#927963",
      },
      new_tab_hover = {
        bg_color  = "#211b17",
        fg_color  = "#f1d8b8",
      },
    },
  },
}
