local M = {}

function M.get(c, _)
  return {
    -- コメント
    Comment        = { fg = c.fg_dim, italic = true },

    -- 定数
    Constant       = { fg = c.yellow },
    String         = { fg = c.green },
    Character      = { fg = c.green },
    Number         = { fg = c.orange },
    Float          = { fg = c.orange },
    Boolean        = { fg = c.orange },

    -- 識別子
    Identifier     = { fg = c.fg },
    Variable       = { fg = c.fg },
    Function       = { fg = c.blue },

    -- 文・制御
    Statement      = { fg = c.violet },
    Conditional    = { fg = c.violet, italic = true },
    Repeat         = { fg = c.violet },
    Label          = { fg = c.violet },
    Keyword        = { fg = c.violet, italic = true },
    Exception      = { fg = c.red },
    Operator       = { fg = c.fg },

    -- プリプロセッサ
    PreProc        = { fg = c.teal },
    Include        = { fg = c.teal },
    Define         = { fg = c.teal },
    Macro          = { fg = c.teal },
    PreCondit      = { fg = c.teal },

    -- 型
    Type           = { fg = c.teal },
    StorageClass   = { fg = c.fg },
    Structure      = { fg = c.fg },
    Typedef        = { fg = c.fg },

    -- 特殊
    Special        = { fg = c.yellow },
    SpecialChar    = { fg = c.yellow },
    Tag            = { fg = c.blue },
    Delimiter      = { fg = c.fg_dim },
    SpecialComment = { fg = c.fg_dim, italic = true },
    Debug          = { fg = c.red },

    -- その他
    Underlined     = { underline = true },
    Error          = { fg = c.red },
    Todo           = { fg = c.bg, bg = c.yellow, bold = true },
  }
end

return M
