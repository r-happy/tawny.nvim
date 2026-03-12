local M = {}

function M.get(c, _)
  return {
    -- 診断テキスト
    DiagnosticError            = { fg = c.red },
    DiagnosticWarn             = { fg = c.orange },
    DiagnosticInfo             = { fg = c.blue },
    DiagnosticHint             = { fg = c.teal },
    DiagnosticOk               = { fg = c.green },

    -- 診断アンダーライン
    DiagnosticUnderlineError   = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.orange },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.teal },

    -- 診断バーチャルテキスト
    DiagnosticVirtualTextError = { fg = c.red, bg = "#2a1a18", italic = true },
    DiagnosticVirtualTextWarn  = { fg = c.orange, bg = "#2a2010", italic = true },
    DiagnosticVirtualTextInfo  = { fg = c.blue, bg = "#182028", italic = true },
    DiagnosticVirtualTextHint  = { fg = c.teal, bg = "#182420", italic = true },

    -- 診断サイン
    DiagnosticSignError        = { fg = c.red },
    DiagnosticSignWarn         = { fg = c.orange },
    DiagnosticSignInfo         = { fg = c.blue },
    DiagnosticSignHint         = { fg = c.teal },

    -- LSPリファレンス
    LspReferenceText           = { bg = c.selection },
    LspReferenceRead           = { bg = c.selection },
    LspReferenceWrite          = { bg = c.selection, underline = true },

    -- コードレンズ
    LspCodeLens                = { fg = c.fg_dim, italic = true },
    LspCodeLensSeparator       = { fg = c.border },

    -- インレイヒント
    LspInlayHint               = { fg = c.fg_dim, bg = c.bg_light, italic = true },

    -- シグネチャヘルプ
    LspSignatureActiveParameter = { fg = c.yellow, bold = true },
  }
end

return M
