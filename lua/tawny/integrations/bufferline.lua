local M = {}

function M.get(defaults)
  local colors = require("tawny").get_colors()
  assert(colors, "tawny must be loaded before configuring bufferline")

  return vim.tbl_deep_extend("force", {}, defaults, {
    fill = {
      bg = colors.bg_dim,
    },
    background = {
      fg = colors.fg_dim,
      bg = colors.bg_statusline,
    },
    buffer = {
      fg = colors.fg_dim,
      bg = colors.bg_statusline,
    },
    buffer_visible = {
      fg = colors.fg,
      bg = colors.bg_statusline,
    },
    buffer_selected = {
      fg = colors.bg,
      bg = colors.yellow_dim,
      bold = true,
      italic = false,
    },
    separator = {
      fg = colors.bg_dim,
      bg = colors.bg_statusline,
    },
    separator_visible = {
      fg = colors.bg_dim,
      bg = colors.bg_statusline,
    },
    separator_selected = {
      fg = colors.bg_statusline,
      bg = colors.yellow_dim,
    },
    close_button_selected = {
      fg = colors.red,
      bg = colors.yellow_dim,
    },
    modified_selected = {
      fg = colors.orange,
      bg = colors.yellow_dim,
    },
    diagnostic_selected = {
      fg = colors.fg,
      bg = colors.yellow_dim,
    },
    error_selected = {
      fg = colors.red,
      bg = colors.yellow_dim,
    },
    warning_selected = {
      fg = colors.orange,
      bg = colors.yellow_dim,
    },
    info_selected = {
      fg = colors.blue,
      bg = colors.yellow_dim,
    },
    hint_selected = {
      fg = colors.teal,
      bg = colors.yellow_dim,
    },
  })
end

return M
