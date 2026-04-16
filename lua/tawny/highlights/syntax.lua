local M = {}

local function link(group)
  return { link = group }
end

function M.get(c, opts)
  opts = opts or {}

  local italic_comments = opts.italic_comments ~= false
  local italic_keywords = opts.italic_keywords ~= false
  local bold_todo = opts.bold_todo ~= false

  return {
    ----------------------------------------------------------------
    -- ベース実体
    ----------------------------------------------------------------
    Comment        = { fg = c.fg_dim, italic = italic_comments },

    Constant       = { fg = c.yellow },
    String         = { fg = c.green },
    Number         = { fg = c.orange },

    Identifier     = { fg = c.fg },
    Function       = { fg = c.blue },

    Statement      = { fg = c.violet },
    Keyword        = { fg = c.violet, italic = italic_keywords },
    Exception      = { fg = c.red },
    Operator       = { fg = c.fg },

    PreProc        = { fg = c.teal },
    Type           = { fg = c.teal },

    Special        = { fg = c.yellow },
    Tag            = { fg = c.blue },
    Delimiter      = { fg = c.fg_dim },

    Error          = { fg = c.red },
    Todo           = { fg = c.bg, bg = c.yellow, bold = bold_todo },
    Underlined     = { underline = true },

    ----------------------------------------------------------------
    -- エイリアス
    ----------------------------------------------------------------
    Character      = link("String"),
    Float          = link("Number"),
    Boolean        = link("Number"),

    Variable       = link("Identifier"),

    Conditional    = link("Keyword"),
    Repeat         = link("Statement"),
    Label          = link("Statement"),

    Include        = link("PreProc"),
    Define         = link("PreProc"),
    Macro          = link("PreProc"),
    PreCondit      = link("PreProc"),

    StorageClass   = link("Type"),
    Structure      = link("Type"),
    Typedef        = link("Type"),

    SpecialChar    = link("Special"),
    SpecialComment = link("Comment"),
    Debug          = link("Error"),
  }
end

return M
