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

  -- Comments, strings, keywords, functions, types, and constants carry the main
  -- colors; treesitter.lua adds fields, parameters, and modules. Variables and
  -- punctuation stay on fg.
  return {
    ----------------------------------------------------------------
    -- ベース実体
    ----------------------------------------------------------------
    Comment        = vim.tbl_extend(
      "force",
      { fg = c.comment },
      comment_style
    ),

    Operator       = { fg = c.orange_dim },
    Special        = { fg = c.blue },
    Delimiter      = { fg = c.fg },

    Constant       = { fg = c.violet },
    String         = { fg = c.tawny },
    Number         = { fg = c.violet },

    Identifier     = { fg = c.fg },
    Function       = { fg = c.blue },

    Statement      = { fg = c.orange },
    Keyword        = vim.tbl_extend(
      "force",
      { fg = c.orange },
      keyword_style
    ),

    Exception      = { fg = c.orange },

    PreProc        = { fg = c.orange },
    Type           = { fg = c.teal },

    Tag            = { fg = c.blue },

    Error          = { fg = c.red, bold = true },
    Todo           = { fg = c.tawny, bold = bold_todo },
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
