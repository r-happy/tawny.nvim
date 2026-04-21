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
      "#d45f70", -- red
      "#83aa5f", -- green
      "#f1bc63", -- yellow
      "#739bc4", -- blue
      "#b08fae", -- magenta
      "#64a08b", -- cyan
      "#f0d3ae", -- white
    },
    brights = {
      "#3a2c26", -- bright black
      "#d45f70", -- bright red
      "#83aa5f", -- bright green
      "#f1bc63", -- bright yellow
      "#739bc4", -- bright blue
      "#b08fae", -- bright magenta
      "#64a08b", -- bright cyan
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
