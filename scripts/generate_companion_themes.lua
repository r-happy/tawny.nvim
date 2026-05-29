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

local function vscode_theme(name, theme_type, c)
  local terminal = terminal_palette(c)

  return {
    name = name,
    type = theme_type,
    semanticHighlighting = true,
    colors = {
      ["editor.background"] = c.bg,
      ["editor.foreground"] = c.fg,
      ["editorLineNumber.foreground"] = c.fg_dim,
      ["editorLineNumber.activeForeground"] = c.yellow,
      ["editorCursor.foreground"] = c.cursor,
      ["editor.selectionBackground"] = c.selection,
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
      ["tab.inactiveBackground"] = c.bg_statusline,
      ["tab.inactiveForeground"] = c.fg_dim,
      ["activityBar.background"] = c.bg_dim,
      ["activityBar.foreground"] = c.fg,
      ["activityBarBadge.background"] = c.yellow,
      ["activityBarBadge.foreground"] = c.bg,
      ["sideBar.background"] = c.bg_sidebar,
      ["sideBar.foreground"] = c.fg,
      ["sideBar.border"] = c.border,
      ["sideBarSectionHeader.background"] = c.bg_statusline,
      ["sideBarSectionHeader.foreground"] = c.fg,
      ["titleBar.activeBackground"] = c.bg_dim,
      ["titleBar.activeForeground"] = c.fg,
      ["statusBar.background"] = c.bg_statusline,
      ["statusBar.foreground"] = c.fg,
      ["statusBar.border"] = c.border,
      ["panel.background"] = c.bg_dim,
      ["panel.border"] = c.border,
      ["list.activeSelectionBackground"] = c.selection,
      ["list.activeSelectionForeground"] = c.fg,
      ["list.hoverBackground"] = c.bg_light,
      ["list.highlightForeground"] = c.yellow,
      ["input.background"] = c.bg_popup,
      ["input.foreground"] = c.fg,
      ["input.border"] = c.border_highlight,
      ["input.placeholderForeground"] = c.fg_dim,
      ["dropdown.background"] = c.bg_popup,
      ["dropdown.foreground"] = c.fg,
      ["dropdown.border"] = c.border_highlight,
      ["badge.background"] = c.yellow,
      ["badge.foreground"] = c.bg,
      ["terminal.background"] = c.bg,
      ["terminal.foreground"] = c.fg,
      ["terminalCursor.foreground"] = c.cursor,
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
      ["diffEditor.insertedTextBackground"] = c.diff_add,
      ["diffEditor.removedTextBackground"] = c.diff_delete,
      ["diffEditor.diagonalFill"] = c.bg_dim,
      ["editorError.foreground"] = c.red,
      ["editorWarning.foreground"] = c.orange,
      ["editorInfo.foreground"] = c.blue,
      ["editorHint.foreground"] = c.teal,
    },
    tokenColors = list({
      {
        scope = list({ "comment", "punctuation.definition.comment" }),
        settings = { foreground = c.fg_dim, fontStyle = "italic" },
      },
      {
        scope = list({ "keyword", "storage", "storage.type" }),
        settings = { foreground = c.violet, fontStyle = "italic" },
      },
      {
        scope = list({ "entity.name.function", "support.function", "meta.function-call", "variable.function" }),
        settings = { foreground = c.blue },
      },
      {
        scope = list({ "entity.name.type", "support.type", "support.class" }),
        settings = { foreground = c.teal },
      },
      {
        scope = list({ "variable", "identifier" }),
        settings = { foreground = c.fg },
      },
      {
        scope = list({ "variable.parameter" }),
        settings = { foreground = c.fg_dark },
      },
      {
        scope = list({ "variable.other.property", "meta.object-literal.key" }),
        settings = { foreground = c.yellow },
      },
      {
        scope = list({ "string" }),
        settings = { foreground = c.green },
      },
      {
        scope = list({ "constant.character.escape", "string.regexp" }),
        settings = { foreground = c.teal },
      },
      {
        scope = list({ "constant.numeric", "constant.language.boolean" }),
        settings = { foreground = c.orange },
      },
      {
        scope = list({ "constant", "support.constant" }),
        settings = { foreground = c.yellow },
      },
      {
        scope = list({ "entity.name.tag" }),
        settings = { foreground = c.blue },
      },
      {
        scope = list({ "entity.other.attribute-name" }),
        settings = { foreground = c.teal },
      },
      {
        scope = list({ "punctuation", "meta.brace", "meta.delimiter" }),
        settings = { foreground = c.fg_dim },
      },
      {
        scope = list({ "keyword.operator" }),
        settings = { foreground = c.fg_dark },
      },
      {
        scope = list({ "invalid" }),
        settings = { foreground = c.red },
      },
    }),
    semanticTokenColors = {
      parameter = c.fg_dark,
      property = c.yellow,
      enumMember = c.yellow,
      type = c.teal,
      class = c.teal,
      interface = c.teal,
      ["function"] = c.blue,
      method = c.blue,
      namespace = c.teal,
      ["variable.defaultLibrary"] = c.orange,
    },
  }
end

local function zed_style(c)
  local terminal = terminal_palette(c)

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
      attribute = { color = c.teal },
      boolean = { color = c.orange },
      comment = { color = c.fg_dim, font_style = "italic" },
      ["comment.doc"] = { color = c.fg_dim, font_style = "italic" },
      constant = { color = c.yellow },
      constructor = { color = c.blue },
      embedded = { color = c.fg },
      emphasis = { font_style = "italic" },
      ["emphasis.strong"] = { font_weight = 700 },
      enum = { color = c.teal },
      ["function"] = { color = c.blue },
      hint = { color = c.teal },
      keyword = { color = c.violet, font_style = "italic" },
      label = { color = c.violet },
      link_text = { color = c.blue },
      link_uri = { color = c.teal, font_style = "italic" },
      number = { color = c.orange },
      operator = { color = c.fg_dark },
      preproc = { color = c.teal },
      primary = { color = c.fg },
      property = { color = c.yellow },
      punctuation = { color = c.fg_dim },
      ["punctuation.bracket"] = { color = c.fg_dark },
      ["punctuation.delimiter"] = { color = c.fg_dim },
      ["punctuation.list_marker"] = { color = c.orange },
      ["punctuation.special"] = { color = c.yellow },
      string = { color = c.green },
      ["string.escape"] = { color = c.yellow },
      ["string.regex"] = { color = c.teal },
      ["string.special"] = { color = c.yellow },
      tag = { color = c.blue },
      ["text.literal"] = { color = c.green },
      title = { color = c.yellow, font_weight = 700 },
      type = { color = c.teal },
      variable = { color = c.fg },
      ["variable.special"] = { color = c.orange },
      variant = { color = c.fg_dark },
    },
  }
end

local function write_wezterm()
  local c = palette.dark
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
          bg_color = c.bg,
          fg_color = c.fg,
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
    "wezterm/tawny.lua",
    "-- tawny dark color scheme for WezTerm\n"
      .. "-- generated from lua/tawny/palette.lua by scripts/generate_companion_themes.lua\n"
      .. "-- https://github.com/r-happy/tawny.nvim\n\n"
      .. "return "
      .. lua_encode(payload)
      .. "\n"
  )
end

local function write_tmux()
  local c = palette.dark
  write_file(
    "tmux/tawny.conf",
    table.concat({
      "# tawny dark theme for tmux",
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
      string.format('  "#[bg=%s,fg=%s]#[bg=%s,fg=%s] #h #[bg=%s,fg=%s]#[bg=%s,fg=%s] %%Y-%%m-%%d  %%H:%%M "', c.selection, c.bg_dim, c.selection, c.fg_dim, c.fg_dim, c.selection, c.fg_dim, c.bg),
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
      string.format('set -g pane-active-border-style      "fg=%s"', c.border_highlight),
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
end

local function write_ghostty()
  local c = palette.dark
  local terminal = terminal_palette(c)
  local lines = {
    "# tawny dark color theme for Ghostty",
    "# generated from lua/tawny/palette.lua by scripts/generate_companion_themes.lua",
    "# import this file from ~/.config/ghostty/config:",
    "#   config-file = /path/to/tawny.nvim/ghostty/color.ghostty",
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
  write_file("ghostty/color.ghostty", table.concat(lines, "\n"))
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

write_wezterm()
write_tmux()
write_ghostty()
write_vscode()
write_zed()
