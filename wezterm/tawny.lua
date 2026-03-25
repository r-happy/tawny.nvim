-- tawny dark color scheme for WezTerm
-- https://github.com/your-name/tawny.nvim

return {
  colors = {
    foreground    = "#f0d3ae",
    background    = "#171310",
    cursor_bg     = "#f0d3ae",
    cursor_border = "#f0d3ae",
    cursor_fg     = "#171310",
    selection_bg  = "#3a2e28",
    selection_fg  = "#f0d3ae",

    ansi = {
      "#171310", -- black
      "#c05868", -- red
      "#7a9860", -- green
      "#ddb46e", -- yellow
      "#6888a8", -- blue
      "#a48494", -- magenta
      "#5e8c7a", -- cyan
      "#f0d3ae", -- white
    },
    brights = {
      "#3a2c26", -- bright black
      "#c05868", -- bright red
      "#7a9860", -- bright green
      "#ddb46e", -- bright yellow
      "#6888a8", -- bright blue
      "#a48494", -- bright magenta
      "#5e8c7a", -- bright cyan
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
        fg_color  = "#9a7f68",
      },
      inactive_tab_hover = {
        bg_color  = "#221e1b",
        fg_color  = "#f0d3ae",
      },
      new_tab = {
        bg_color  = "#14100d",
        fg_color  = "#9a7f68",
      },
      new_tab_hover = {
        bg_color  = "#221e1b",
        fg_color  = "#f0d3ae",
      },
    },
  },
}
