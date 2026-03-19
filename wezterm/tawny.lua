-- tawny dark color scheme for WezTerm
-- https://github.com/your-name/tawny.nvim

return {
  colors = {
    foreground    = "#f0d3ae",
    background    = "#171310",
    cursor_bg     = "#f0d3ae",
    cursor_border = "#f0d3ae",
    cursor_fg     = "#171310",
    selection_bg  = "#221e1b",
    selection_fg  = "#f0d3ae",

    ansi = {
      "#171310", -- black
      "#b85c4a", -- red
      "#6a8c55", -- green
      "#ddb46e", -- yellow
      "#7090a0", -- blue
      "#a48494", -- magenta
      "#5a8070", -- cyan
      "#f0d3ae", -- white
    },
    brights = {
      "#3a2c26", -- bright black
      "#b85c4a", -- bright red
      "#6a8c55", -- bright green
      "#ddb46e", -- bright yellow
      "#7090a0", -- bright blue
      "#a48494", -- bright magenta
      "#5a8070", -- bright cyan
      "#f0d3ae", -- bright white
    },

    tab_bar = {
      background = "#14100d",
      active_tab = {
        bg_color  = "#171310",
        fg_color  = "#f0d3ae",
      },
      inactive_tab = {
        bg_color  = "#14100d",
        fg_color  = "#7a6650",
      },
      inactive_tab_hover = {
        bg_color  = "#221e1b",
        fg_color  = "#f0d3ae",
      },
      new_tab = {
        bg_color  = "#14100d",
        fg_color  = "#7a6650",
      },
      new_tab_hover = {
        bg_color  = "#221e1b",
        fg_color  = "#f0d3ae",
      },
    },
  },
}
