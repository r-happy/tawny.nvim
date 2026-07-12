local M = {}

function M.get(c, opts)
  return {
    Normal       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat  = { fg = c.fg, bg = c.bg_popup },
    FloatShadow  = { bg = c.bg_dark, blend = 80 },
    FloatShadowThrough = { bg = c.bg_dark, blend = 100 },
    NormalNC     = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    EndOfBuffer  = { fg = opts.transparent and c.none or c.bg },

    Cursor        = { fg = c.bg, bg = c.cursor },
    lCursor       = { link = "Cursor" },
    CursorIM      = { link = "Cursor" },
    CursorLine    = { bg = c.bg_light },
    CursorColumn  = { bg = c.bg_light },
    CursorLineNr  = { fg = c.yellow, bold = true, bg = c.bg_light },
    ColorColumn   = { bg = c.bg_light },

    LineNr       = { fg = c.fg_dim, bg = opts.transparent and c.none or c.bg },
    SignColumn   = { bg = opts.transparent and c.none or c.bg },
    FoldColumn   = { fg = c.fg_dim, bg = opts.transparent and c.none or c.bg },
    Folded       = { fg = c.fg_dim, bg = c.bg_highlight },

    Search       = { fg = c.bg, bg = c.yellow },
    IncSearch    = { fg = c.bg, bg = c.orange },
    CurSearch    = { link = "IncSearch" },
    Substitute   = { fg = c.bg, bg = c.red },
    MatchParen   = { fg = c.yellow, bg = c.bg_highlight, bold = true },
    QuickFixLine = { bg = c.bg_highlight, bold = true },

    DiffAdd      = { fg = c.green, bg = c.diff_add },
    DiffChange   = { fg = c.orange, bg = c.diff_change },
    DiffDelete   = { fg = c.red, bg = c.diff_delete },
    DiffText     = { fg = c.yellow, bg = c.diff_text, bold = true },

    Visual       = { bg = c.selection },
    VisualNOS    = { link = "Visual" },

    StatusLine   = { fg = c.fg, bg = c.bg_statusline },
    StatusLineNC = { fg = c.fg_dim, bg = c.bg_dim },
    TabLine      = { fg = c.fg, bg = c.bg_statusline },
    TabLineFill  = { bg = c.bg_dim },
    TabLineSel   = { fg = c.yellow, bg = c.bg, bold = true },
    WinBar       = { fg = c.fg, bg = c.bg_statusline },
    WinBarNC     = { fg = c.fg, bg = c.bg_statusline },

    FloatBorder  = { fg = c.border_highlight, bg = c.bg_popup },
    FloatTitle   = { fg = c.yellow, bg = c.bg_popup, bold = true },

    Pmenu        = { fg = c.fg, bg = c.bg_popup },
    PmenuSel     = { fg = c.fg_bright, bg = c.selection },
    PmenuKind    = { fg = c.teal, bg = c.bg_popup },
    PmenuExtra   = { fg = c.fg_dim, bg = c.bg_popup },
    PmenuSbar    = { bg = c.bg_highlight },
    PmenuThumb   = { bg = c.border_highlight },

    WinSeparator = { fg = c.border },
    VertSplit    = { link = "WinSeparator" },
    Directory    = { fg = c.blue },
    Conceal      = { fg = c.fg_dim },
    NonText      = { fg = c.fg_dim },
    SpecialKey   = { fg = c.border_highlight },
    Whitespace   = { fg = c.fg_dim },
    Title        = { fg = c.yellow, bold = true },
    Question     = { fg = c.green },
    MoreMsg      = { fg = c.green },
    WarningMsg   = { fg = c.orange },
    ErrorMsg     = { fg = c.red, bold = true },
    ModeMsg      = { fg = c.fg_dark },
    MsgArea      = { fg = c.fg },
    MsgSeparator = { fg = c.border, bg = c.bg_statusline },
    WildMenu     = { fg = c.bg, bg = c.blue },
    SpellBad     = { undercurl = true, sp = c.red },
    SpellCap     = { undercurl = true, sp = c.blue },
    SpellLocal   = { undercurl = true, sp = c.teal },
    SpellRare    = { undercurl = true, sp = c.violet },
  }
end

return M
