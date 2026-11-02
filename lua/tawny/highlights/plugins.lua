local M = {}

-- Completion and breadcrumb kinds reuse the syntax roles; every other kind
-- stays muted so menus read as text, not as a legend.
local kinds = {
  "Array", "Boolean", "Class", "Color", "Constant", "Constructor", "Enum",
  "EnumMember", "Event", "Field", "File", "Folder", "Function", "Interface",
  "Key", "Keyword", "Method", "Module", "Namespace", "Null", "Number", "Object",
  "Operator", "Package", "Property", "Reference", "Snippet", "String", "Struct",
  "Text", "TypeParameter", "Unit", "Value", "Variable",
}

local function kind_color(c, kind)
  if kind == "Function" or kind == "Method" or kind == "Constructor" or kind == "Folder" then
    return c.blue
  elseif kind == "Keyword" or kind == "Snippet" then
    return c.orange
  elseif kind == "String" then
    return c.tawny
  elseif kind == "Class" or kind == "Struct" or kind == "Interface"
      or kind == "Enum" or kind == "TypeParameter" then
    return c.teal
  elseif kind == "Constant" or kind == "EnumMember" or kind == "Number"
      or kind == "Boolean" or kind == "Null" then
    return c.violet
  end
  return c.fg_dim
end

function M.get(c, opts)
  local comment = c.comment or c.fg_dim

  local groups = {
    -- lualine.nvim
    LualineNormal                    = { fg = c.fg, bg = c.bg_statusline },
    LualineInactive                  = { fg = c.fg_dim, bg = c.bg_dim },
    LualineA_normal                  = { fg = c.bg, bg = c.tawny, bold = true },
    LualineB_normal                  = { fg = c.fg, bg = c.bg_light },
    LualineC_normal                  = { fg = c.fg, bg = c.bg_statusline },
    LualineA_insert                  = { fg = c.bg, bg = c.green, bold = true },
    LualineB_insert                  = { fg = c.fg, bg = c.bg_light },
    LualineC_insert                  = { fg = c.fg, bg = c.bg_statusline },
    LualineA_visual                  = { fg = c.bg, bg = c.blue, bold = true },
    LualineB_visual                  = { fg = c.fg, bg = c.bg_light },
    LualineC_visual                  = { fg = c.fg, bg = c.bg_statusline },
    LualineA_replace                 = { fg = c.bg, bg = c.red, bold = true },
    LualineB_replace                 = { fg = c.fg, bg = c.bg_light },
    LualineC_replace                 = { fg = c.fg, bg = c.bg_statusline },
    LualineA_command                 = { fg = c.bg, bg = c.tawny, bold = true },
    LualineB_command                 = { fg = c.fg, bg = c.bg_light },
    LualineC_command                 = { fg = c.fg, bg = c.bg_statusline },
    LualineA_terminal                = { fg = c.bg, bg = c.tawny, bold = true },
    LualineB_terminal                = { fg = c.fg, bg = c.bg_light },
    LualineC_terminal                = { fg = c.fg, bg = c.bg_statusline },
    LualineA_inactive                = { fg = c.fg_dim, bg = c.bg_dim },
    LualineB_inactive                = { fg = c.fg_dim, bg = c.bg_dim },
    LualineC_inactive                = { fg = c.fg_dim, bg = c.bg_dim },

    -- incline.nvim
    InclineNormal                    = { fg = c.fg, bg = c.bg_light, bold = true },
    InclineNormalNC                  = { fg = c.fg_dim, bg = c.bg_statusline },

    -- Telescope
    TelescopeNormal          = { fg = c.fg, bg = c.bg_popup },
    TelescopeBorder          = { fg = c.border_highlight, bg = c.bg_popup },
    TelescopeTitle           = { fg = c.tawny, bold = true },
    TelescopePromptNormal    = { fg = c.fg, bg = c.bg_highlight },
    TelescopePromptBorder    = { fg = c.border_highlight, bg = c.bg_highlight },
    TelescopePromptTitle     = { fg = c.tawny, bg = c.bg_highlight, bold = true },
    TelescopePromptPrefix    = { fg = c.tawny },
    TelescopePromptCounter   = { fg = c.fg_dim },
    TelescopeResultsNormal   = { fg = c.fg, bg = c.bg_popup },
    TelescopeResultsBorder   = { fg = c.border_highlight, bg = c.bg_popup },
    TelescopeResultsTitle    = { fg = c.fg_dim, bg = c.bg_popup },
    TelescopePreviewNormal   = { fg = c.fg, bg = c.bg },
    TelescopePreviewBorder   = { fg = c.border, bg = c.bg },
    TelescopePreviewTitle    = { fg = c.fg_dim, bg = c.bg },
    TelescopeSelection       = { bg = c.selection },
    TelescopeSelectionCaret  = { fg = c.tawny, bg = c.selection },
    TelescopeMatching        = { fg = c.tawny, bold = true },

    -- nvim-tree
    NvimTreeNormal           = { fg = c.fg, bg = c.bg_sidebar },
    NvimTreeNormalNC         = { fg = c.fg_dim, bg = c.bg_sidebar },
    NvimTreeWinSeparator     = { fg = c.border, bg = c.bg_sidebar },
    NvimTreeCursorLine       = { bg = c.selection },
    NvimTreeRootFolder       = { fg = c.fg_dim, bold = true },
    NvimTreeFolderName       = { fg = c.blue },
    NvimTreeFolderIcon       = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
    NvimTreeEmptyFolderName  = { fg = c.fg_dim },
    NvimTreeFileName         = { fg = c.fg },
    NvimTreeExecFile         = { fg = c.fg, bold = true },
    NvimTreeGitNew           = { fg = c.green },
    NvimTreeGitDirty         = { fg = c.orange },
    NvimTreeGitDeleted       = { fg = c.red },
    NvimTreeGitStaged        = { fg = c.green },
    NvimTreeSymlink          = { fg = c.fg_dim },
    NvimTreeIndentMarker     = { fg = c.border },

    -- neo-tree
    NeoTreeNormal            = { fg = c.fg, bg = c.bg_sidebar },
    NeoTreeNormalNC          = { fg = c.fg_dim, bg = c.bg_sidebar },
    NeoTreeCursorLine        = { bg = c.selection },
    NeoTreeRootName          = { fg = c.fg_dim, bold = true },
    NeoTreeDirectoryName     = { fg = c.blue },
    NeoTreeDirectoryIcon     = { fg = c.blue },
    NeoTreeFileName          = { fg = c.fg },
    NeoTreeGitAdded          = { fg = c.green },
    NeoTreeGitModified       = { fg = c.orange },
    NeoTreeGitDeleted        = { fg = c.red },
    NeoTreeIndentMarker      = { fg = c.border },
    NeoTreeFloatBorder       = { fg = c.border },
    NeoTreeTitleBar          = { fg = c.tawny, bold = true },

    -- gitsigns
    GitSignsAdd              = { fg = c.green },
    GitSignsChange           = { fg = c.orange },
    GitSignsDelete           = { fg = c.red },
    GitSignsAddNr            = { fg = c.green },
    GitSignsChangeNr         = { fg = c.orange },
    GitSignsDeleteNr         = { fg = c.red },
    GitSignsAddLn            = { bg = c.diff_add },
    GitSignsChangeLn         = { bg = c.diff_change },
    GitSignsDeleteLn         = { bg = c.diff_delete },
    GitSignsCurrentLineBlame = { fg = c.fg_dim, italic = true },

    -- nvim-cmp
    CmpItemAbbr              = { fg = c.fg },
    CmpItemAbbrDeprecated    = { fg = c.fg_dim, strikethrough = true },
    CmpItemAbbrMatch         = { fg = c.tawny, bold = true },
    CmpItemAbbrMatchFuzzy    = { fg = c.tawny },
    CmpItemKind              = { fg = c.fg_dim },
    CmpItemMenu              = { fg = c.fg_dim, italic = true },

    -- which-key
    WhichKey               = { fg = c.tawny },
    WhichKeyGroup          = { fg = c.blue },
    WhichKeyDesc           = { fg = c.fg },
    WhichKeySeparator      = { fg = c.fg_dim },
    WhichKeyFloat          = { bg = c.bg_popup },
    WhichKeyBorder         = { fg = c.border_highlight, bg = c.bg_popup },
    WhichKeyValue          = { fg = c.fg_dim },

    -- indent-blankline
    IblIndent              = { fg = c.border },
    IblScope               = { fg = c.border_highlight },
    IblWhitespace          = { fg = c.border },

    -- mini.nvim (共通)
    MiniIndentscopeSymbol  = { fg = c.border_highlight },
    MiniCursorword         = { underline = true },
    MiniStatuslineFilename = { fg = c.fg, bg = c.bg_dim },
    MiniStatuslineFileinfo = { fg = c.fg_dim, bg = c.bg_dim },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.tawny, bold = true },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.green, bold = true },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.blue, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.tawny, bold = true },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.tawny, bold = true },

    -- dropbar.nvim
    DropBarCurrentContext      = { bg = c.selection },
    DropBarCurrentContextIcon  = { fg = c.tawny, bg = c.selection },
    DropBarCurrentContextName  = { fg = c.fg, bg = c.selection, bold = true },
    DropBarFzfMatch            = { fg = c.tawny, bold = true },
    DropBarHover               = { bg = c.selection },
    DropBarIconKindDefault     = { fg = c.fg_dim },
    DropBarIconKindDefaultNC   = { fg = c.fg_dim },
    DropBarIconUIIndicator     = { fg = c.tawny },
    DropBarIconUIPickPivot     = { fg = c.red, bold = true },
    DropBarIconUISeparator     = { fg = c.border },
    DropBarIconUISeparatorMenu = { fg = c.border },
    DropBarMenuCurrentContext  = { bg = c.selection },
    DropBarMenuFloatBorder     = { fg = c.border, bg = c.bg_dim },
    DropBarMenuHoverEntry      = { bg = c.bg_light },
    DropBarMenuHoverIcon       = { reverse = true },
    DropBarMenuHoverSymbol     = { bold = true },
    DropBarMenuNormalFloat     = { fg = c.fg, bg = c.bg_dim },
    DropBarMenuSbar            = { bg = c.bg_light },
    DropBarMenuThumb           = { bg = c.fg_dim },
    DropBarPreview             = { bg = c.selection },

    -- snacks.nvim
    SnacksIndent                    = { fg = c.border },
    SnacksIndentScope               = { fg = c.border_highlight },
    SnacksIndentChunk               = { fg = c.border_highlight },
    SnacksPickerFile                = { fg = c.fg },
    SnacksPickerDirectory           = { fg = c.blue },
    SnacksPickerDir                 = { fg = c.fg_dim },
    SnacksPickerTree                = { fg = c.border },
    SnacksPickerMatch               = { fg = c.tawny, bold = true },
    SnacksPickerSearch              = { fg = c.bg, bg = c.yellow },
    SnacksPickerPathIgnored         = { fg = c.fg_dim },
    SnacksPickerPathHidden          = { fg = c.fg_dim },
    SnacksPickerGitStatusAdded      = { fg = c.green },
    SnacksPickerGitStatusModified   = { fg = c.orange },
    SnacksPickerGitStatusDeleted    = { fg = c.red },
    SnacksPickerGitStatusRenamed    = { fg = c.orange },
    SnacksPickerGitStatusUntracked  = { fg = c.fg_dim },
    SnacksPickerGitStatusIgnored    = { fg = c.fg_dim },
    SnacksPickerGitStatusUnmerged   = { fg = c.red },
    SnacksPickerGitStatusStaged     = { fg = c.green },

    -- blink.cmp
    BlinkCmpMenu              = { fg = c.fg, bg = c.bg_popup },
    BlinkCmpMenuBorder        = { fg = c.border_highlight, bg = c.bg_popup },
    BlinkCmpMenuSelection     = { bg = c.selection, bold = true },
    BlinkCmpScrollBarThumb    = { bg = c.fg_dim },
    BlinkCmpScrollBarGutter   = { bg = c.bg_highlight },
    BlinkCmpLabel             = { fg = c.fg },
    BlinkCmpLabelDeprecated   = { fg = c.fg_dim, strikethrough = true },
    BlinkCmpLabelMatch        = { fg = c.tawny, bold = true },
    BlinkCmpLabelDetail       = { fg = c.fg_dim },
    BlinkCmpLabelDescription  = { fg = c.fg_dim },
    BlinkCmpKind              = { fg = c.fg_dim, bg = c.bg_popup },
    BlinkCmpDoc               = { fg = c.fg, bg = c.bg_popup },
    BlinkCmpDocBorder         = { fg = c.border_highlight, bg = c.bg_popup },
    BlinkCmpDocSeparator      = { fg = c.border },
    BlinkCmpDocCursorLine     = { bg = c.bg_light },
    BlinkCmpGhostText         = { fg = c.fg_dim, italic = true },
    BlinkCmpSource            = { fg = c.fg_dim },

    -- render-markdown.nvim
    RenderMarkdownCode        = { bg = c.bg_light },
    RenderMarkdownCodeInfo    = { fg = c.fg_dim, italic = true },
    RenderMarkdownCodeBorder  = { fg = c.border, bg = c.bg_light },
    RenderMarkdownCodeFallback = { fg = c.fg, bg = c.bg_light },
    RenderMarkdownCodeInline  = { fg = c.tawny, bg = c.bg_light },
    RenderMarkdownInlineHighlight = { fg = c.tawny, bg = c.bg_light, bold = true },
    RenderMarkdownQuote       = { fg = c.fg_dim, italic = true },
    RenderMarkdownBullet      = { fg = c.fg_dim },
    RenderMarkdownDash        = { fg = c.fg_dim },
    RenderMarkdownSign        = { fg = c.fg_dim, bg = c.none },
    RenderMarkdownMath        = { fg = c.fg },
    RenderMarkdownIndent      = { fg = c.border },
    RenderMarkdownHtmlComment = { fg = comment, italic = true },
    RenderMarkdownLink        = { fg = c.blue },
    RenderMarkdownLinkTitle   = { fg = c.blue, underline = true },
    RenderMarkdownWikiLink    = { fg = c.blue, underline = true },
    RenderMarkdownUnchecked   = { fg = c.fg_dim },
    RenderMarkdownChecked     = { fg = c.green, bold = true },
    RenderMarkdownTodo        = { fg = c.tawny, bold = true },
    RenderMarkdownTableHead   = { fg = c.fg, bold = true },
    RenderMarkdownTableRow    = { fg = c.fg },
    RenderMarkdownSuccess     = { fg = c.green },
    RenderMarkdownInfo        = { fg = c.blue },
    RenderMarkdownHint        = { fg = c.teal },
    RenderMarkdownWarn        = { fg = c.orange },
    RenderMarkdownError       = { fg = c.red },
  }

  for _, kind in ipairs(kinds) do
    local fg = kind_color(c, kind)
    groups["CmpItemKind" .. kind] = { fg = fg }
    groups["BlinkCmpKind" .. kind] = { fg = fg, bg = c.bg_popup }
    groups["DropBarKind" .. kind] = { fg = fg }
  end

  -- Headings are told apart by level markers, not by a rainbow.
  for level = 1, 6 do
    groups["RenderMarkdownH" .. level] = { fg = c.tawny, bold = true }
    groups["RenderMarkdownH" .. level .. "Bg"] = { bg = c.bg_light }
    groups["RenderMarkdownQuote" .. level] = { fg = c.fg_dim, italic = true }
  end

  -- Keep every part of a buffer on the same surface, including diagnostics and
  -- duplicate prefixes. Explicit colors also support transparent Normal and slants.
  local bufferline_fill = opts.transparent and c.bg or c.bg_dim
  groups.BufferLineFill = { bg = bufferline_fill }
  groups.BufferLineBackground = { fg = c.fg_dim, bg = c.bg_statusline }
  for _, state in ipairs({
    { suffix = "", bg = c.bg_statusline, fg = c.fg_dim },
    { suffix = "Visible", bg = c.bg, fg = c.fg },
    { suffix = "Selected", bg = c.bg_light, fg = c.fg },
  }) do
    local selected = state.suffix == "Selected"
    local colors = {
      Buffer = state.fg, Numbers = state.fg, Diagnostic = state.fg,
      CloseButton = selected and c.red or c.fg_dim,
      Modified = c.orange, Duplicate = c.fg_dim,
      Indicator = selected and c.tawny or state.bg,
      Separator = bufferline_fill, TabSeparator = bufferline_fill,
      Error = c.red, ErrorDiagnostic = c.red,
      Warning = c.orange, WarningDiagnostic = c.orange,
      Info = c.blue, InfoDiagnostic = c.blue,
      Hint = c.teal, HintDiagnostic = c.teal,
      Pick = c.red, Tab = state.fg,
    }
    for name, fg in pairs(colors) do
      groups["BufferLine" .. name .. state.suffix] = {
        fg = fg, bg = state.bg,
        bold = selected and (name == "Buffer" or name == "Numbers" or name == "Tab"),
        italic = false,
      }
    end
  end
  groups.BufferLineTabClose = { fg = c.red, bg = c.bg_statusline }

  return groups
end

return M
