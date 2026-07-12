local M = {}

local function link(group)
  return { link = group }
end

function M.get(c, opts)
  opts = opts or {}
  local styles = opts.styles or {}

  local comment_style = styles.comments or {}
  local keyword_style = styles.keywords or {}
  local bold_todo = opts.bold_todo ~= false

  return {
    ----------------------------------------------------------------
    -- ベース実体
    ----------------------------------------------------------------
    Comment        = vim.tbl_extend(
      "force",
      { fg = c.comment },
      comment_style
    ),

    Operator       = { fg = c.fg_dark },
    Special        = { fg = c.orange_dim },
    Delimiter      = { fg = c.fg_dark },

    Constant       = { fg = c.yellow },
    String         = { fg = c.green },
    Number         = { fg = c.orange },

    Identifier     = { fg = c.fg },
    Function       = { fg = c.blue },

    Statement      = { fg = c.violet },
    Keyword        = vim.tbl_extend(
      "force",
      { fg = c.violet },
      keyword_style
    ),

    Exception      = { fg = c.red },

    PreProc        = { fg = c.teal },
    Type           = { fg = c.teal },

    Tag            = { fg = c.blue },

    Error          = { fg = c.red, bold = true },
    Todo           = { fg = c.bg, bg = c.yellow, bold = bold_todo },
    Underlined     = { fg = c.blue, underline = true },

    ----------------------------------------------------------------
    -- エイリアス
    ----------------------------------------------------------------
    Character      = link("String"),
    Float          = link("Number"),
    Boolean        = link("Constant"),

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
