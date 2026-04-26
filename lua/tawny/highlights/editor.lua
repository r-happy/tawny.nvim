local M = {}

function M.get(c, opts)
  return {
    Normal       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat  = { fg = c.fg, bg = c.bg_dim },
    NormalNC     = { fg = c.fg_dim, bg = opts.transparent and c.none or c.bg },
    EndOfBuffer  = { fg = opts.transparent and c.none or c.bg },

    CursorLine   = { bg = c.bg_light },
    CursorColumn = { bg = c.bg_light },
    CursorLineNr = { fg = c.yellow, bold = true, bg = c.bg_light },

    LineNr       = { fg = c.fg_dim, bg = c.bg_light },
    SignColumn   = { bg = c.none },
    FoldColumn   = { fg = c.fg_dim, bg = c.none },
    Folded       = { fg = c.fg_dim, bg = c.bg_light },

    Search       = { fg = c.bg, bg = c.yellow },
    IncSearch    = { fg = c.bg, bg = c.orange },
    CurSearch    = { link = "IncSearch" },

    Visual       = { bg = c.selection },
    VisualNOS    = { link = "Visual" },

    StatusLine   = { fg = c.fg, bg = c.bg_dim },
    StatusLineNC = { fg = c.fg_dim, bg = c.bg_dim },
    WinBar       = { fg = c.fg, bg = c.bg_dim },
    WinBarNC     = { fg = c.fg_dim, bg = c.bg_dim },

    FloatBorder  = { fg = c.border, bg = c.bg_dim },
    FloatTitle   = { fg = c.yellow, bg = c.bg_dim, bold = true },

    Pmenu        = { fg = c.fg, bg = c.bg_dim },
    PmenuSel     = { fg = c.fg, bg = c.selection },
    PmenuSbar    = { bg = c.bg_light },
    PmenuThumb   = { bg = c.fg_dim },

    WinSeparator = { fg = c.border },
    VertSplit    = { link = "WinSeparator" },
  }
end

return M
