local M = {}

function M.get(c, opts)
  opts = opts or {}
  local styles = opts.styles or {}
  local keyword_style = styles.keywords or {}

  return {
    -- 変数
    ["@variable"]              = { link = "Variable" },
    ["@variable.builtin"]      = { fg = c.orange },
    ["@variable.parameter"]    = { fg = c.fg_dark },
    ["@variable.member"]       = { fg = c.yellow_dim },
    -- キーワード
    ["@keyword"]               = vim.tbl_extend("force", { fg = c.violet }, keyword_style),
    ["@keyword.function"]      = vim.tbl_extend("force", { fg = c.violet }, keyword_style),
    ["@keyword.operator"]      = { link = "Operator" },
    ["@keyword.import"]        = { link = "Include" },
    ["@keyword.conditional"]   = { link = "Conditional" },
    ["@keyword.repeat"]        = { link = "Repeat" },
    ["@keyword.return"]        = { link = "Keyword" },
    ["@keyword.exception"]     = { link = "Exception" },
    ["@keyword.type"]          = { link = "Keyword" },
    -- 関数
    ["@function"]              = { link = "Function" },
    ["@function.builtin"]      = { fg = c.blue, italic = true },
    ["@function.call"]         = { link = "Function" },
    ["@function.method"]       = { link = "Function" },
    ["@function.method.call"]  = { link = "Function" },
    -- 型
    ["@type"]                  = { link = "Type" },
    ["@type.builtin"]          = { fg = c.teal_dim, italic = true },
    ["@type.definition"]       = { fg = c.teal },
    -- 定数
    ["@constant"]              = { link = "Constant" },
    ["@constant.builtin"]      = { fg = c.yellow, italic = true },
    ["@constant.macro"]        = { link = "Macro" },
    -- 文字列
    ["@string"]                = { link = "String" },
    ["@string.regexp"]         = { fg = c.teal },
    ["@string.escape"]         = { fg = c.yellow },
    ["@string.special"]        = { fg = c.yellow },
    -- 数値
    ["@number"]                = { link = "Number" },
    ["@number.float"]          = { link = "Float" },
    ["@boolean"]               = { link = "Boolean" },
    -- コメント
    ["@comment"]               = { link = "Comment" },
    ["@comment.todo"]          = { link = "Todo" },
    ["@comment.error"]         = { fg = c.red, italic = true },
    ["@comment.warning"]       = { fg = c.orange, italic = true },
    ["@comment.note"]          = { fg = c.blue, italic = true },
    -- 構造
    ["@constructor"]           = { link = "Function" },
    ["@property"]              = { fg = c.yellow },
    ["@attribute"]             = { fg = c.teal },
    ["@operator"]              = { fg = c.fg_dim },
    ["@label"]                 = { fg = c.violet },
    -- 区切り
    ["@punctuation.bracket"]   = { fg = c.fg_dark },
    ["@punctuation.delimiter"] = { fg = c.fg_dim },
    ["@punctuation.special"]   = { fg = c.yellow },
    -- モジュール
    ["@module"]                = { fg = c.teal, italic = true },
    ["@namespace"]             = { fg = c.teal, italic = true },
    -- タグ（HTML/JSX）
    ["@tag"]                   = { fg = c.blue },
    ["@tag.attribute"]         = { fg = c.teal },
    ["@tag.delimiter"]         = { fg = c.border },
  }
end

return M
