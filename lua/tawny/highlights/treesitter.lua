local M = {}

function M.get(c, opts)
  opts = opts or {}

  local styles = opts.styles or {}
  local comment_style = styles.comments or {}

  return {
    ----------------------------------------------------------------
    -- 変数
    ----------------------------------------------------------------
    ["@variable"]              = { link = "Variable" },
    ["@variable.builtin"]      = { fg = c.fg },
    ["@variable.parameter"]    = { fg = c.fg },
    ["@variable.member"]       = { fg = c.fg },

    ["@property"]              = { fg = c.fg },
    ["@attribute"]             = { fg = c.fg },
    ["@operator"]              = { link = "Operator" },

    ["@module"]                = { fg = c.fg },
    ["@namespace"]             = { fg = c.fg },

    ----------------------------------------------------------------
    -- キーワード
    ----------------------------------------------------------------
    ["@keyword"]               = { link = "Keyword" },
    ["@keyword.function"]      = { link = "Keyword" },

    ["@keyword.operator"]      = { link = "Operator" },
    ["@keyword.import"]        = { link = "Include" },
    ["@keyword.conditional"]   = { link = "Conditional" },
    ["@keyword.repeat"]        = { link = "Repeat" },
    ["@keyword.return"]        = { link = "Keyword" },
    ["@keyword.exception"]     = { link = "Exception" },
    ["@keyword.type"]          = { link = "Keyword" },

    ----------------------------------------------------------------
    -- 関数
    ----------------------------------------------------------------
    ["@function"]              = { link = "Function" },
    ["@function.builtin"]      = { link = "Function" },
    ["@function.call"]         = { link = "Function" },
    ["@function.method"]       = { link = "Function" },
    ["@function.method.call"]  = { link = "Function" },

    ----------------------------------------------------------------
    -- 型
    ----------------------------------------------------------------
    ["@type"]                  = { link = "Type" },
    ["@type.builtin"]          = { link = "Type" },
    ["@type.definition"]       = { link = "Type" },

    ----------------------------------------------------------------
    -- 定数
    ----------------------------------------------------------------
    ["@constant"]              = { link = "Constant" },
    ["@constant.builtin"]      = { link = "Constant" },
    ["@constant.macro"]        = { link = "Macro" },

    ----------------------------------------------------------------
    -- 文字列
    ----------------------------------------------------------------
    ["@string"]                = { link = "String" },
    ["@string.regexp"]         = { link = "String" },
    ["@string.escape"]         = { fg = c.blue },
    ["@string.special"]        = { link = "String" },

    ----------------------------------------------------------------
    -- 数値
    ----------------------------------------------------------------
    ["@number"]                = { link = "Number" },
    ["@number.float"]          = { link = "Float" },
    ["@boolean"]               = { link = "Boolean" },

    ----------------------------------------------------------------
    -- コメント
    ----------------------------------------------------------------
    ["@comment"]               = { link = "Comment" },
    ["@comment.todo"]          = { link = "Todo" },
    ["@comment.error"]         = vim.tbl_extend("force", { fg = c.red }, comment_style),
    ["@comment.warning"]       = vim.tbl_extend("force", { fg = c.orange }, comment_style),
    ["@comment.note"]          = vim.tbl_extend("force", { fg = c.blue }, comment_style),

    ----------------------------------------------------------------
    -- 構造
    ----------------------------------------------------------------
    ["@constructor"]           = { link = "Function" },
    ["@label"]                 = { fg = c.fg },

    ----------------------------------------------------------------
    -- 区切り
    ----------------------------------------------------------------
    ["@punctuation.bracket"]   = { link = "Delimiter" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.special"]   = { link = "Delimiter" },

    ----------------------------------------------------------------
    -- HTML / JSX
    ----------------------------------------------------------------
    ["@tag"]                   = { fg = c.blue },
    ["@tag.attribute"]         = { fg = c.fg },
    ["@tag.delimiter"]         = { link = "Delimiter" },
  }
end

return M
