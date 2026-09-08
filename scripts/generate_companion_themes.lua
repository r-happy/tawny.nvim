local palette = require("tawny.palette")

local function list(items)
  return { __array = true, items = items }
end

local function escape_string(value)
  return value:gsub("\\", "\\\\"):gsub('"', '\\"')
end

local function is_array(tbl)
  if tbl.__array == true and type(tbl.items) == "table" then
    return true
  end

  local max = 0
  local count = 0
  for key, _ in pairs(tbl) do
    if type(key) ~= "number" or key < 1 or key % 1 ~= 0 then
      return false
    end
    if key > max then max = key end
    count = count + 1
  end

  return max == count
end

local function json_encode(value, indent)
  indent = indent or 0

  if value == nil then return "null" end

  local value_type = type(value)
  if value_type == "string" then
    return '"' .. escape_string(value) .. '"'
  end
  if value_type == "number" or value_type == "boolean" then
    return tostring(value)
  end

  if value_type ~= "table" then
    error("unsupported json type: " .. value_type)
  end

  local next_indent = indent + 2
  local pad = string.rep(" ", indent)
  local next_pad = string.rep(" ", next_indent)

  if value.__array == true then
    value = value.items
  end

  if is_array(value) then
    if #value == 0 then return "[]" end

    local parts = {}
    for i, item in ipairs(value) do
      parts[i] = next_pad .. json_encode(item, next_indent)
    end

    return "[\n" .. table.concat(parts, ",\n") .. "\n" .. pad .. "]"
  end

  local keys = {}
  for key in pairs(value) do
    keys[#keys + 1] = key
  end
  table.sort(keys)

  if #keys == 0 then return "{}" end

  local parts = {}
  for i, key in ipairs(keys) do
    parts[i] = next_pad .. json_encode(key) .. ": " .. json_encode(value[key], next_indent)
  end

  return "{\n" .. table.concat(parts, ",\n") .. "\n" .. pad .. "}"
end

local function lua_encode(value, indent)
  indent = indent or 0

  local value_type = type(value)
  if value_type == "string" then
    return '"' .. escape_string(value) .. '"'
  end
  if value_type == "number" or value_type == "boolean" then
    return tostring(value)
  end

  if value_type ~= "table" then
    error("unsupported lua type: " .. value_type)
  end

  local next_indent = indent + 2
  local pad = string.rep(" ", indent)
  local next_pad = string.rep(" ", next_indent)

  if value.__array == true then
    value = value.items
  end

  if is_array(value) then
    if #value == 0 then return "{}" end

    local parts = {}
    for i, item in ipairs(value) do
      parts[i] = next_pad .. lua_encode(item, next_indent)
    end

    return "{\n" .. table.concat(parts, ",\n") .. "\n" .. pad .. "}"
  end

  local keys = {}
  for key in pairs(value) do
    keys[#keys + 1] = key
  end
  table.sort(keys)

  local parts = {}
  for i, key in ipairs(keys) do
    local lua_key = key:match("^[%a_][%w_]*$") and key or string.format("[%q]", key)
    parts[i] = next_pad .. lua_key .. " = " .. lua_encode(value[key], next_indent)
  end

  return "{\n" .. table.concat(parts, ",\n") .. "\n" .. pad .. "}"
end

local function write_file(path, content)
  local file = assert(io.open(path, "w"))
  file:write(content)
  file:close()
end

local function terminal_palette(c)
  return {
    ansi = {
      c.bg_dark,
      c.red,
      c.green,
      c.yellow,
      c.blue,
      c.violet,
      c.teal,
      c.fg_dark,
    },
    brights = {
      c.fg_dim,
      c.red,
      c.green,
      c.yellow,
      c.blue,
      c.magenta or c.violet,
      c.cyan or c.teal,
      c.fg_bright,
    },
    dims = {
      black = c.border,
      red = c.red_dim or c.red,
      green = c.green_dim or c.green,
      yellow = c.yellow_dim or c.yellow,
      blue = c.blue_dim or c.blue,
      magenta = c.violet_dim or c.violet,
      cyan = c.teal_dim or c.teal,
      white = c.fg_dark,
    },
  }
end

-- Resolve Neovim's default syntax roles instead of maintaining a second palette
-- of token meanings. Companion themes follow future changes to these highlights.
local function syntax_colors(c)
  local groups = vim.tbl_extend("force",
    require("tawny.highlights.syntax").get(c, {}),
    require("tawny.highlights.treesitter").get(c, {}))
  local roles = {
    comment = "Comment", keyword = "Keyword", variable = "Identifier",
    parameter = "@variable.parameter", property = "@property",
    builtin = "@variable.builtin", namespace = "@module",
    boolean = "Boolean", number = "Number", constant = "Constant",
    string = "String", escape = "@string.escape", regexp = "@string.regexp",
    punctuation = "Delimiter", operator = "Operator", preproc = "PreProc",
    ["function"] = "Function", type = "Type", tag = "@tag", attribute = "@tag.attribute",
  }
  local result = {}
  for role, name in pairs(roles) do
    local group = assert(groups[name], name)
    while group.link do group = assert(groups[group.link], group.link) end
    result[role] = assert(group.fg, name)
  end
  return result
end

local function vscode_theme(name, theme_type, c)
  local terminal = terminal_palette(c)
  local s = syntax_colors(c)

  return {
    name = name,
    type = theme_type,
    semanticHighlighting = true,
    colors = {
      ["foreground"] = c.fg,
      ["descriptionForeground"] = c.fg_dark,
      ["disabledForeground"] = c.fg_dim,
      ["errorForeground"] = c.red,
      ["icon.foreground"] = c.fg,
      ["focusBorder"] = c.yellow,
      ["selection.background"] = c.selection,
      ["widget.border"] = c.border_highlight,
      ["widget.shadow"] = c.bg_dark .. "80",
      ["button.background"] = c.yellow,
      ["button.foreground"] = c.bg,
      ["button.hoverBackground"] = c.orange,
      ["button.secondaryBackground"] = c.selection,
      ["button.secondaryForeground"] = c.fg,
      ["button.secondaryHoverBackground"] = c.bg_highlight,
      ["checkbox.background"] = c.bg_popup,
      ["checkbox.foreground"] = c.yellow,
      ["checkbox.border"] = c.border_highlight,
      ["textLink.foreground"] = c.blue,
      ["textLink.activeForeground"] = c.teal,
      ["textCodeBlock.background"] = c.bg_light,
      ["textBlockQuote.background"] = c.bg_light,
      ["textBlockQuote.border"] = c.yellow,
      ["textPreformat.foreground"] = c.green,
      ["editor.background"] = c.bg,
      ["editor.foreground"] = c.fg,
      ["editorLineNumber.foreground"] = c.fg_dim,
      ["editorLineNumber.activeForeground"] = c.yellow,
      ["editorCursor.foreground"] = c.cursor,
      ["editor.selectionBackground"] = c.selection,
      ["editor.inactiveSelectionBackground"] = c.selection .. "80",
      ["editor.selectionHighlightBackground"] = c.yellow .. "20",
      ["editor.findMatchBackground"] = c.orange .. "55",
      ["editor.findMatchBorder"] = c.orange,
      ["editor.findMatchHighlightBackground"] = c.yellow .. "30",
      ["editor.findRangeHighlightBackground"] = c.yellow .. "15",
      ["editor.wordHighlightBackground"] = c.blue .. "25",
      ["editor.wordHighlightStrongBackground"] = c.teal .. "35",
      ["editor.wordHighlightTextBackground"] = c.blue .. "25",
      ["editorInlayHint.foreground"] = c.fg_dim,
      ["editorInlayHint.background"] = c.bg_light,
      ["editorGhostText.foreground"] = c.fg_dim,
      ["editor.lineHighlightBackground"] = c.bg_light,
      ["editorIndentGuide.background1"] = c.border,
      ["editorIndentGuide.activeBackground1"] = c.border_highlight,
      ["editorWhitespace.foreground"] = c.border,
      ["editorBracketMatch.background"] = c.bg_highlight,
      ["editorBracketMatch.border"] = c.border_highlight,
      ["editorHoverWidget.background"] = c.bg_popup,
      ["editorHoverWidget.border"] = c.border_highlight,
      ["editorWidget.background"] = c.bg_popup,
      ["editorWidget.border"] = c.border_highlight,
      ["editorSuggestWidget.background"] = c.bg_popup,
      ["editorSuggestWidget.foreground"] = c.fg,
      ["editorSuggestWidget.selectedBackground"] = c.selection,
      ["editorSuggestWidget.highlightForeground"] = c.yellow,
      ["editorGroupHeader.tabsBackground"] = c.bg_dim,
      ["tab.activeBackground"] = c.bg,
      ["tab.activeForeground"] = c.fg,
      ["tab.activeBorderTop"] = c.yellow,
      ["tab.unfocusedActiveBorderTop"] = c.fg_dim,
      ["tab.unfocusedActiveForeground"] = c.fg_dark,
      ["tab.unfocusedInactiveForeground"] = c.fg_dim,
      ["tab.hoverBackground"] = c.bg_light,
      ["tab.inactiveBackground"] = c.bg_statusline,
      ["tab.inactiveForeground"] = c.fg_dim,
      ["activityBar.background"] = c.bg_dim,
      ["activityBar.foreground"] = c.fg,
      ["activityBar.inactiveForeground"] = c.fg_dim,
      ["activityBar.activeBorder"] = c.yellow,
      ["activityBarBadge.background"] = c.yellow,
      ["activityBarBadge.foreground"] = c.bg,
      ["sideBar.background"] = c.bg_sidebar,
      ["sideBar.foreground"] = c.fg,
      ["sideBar.border"] = c.border,
      ["sideBarSectionHeader.background"] = c.bg_statusline,
      ["sideBarSectionHeader.foreground"] = c.fg,
      ["titleBar.activeBackground"] = c.bg_dim,
      ["titleBar.activeForeground"] = c.fg,
      ["titleBar.inactiveBackground"] = c.bg_dim,
      ["titleBar.inactiveForeground"] = c.fg_dim,
      ["statusBar.background"] = c.bg_statusline,
      ["statusBar.foreground"] = c.fg,
      ["statusBar.border"] = c.border,
      ["statusBar.debuggingBackground"] = c.orange,
      ["statusBar.debuggingForeground"] = c.bg,
      ["statusBar.noFolderBackground"] = c.bg_dim,
      ["statusBar.noFolderForeground"] = c.fg,
      ["statusBarItem.remoteBackground"] = c.teal,
      ["statusBarItem.remoteForeground"] = c.bg,
      ["panel.background"] = c.bg_dim,
      ["panel.border"] = c.border,
      ["panelTitle.activeForeground"] = c.fg,
      ["panelTitle.activeBorder"] = c.yellow,
      ["panelTitle.inactiveForeground"] = c.fg_dim,
      ["list.activeSelectionBackground"] = c.selection,
      ["list.activeSelectionForeground"] = c.fg,
      ["list.inactiveSelectionBackground"] = c.bg_light,
      ["list.inactiveSelectionForeground"] = c.fg,
      ["list.focusBackground"] = c.bg_light,
      ["list.focusForeground"] = c.fg,
      ["list.focusOutline"] = c.yellow,
      ["list.hoverBackground"] = c.bg_light,
      ["list.highlightForeground"] = c.yellow,
      ["input.background"] = c.bg_popup,
      ["input.foreground"] = c.fg,
      ["input.border"] = c.border_highlight,
      ["input.placeholderForeground"] = c.fg_dim,
      ["inputOption.activeBackground"] = c.selection,
      ["inputOption.activeForeground"] = c.yellow,
      ["inputOption.activeBorder"] = c.yellow,
      ["inputValidation.errorBackground"] = c.diag_error_bg,
      ["inputValidation.errorForeground"] = c.fg,
      ["inputValidation.errorBorder"] = c.red,
      ["inputValidation.warningBackground"] = c.diag_warn_bg,
      ["inputValidation.warningForeground"] = c.fg,
      ["inputValidation.warningBorder"] = c.orange,
      ["inputValidation.infoBackground"] = c.diag_info_bg,
      ["inputValidation.infoForeground"] = c.fg,
      ["inputValidation.infoBorder"] = c.blue,
      ["quickInput.background"] = c.bg_popup,
      ["quickInput.foreground"] = c.fg,
      ["quickInputList.focusBackground"] = c.selection,
      ["quickInputList.focusForeground"] = c.fg,
      ["notifications.background"] = c.bg_popup,
      ["notifications.foreground"] = c.fg,
      ["notifications.border"] = c.border_highlight,
      ["notificationCenterHeader.background"] = c.bg_dim,
      ["notificationCenterHeader.foreground"] = c.fg,
      ["scrollbarSlider.background"] = c.border_highlight .. "80",
      ["scrollbarSlider.hoverBackground"] = c.fg_dim .. "80",
      ["scrollbarSlider.activeBackground"] = c.fg_dim .. "b0",
      ["progressBar.background"] = c.yellow,
      ["dropdown.background"] = c.bg_popup,
      ["dropdown.foreground"] = c.fg,
      ["dropdown.border"] = c.border_highlight,
      ["badge.background"] = c.yellow,
      ["badge.foreground"] = c.bg,
      ["terminal.background"] = c.bg,
      ["terminal.foreground"] = c.fg,
      ["terminalCursor.foreground"] = c.cursor,
      ["terminalCursor.background"] = c.bg,
      ["terminal.selectionBackground"] = c.selection,
      ["terminal.inactiveSelectionBackground"] = c.selection .. "80",
      ["terminal.ansiBlack"] = terminal.ansi[1],
      ["terminal.ansiRed"] = terminal.ansi[2],
      ["terminal.ansiGreen"] = terminal.ansi[3],
      ["terminal.ansiYellow"] = terminal.ansi[4],
      ["terminal.ansiBlue"] = terminal.ansi[5],
      ["terminal.ansiMagenta"] = terminal.ansi[6],
      ["terminal.ansiCyan"] = terminal.ansi[7],
      ["terminal.ansiWhite"] = terminal.ansi[8],
      ["terminal.ansiBrightBlack"] = terminal.brights[1],
      ["terminal.ansiBrightRed"] = terminal.brights[2],
      ["terminal.ansiBrightGreen"] = terminal.brights[3],
      ["terminal.ansiBrightYellow"] = terminal.brights[4],
      ["terminal.ansiBrightBlue"] = terminal.brights[5],
      ["terminal.ansiBrightMagenta"] = terminal.brights[6],
      ["terminal.ansiBrightCyan"] = terminal.brights[7],
      ["terminal.ansiBrightWhite"] = terminal.brights[8],
      ["gitDecoration.addedResourceForeground"] = c.green,
      ["gitDecoration.modifiedResourceForeground"] = c.orange,
      ["gitDecoration.deletedResourceForeground"] = c.red,
      -- Text overlays must be translucent so diagnostics and selections show through.
      ["diffEditor.insertedTextBackground"] = c.green .. "40",
      ["diffEditor.removedTextBackground"] = c.red .. "40",
      ["diffEditor.insertedLineBackground"] = c.green .. "15",
      ["diffEditor.removedLineBackground"] = c.red .. "15",
      ["editorGutter.addedBackground"] = c.green,
      ["editorGutter.modifiedBackground"] = c.orange,
      ["editorGutter.deletedBackground"] = c.red,
      ["diffEditor.diagonalFill"] = c.bg_dim,
      ["editorError.foreground"] = c.red,
      ["editorWarning.foreground"] = c.orange,
      ["editorInfo.foreground"] = c.blue,
      ["editorHint.foreground"] = c.teal,
    },
    tokenColors = list({
      {
        scope = list({ "comment", "punctuation.definition.comment" }),
        settings = { foreground = s.comment, fontStyle = "" },
      },
      {
        scope = list({ "keyword", "storage", "storage.type" }),
        settings = { foreground = s.keyword, fontStyle = "" },
      },
      {
        scope = list({ "entity.name.function", "support.function", "variable.function" }),
        settings = { foreground = s["function"] },
      },
      {
        scope = list({ "entity.name.type", "support.type", "support.class" }),
        settings = { foreground = s.type },
      },
      {
        scope = list({ "variable", "identifier" }),
        settings = { foreground = s.variable },
      },
      {
        scope = list({ "variable.parameter" }),
        settings = { foreground = s.parameter },
      },
      {
        scope = list({ "variable.other.property", "meta.object-literal.key" }),
        settings = { foreground = s.property },
      },
      {
        scope = list({ "string" }),
        settings = { foreground = s.string },
      },
      {
        scope = list({ "constant.character.escape" }),
        settings = { foreground = s.escape },
      },
      {
        scope = list({ "string.regexp" }),
        settings = { foreground = s.regexp },
      },
      {
        scope = list({ "constant.numeric" }),
        settings = { foreground = s.number },
      },
      {
        scope = list({ "constant", "support.constant" }),
        settings = { foreground = s.constant },
      },
      {
        scope = list({ "entity.name.tag" }),
        settings = { foreground = s.tag },
      },
      {
        scope = list({ "entity.other.attribute-name" }),
        settings = { foreground = s.attribute },
      },
      {
        scope = list({ "punctuation", "meta.brace", "meta.delimiter" }),
        settings = { foreground = s.punctuation },
      },
      {
        scope = list({ "keyword.operator" }),
        settings = { foreground = s.operator },
      },
      { scope = list({ "constant.language.boolean" }), settings = { foreground = s.boolean } },
      { scope = list({ "variable.language", "support.variable" }), settings = { foreground = s.builtin } },
      { scope = list({ "entity.name.namespace", "entity.name.module" }), settings = { foreground = s.namespace } },
      { scope = list({ "keyword.control.import", "keyword.control.from", "keyword.control.export", "meta.preprocessor" }), settings = { foreground = s.preproc } },
      { scope = list({ "markup.heading", "entity.name.section" }), settings = { foreground = c.yellow, fontStyle = "bold" } },
      { scope = list({ "markup.bold" }), settings = { fontStyle = "bold" } },
      { scope = list({ "markup.italic" }), settings = { fontStyle = "italic" } },
      { scope = list({ "markup.inline.raw", "markup.fenced_code.block.markdown" }), settings = { foreground = s.string } },
      { scope = list({ "markup.underline.link", "string.other.link" }), settings = { foreground = c.blue, fontStyle = "underline" } },
      { scope = list({ "markup.quote" }), settings = { foreground = s.comment } },
      { scope = list({ "markup.inserted" }), settings = { foreground = c.green } },
      { scope = list({ "markup.deleted" }), settings = { foreground = c.red } },
      {
        scope = list({ "invalid" }),
        settings = { foreground = c.red },
      },
    }),
    semanticTokenColors = {
      comment = { foreground = s.comment, italic = false },
      keyword = { foreground = s.keyword, italic = false },
      variable = s.variable,
      parameter = s.parameter,
      property = s.property,
      enumMember = s.constant,
      type = s.type,
      typeParameter = s.type,
      class = s.type,
      interface = s.type,
      struct = s.type,
      enum = s.type,
      ["function"] = s["function"],
      method = s["function"],
      namespace = s.namespace,
      string = s.string,
      number = s.number,
      operator = s.operator,
      ["variable.readonly"] = s.constant,
      ["variable.defaultLibrary"] = s.builtin,
    },
  }
end

local function zed_style(c)
  local terminal = terminal_palette(c)
  local s = syntax_colors(c)

  return {
    background = c.bg,
    border = c.border,
    ["border.disabled"] = c.bg_highlight,
    ["border.focused"] = c.border_highlight,
    ["border.selected"] = c.yellow,
    ["border.transparent"] = "#00000000",
    ["border.variant"] = c.bg_highlight,
    conflict = c.orange,
    ["conflict.background"] = c.diff_change,
    created = c.green,
    ["created.background"] = c.diff_add,
    deleted = c.red,
    ["deleted.background"] = c.diff_delete,
    ["drop_target.background"] = c.bg_highlight,
    ["editor.active_line.background"] = c.bg_light,
    ["editor.active_line_number"] = c.yellow,
    ["editor.background"] = c.bg,
    ["editor.document_highlight.bracket_background"] = c.bg_highlight,
    ["editor.document_highlight.read_background"] = c.bg_highlight,
    ["editor.document_highlight.write_background"] = c.bg_highlight,
    ["editor.foreground"] = c.fg,
    ["editor.gutter.background"] = c.bg_sidebar,
    ["editor.highlighted_line.background"] = c.bg_light,
    ["editor.indent_guide"] = c.border,
    ["editor.indent_guide_active"] = c.border_highlight,
    ["editor.invisible"] = c.border,
    ["editor.line_number"] = c.fg_dim,
    ["editor.subheader.background"] = c.bg_statusline,
    ["editor.wrap_guide"] = c.border,
    ["element.active"] = c.selection,
    ["element.background"] = c.bg_popup,
    ["element.disabled"] = c.bg_highlight,
    ["element.hover"] = c.bg_light,
    ["element.selected"] = c.selection,
    ["elevated_surface.background"] = c.bg_popup,
    error = c.red,
    ["error.background"] = c.diag_error_bg or c.diff_delete,
    ["error.border"] = c.red,
    ["ghost_element.active"] = c.bg_highlight,
    ["ghost_element.background"] = "#00000000",
    ["ghost_element.disabled"] = c.bg_highlight,
    ["ghost_element.hover"] = c.bg_light,
    ["ghost_element.selected"] = c.bg_highlight,
    hidden = c.fg_dim,
    hint = c.teal,
    ["hint.background"] = c.diag_hint_bg,
    ["hint.border"] = c.teal,
    icon = c.fg,
    ["icon.accent"] = c.yellow,
    ["icon.disabled"] = c.fg_dim,
    ["icon.muted"] = c.fg_dark,
    ["icon.placeholder"] = c.fg_dim,
    info = c.blue,
    ["info.background"] = c.diag_info_bg,
    ["info.border"] = c.blue,
    ["panel.background"] = c.bg_dim,
    ["pane.focused_border"] = c.border_highlight,
    ["panel.focused_border"] = c.yellow,
    ["search.match_background"] = c.yellow .. "40",
    -- First player supplies the local cursor/selection; others distinguish collaborators.
    players = list({
      { cursor = c.cursor, background = c.yellow, selection = c.selection .. "cc" },
      { cursor = c.blue, background = c.blue, selection = c.blue .. "30" },
      { cursor = c.teal, background = c.teal, selection = c.teal .. "30" },
      { cursor = c.violet, background = c.violet, selection = c.violet .. "30" },
      { cursor = c.orange, background = c.orange, selection = c.orange .. "30" },
      { cursor = c.red, background = c.red, selection = c.red .. "30" },
    }),
    modified = c.orange,
    ["modified.background"] = c.diff_change,
    renamed = c.blue,
    ["renamed.background"] = c.diag_info_bg,
    success = c.green,
    ["success.background"] = c.diag_hint_bg,
    predictive = c.fg_dim,
    ["scrollbar.thumb.background"] = c.border,
    ["scrollbar.thumb.border"] = c.bg_highlight,
    ["scrollbar.thumb.hover_background"] = c.border_highlight,
    ["scrollbar.track.background"] = c.bg_dim,
    ["status_bar.background"] = c.bg_statusline,
    ["surface.background"] = c.bg_dim,
    ["tab.active_background"] = c.bg,
    ["tab.inactive_background"] = c.bg_statusline,
    ["tab_bar.background"] = c.bg_dim,
    ["terminal.ansi.background"] = c.bg,
    ["terminal.ansi.black"] = terminal.ansi[1],
    ["terminal.ansi.blue"] = terminal.ansi[5],
    ["terminal.ansi.bright_black"] = terminal.brights[1],
    ["terminal.ansi.bright_blue"] = terminal.brights[5],
    ["terminal.ansi.bright_cyan"] = terminal.brights[7],
    ["terminal.ansi.bright_green"] = terminal.brights[3],
    ["terminal.ansi.bright_magenta"] = terminal.brights[6],
    ["terminal.ansi.bright_red"] = terminal.brights[2],
    ["terminal.ansi.bright_white"] = terminal.brights[8],
    ["terminal.ansi.bright_yellow"] = terminal.brights[4],
    ["terminal.ansi.cyan"] = terminal.ansi[7],
    ["terminal.ansi.dim_black"] = terminal.dims.black,
    ["terminal.ansi.dim_blue"] = terminal.dims.blue,
    ["terminal.ansi.dim_cyan"] = terminal.dims.cyan,
    ["terminal.ansi.dim_green"] = terminal.dims.green,
    ["terminal.ansi.dim_magenta"] = terminal.dims.magenta,
    ["terminal.ansi.dim_red"] = terminal.dims.red,
    ["terminal.ansi.dim_white"] = terminal.dims.white,
    ["terminal.ansi.dim_yellow"] = terminal.dims.yellow,
    ["terminal.ansi.green"] = terminal.ansi[3],
    ["terminal.ansi.magenta"] = terminal.ansi[6],
    ["terminal.ansi.red"] = terminal.ansi[2],
    ["terminal.ansi.white"] = terminal.ansi[8],
    ["terminal.ansi.yellow"] = terminal.ansi[4],
    ["terminal.background"] = c.bg,
    ["terminal.bright_foreground"] = c.fg_bright,
    ["terminal.dim_foreground"] = c.fg_dim,
    ["terminal.foreground"] = c.fg,
    text = c.fg,
    ["text.accent"] = c.yellow,
    ["text.disabled"] = c.fg_dim,
    ["text.muted"] = c.fg_dark,
    ["text.placeholder"] = c.fg_dim,
    ["title_bar.background"] = c.bg_dim,
    ["toolbar.background"] = c.bg_statusline,
    warning = c.orange,
    ["warning.background"] = c.diag_warn_bg or c.diff_change,
    ["warning.border"] = c.orange,
    syntax = {
      attribute = { color = s.attribute },
      boolean = { color = s.boolean },
      comment = { color = s.comment, font_style = "normal" },
      ["comment.doc"] = { color = s.comment, font_style = "normal" },
      constant = { color = s.constant },
      constructor = { color = s["function"] },
      embedded = { color = c.fg },
      emphasis = { font_style = "italic" },
      ["emphasis.strong"] = { font_weight = 700 },
      enum = { color = s.type },
      ["function"] = { color = s["function"] },
      hint = { color = c.teal },
      keyword = { color = s.keyword, font_style = "normal" },
      label = { color = s.variable },
      link_text = { color = c.blue },
      link_uri = { color = c.teal, font_style = "italic" },
      number = { color = s.number },
      operator = { color = s.operator },
      preproc = { color = s.preproc },
      primary = { color = c.fg },
      property = { color = s.property },
      punctuation = { color = s.punctuation },
      ["punctuation.bracket"] = { color = s.punctuation },
      ["punctuation.delimiter"] = { color = s.punctuation },
      ["punctuation.list_marker"] = { color = c.orange },
      ["punctuation.special"] = { color = s.punctuation },
      string = { color = s.string },
      ["string.escape"] = { color = s.escape },
      ["string.regex"] = { color = s.regexp },
      ["string.special"] = { color = s.string },
      tag = { color = s.tag },
      ["text.literal"] = { color = c.green },
      title = { color = c.yellow, font_weight = 700 },
      type = { color = s.type },
      variable = { color = s.variable },
      ["variable.special"] = { color = s.builtin },
      variant = { color = s.constant },
    },
  }
end

local function write_wezterm(variant)
  local c = palette[variant]
  local terminal = terminal_palette(c)
  local payload = {
    colors = {
      foreground = c.fg,
      background = c.bg,
      cursor_bg = c.cursor,
      cursor_border = c.cursor,
      cursor_fg = c.bg,
      selection_bg = c.selection,
      selection_fg = c.fg,
      ansi = list(terminal.ansi),
      brights = list(terminal.brights),
      tab_bar = {
        background = c.bg_dim,
        active_tab = {
          bg_color = c.selection,
          fg_color = c.yellow,
          intensity = "Bold",
        },
        inactive_tab = {
          bg_color = c.bg_dim,
          fg_color = c.fg_dim,
        },
        inactive_tab_hover = {
          bg_color = c.bg_highlight,
          fg_color = c.fg,
        },
        new_tab = {
          bg_color = c.bg_dim,
          fg_color = c.fg_dim,
        },
        new_tab_hover = {
          bg_color = c.bg_highlight,
          fg_color = c.fg,
        },
      },
    },
  }

  write_file(
    "wezterm/tawny" .. (variant == "light" and "-light" or "") .. ".lua",
    "-- tawny " .. variant .. " color scheme for WezTerm\n"
      .. "-- generated from lua/tawny/palette.lua by scripts/generate_companion_themes.lua\n"
      .. "-- https://github.com/r-happy/tawny.nvim\n\n"
      .. "return "
      .. lua_encode(payload)
      .. "\n"
  )
end

local function write_tmux(variant)
  local c = palette[variant]
  local stem = "tmux/tawny" .. (variant == "light" and "-light" or "")
  write_file(
    stem .. ".conf",
    table.concat({
      "# tawny " .. variant .. " theme for tmux (includes status bar layout)",
      "# For colors only, source " .. stem .. "-colors.conf instead.",
      "# generated from lua/tawny/palette.lua by scripts/generate_companion_themes.lua",
      "# https://github.com/r-happy/tawny.nvim",
      "",
      "# status bar base",
      string.format('set -g status-style                  "bg=%s,fg=%s"', c.bg_dim, c.fg_dim),
      "set -g status-left-length            50",
      "set -g status-right-length           80",
      "",
      "# status-left: [session name]",
      "set -g status-left \\",
      string.format('  "#[bg=%s,fg=%s,bold] #S #[bg=%s,fg=%s,nobold] "', c.selection, c.fg, c.bg_dim, c.fg_dim),
      "",
      "# status-right: [host] [date time]",
      "set -g status-right \\",
      string.format('  "#[bg=%s,fg=%s] #h #[bg=%s,fg=%s] %%Y-%%m-%%d  %%H:%%M "', c.selection, c.fg, c.fg_dim, c.bg),
      "",
      "# window list",
      "set -g window-status-format \\",
      string.format('  "#[bg=%s,fg=%s] #{b:pane_current_path}  #I #W#F "', c.bg_dim, c.fg_dim),
      "",
      "set -g window-status-current-format \\",
      string.format('  "#[bg=%s,fg=%s]#[bg=%s,fg=%s,bold] #{b:pane_current_path} #[bg=%s,fg=%s]#[bg=%s,fg=%s,bold] #I #W#F #[bg=%s,fg=%s]"', c.fg_dim, c.bg_dim, c.fg_dim, c.bg, c.bg_highlight, c.fg_dim, c.bg_highlight, c.fg, c.bg_dim, c.bg_highlight),
      "",
      string.format('set -g window-status-activity-style  "bg=%s,fg=%s"', c.bg_dim, c.yellow),
      string.format('set -g window-status-bell-style      "bg=%s,fg=%s"', c.bg_dim, c.red),
      "",
      "# pane borders",
      string.format('set -g pane-border-style             "fg=%s"', c.border),
      string.format('set -g pane-active-border-style      "fg=%s"', c.yellow),
      "",
      "# message / command prompt",
      string.format('set -g message-style                 "bg=%s,fg=%s"', c.bg_highlight, c.fg),
      string.format('set -g message-command-style         "bg=%s,fg=%s"', c.bg_highlight, c.fg_dim),
      "",
      "# copy mode",
      string.format('set -g mode-style                    "bg=%s,fg=%s"', c.selection, c.fg),
      "",
    }, "\n")
  )

  -- Optional entrypoint that preserves the user's status text and lengths.
  write_file(stem .. "-colors.conf", table.concat({
    "# tawny " .. variant .. " colors for tmux; preserves status bar layout",
    "# generated by scripts/generate_companion_themes.lua",
    string.format('set -g status-style "bg=%s,fg=%s"', c.bg_dim, c.fg),
    string.format('set -g window-status-style "bg=%s,fg=%s"', c.bg_dim, c.fg_dim),
    string.format('set -g window-status-current-style "bg=%s,fg=%s,bold"', c.selection, c.yellow),
    string.format('set -g window-status-activity-style "bg=%s,fg=%s"', c.bg_dim, c.yellow),
    string.format('set -g window-status-bell-style "bg=%s,fg=%s"', c.bg_dim, c.red),
    string.format('set -g pane-border-style "fg=%s"', c.border),
    string.format('set -g pane-active-border-style "fg=%s"', c.yellow),
    string.format('set -g message-style "bg=%s,fg=%s"', c.bg_highlight, c.fg),
    string.format('set -g message-command-style "bg=%s,fg=%s"', c.bg_highlight, c.fg),
    string.format('set -g mode-style "bg=%s,fg=%s"', c.selection, c.fg),
    "",
  }, "\n"))
end

local function write_ghostty(variant)
  local c = palette[variant]
  local path = "ghostty/color" .. (variant == "light" and "-light" or "") .. ".ghostty"
  local terminal = terminal_palette(c)
  local lines = {
    "# tawny " .. variant .. " color theme for Ghostty",
    "# generated from lua/tawny/palette.lua by scripts/generate_companion_themes.lua",
    "# import this file from ~/.config/ghostty/config:",
    "#   config-file = /path/to/tawny.nvim/" .. path,
    "",
    "background = " .. c.bg,
    "foreground = " .. c.fg,
    "selection-background = " .. c.selection,
    "selection-foreground = " .. c.fg,
    "",
    "cursor-color = " .. c.cursor,
    "cursor-text = " .. c.bg,
    "",
  }

  for index, color in ipairs(terminal.ansi) do
    lines[#lines + 1] = string.format("palette = %d=%s", index - 1, color)
  end
  for index, color in ipairs(terminal.brights) do
    lines[#lines + 1] = string.format("palette = %d=%s", index + 7, color)
  end

  lines[#lines + 1] = ""
  write_file(path, table.concat(lines, "\n"))
end

local function write_vscode()
  write_file(
    "vscode/themes/tawny-dark-color-theme.json",
    json_encode(vscode_theme("Tawny", "dark", palette.dark)) .. "\n"
  )
  write_file(
    "vscode/themes/tawny-light-color-theme.json",
    json_encode(vscode_theme("Tawny Light", "light", palette.light)) .. "\n"
  )
end

local function write_zed()
  local payload = {
    ["$schema"] = "https://zed.dev/schema/themes/v0.2.0.json",
    name = "Tawny",
    author = "r-happy",
    themes = list({
      {
        name = "Tawny",
        appearance = "dark",
        style = zed_style(palette.dark),
      },
      {
        name = "Tawny Light",
        appearance = "light",
        style = zed_style(palette.light),
      },
    }),
  }

  write_file("zed/tawny.json", json_encode(payload) .. "\n")
end

for _, variant in ipairs({ "dark", "light" }) do
  write_wezterm(variant)
  write_tmux(variant)
  write_ghostty(variant)
end
write_vscode()
write_zed()
