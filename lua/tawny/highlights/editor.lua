local M = {}

function M.get(c, opts)
  return {
    -- ベース
    Normal        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat   = { fg = c.fg, bg = c.bg_dim },
    NormalNC      = { fg = c.fg_dim, bg = opts.transparent and c.none or c.bg },
    NonText       = { fg = c.border },
    EndOfBuffer   = { fg = c.bg },
    SpecialKey    = { fg = c.fg_dim },

    -- カーソル・選択
    CursorLine    = { bg = c.bg_light },
    CursorColumn  = { bg = c.bg_light },
    CursorLineNr  = { fg = c.yellow, bold = true },
    Visual        = { bg = c.selection },
    VisualNOS     = { bg = c.selection },
    MatchParen    = { fg = c.orange, bold = true },

    -- 検索
    Search        = { fg = c.bg, bg = c.yellow },
    IncSearch     = { fg = c.bg, bg = c.orange },
    CurSearch     = { fg = c.bg, bg = c.orange },
    Substitute    = { fg = c.bg, bg = c.red },

    -- 行番号・サイン
    LineNr        = { fg = c.fg_dim, bg = c.bg_light },
    SignColumn    = { bg = c.bg_dim },
    FoldColumn    = { fg = c.fg_dim, bg = c.light },
    Folded        = { fg = c.fg_dim, bg = c.bg_light },

    -- ステータス・タブ
    StatusLine    = { fg = c.fg, bg = c.bg_dim },
    StatusLineNC  = { fg = c.fg_dim, bg = c.bg_dim },
    TabLine       = { fg = c.fg_dim, bg = c.bg_dim },
    TabLineSel    = { fg = c.fg, bg = c.bg },
    TabLineFill   = { bg = c.bg_dim },

    -- ウィンドウ
    WinSeparator  = { fg = c.border },
    WinBar        = { fg = c.fg, bg = c.bg_dim },
    WinBarNC      = { fg = c.fg_dim, bg = c.bg_dim },
    VertSplit     = { fg = c.border },
    ColorColumn   = { bg = c.bg_light },
    Conceal       = { fg = c.fg_dim },

    -- フロート・ボーダー
    FloatBorder   = { fg = c.border, bg = c.bg_dim },
    FloatTitle    = { fg = c.yellow, bg = c.bg_dim, bold = true },

    -- ポップアップメニュー
    Pmenu         = { fg = c.fg, bg = c.bg_dim },
    PmenuSel      = { fg = c.none, bg = c.selection },
    PmenuSbar     = { bg = c.bg_light },
    PmenuThumb    = { bg = c.fg_dim },
    PmenuKind     = { fg = c.teal, bg = c.bg_dim },
    PmenuKindSel  = { fg = c.teal, bg = c.selection },
    PmenuExtra    = { fg = c.fg_dim, bg = c.bg_dim },
    PmenuExtraSel = { fg = c.fg_dim, bg = c.selection },

    -- メッセージ
    ErrorMsg      = { fg = c.red },
    WarningMsg    = { fg = c.orange },
    MoreMsg       = { fg = c.green },
    ModeMsg       = { fg = c.fg, bold = true },
    MsgArea       = { fg = c.fg },
    MsgSeparator  = { fg = c.border },
    Question      = { fg = c.yellow },

    -- Diff
    DiffAdd       = { bg = "#1e2e1a" },
    DiffChange    = { bg = "#2a2310" },
    DiffDelete    = { bg = "#2e1a18" },
    DiffText      = { bg = "#3a3010" },

    -- スペルチェック
    SpellBad      = { undercurl = true, sp = c.red },
    SpellCap      = { undercurl = true, sp = c.yellow },
    SpellRare     = { undercurl = true, sp = c.violet },
    SpellLocal    = { undercurl = true, sp = c.teal },

    -- その他UI
    Directory     = { fg = c.blue },
    Title         = { fg = c.yellow, bold = true },
    QuickFixLine  = { bg = c.selection },
    WildMenu      = { fg = c.bg, bg = c.yellow },
    Whitespace    = { fg = c.border },
  }
end

return M
