-- Cross-application contracts: run from the repository root with `make check`.
local function read(path)
  return table.concat(vim.fn.readfile(path), "\n")
end
local function json(path) return vim.json.decode(read(path)) end
local function equal(actual, expected, label)
  assert(actual == expected, label .. ': ' .. vim.inspect(actual) .. ' ~= ' .. vim.inspect(expected))
end
local function fg(group)
  return string.format('#%06x', assert(vim.api.nvim_get_hl(0, { name = group, link = false }).fg, group))
end
local function textmate(theme, scope)
  for _, rule in ipairs(theme.tokenColors) do
    for _, candidate in ipairs(rule.scope) do
      if candidate == scope then return rule.settings.foreground end
    end
  end
  error('Missing TextMate scope: ' .. scope)
end
local function translucent(color, label)
  assert(color:match('^#%x%x%x%x%x%x%x%x$'), label .. ' must have an alpha channel')
  local alpha = tonumber(color:sub(8, 9), 16)
  assert(alpha > 0 and alpha < 255, label .. ' must be visible and translucent')
end
local manifest = json('vscode/package.json')
for _, theme in ipairs(manifest.contributes.themes) do
  assert(vim.fn.filereadable('vscode/' .. theme.path) == 1, theme.path)
end
local zed = json('zed/tawny.json')
local roles = {
  { 'Comment', 'comment', 'comment', 'comment' },
  { 'Keyword', 'keyword', 'keyword', 'keyword' },
  { '@property', 'variable.other.property', 'property', 'property' },
  { 'Function', 'entity.name.function', 'function', 'function' },
  { 'Type', 'entity.name.type', 'type', 'type' },
  { 'String', 'string', 'string', 'string' },
  { 'Number', 'constant.numeric', 'number', 'number' },
  { 'Delimiter', 'punctuation', nil, 'punctuation' },
  { 'Boolean', 'constant.language.boolean', nil, 'boolean' },
  { '@string.escape', 'constant.character.escape', nil, 'string.escape' },
  { '@variable.builtin', 'variable.language', 'variable.defaultLibrary', 'variable.special' },
}
for i, variant in ipairs({ 'dark', 'light' }) do
  local c = require('tawny.palette')[variant]
  local suffix = variant == 'light' and '-light' or ''
  local theme = json('vscode/themes/tawny-' .. variant .. '-color-theme.json')
  local z = zed.themes[i].style
  equal(zed.themes[i].appearance, variant, 'Zed variant')
  require('tawny').setup({ transparent = false })
  vim.cmd.colorscheme(variant == 'light' and 'tawny-light' or 'tawny')
  for _, group in ipairs({ 'Identifier', '@property', '@variable.member', '@module',
    'Type', 'Number', 'Constant', 'Operator', 'Delimiter', '@tag.attribute' }) do
    equal(fg(group), c.fg, variant .. ' readable neutral ' .. group)
  end
  for _, group in ipairs({ 'Comment', 'Keyword', '@function.builtin', '@constant.builtin' }) do
    assert(not vim.api.nvim_get_hl(0, { name = group, link = false }).italic, group .. ' should be upright')
  end
  for _, role in ipairs(roles) do
    local expected = fg(role[1])
    equal(textmate(theme, role[2]), expected, variant .. ' TextMate ' .. role[2])
    if role[3] then
      local semantic = theme.semanticTokenColors[role[3]]
      equal(type(semantic) == 'table' and semantic.foreground or semantic, expected, variant .. ' semantic ' .. role[3])
    end
    equal(z.syntax[role[4]].color, expected, variant .. ' Zed ' .. role[4])
  end
  for _, key in ipairs({ 'diffEditor.insertedTextBackground', 'diffEditor.removedTextBackground',
    'diffEditor.insertedLineBackground', 'diffEditor.removedLineBackground',
    'editor.findMatchBackground', 'editor.findMatchHighlightBackground', 'editor.selectionHighlightBackground' }) do
    translucent(assert(theme.colors[key], key), key)
  end
  assert(theme.colors['editor.findMatchBackground'] ~= theme.colors['editor.findMatchHighlightBackground'])
  assert(theme.colors['list.activeSelectionBackground'] ~= theme.colors['list.inactiveSelectionBackground'])
  equal(z.players[1].cursor, c.cursor, 'Zed local cursor')
  translucent(z.players[1].selection, 'Zed local selection')
  assert(#z.players >= 2, 'Collaborator cursors need distinct colors')
  assert(z.players[1].cursor ~= z.players[2].cursor)
  translucent(z['search.match_background'], 'Zed search match')

  local w = dofile('wezterm/tawny' .. suffix .. '.lua').colors
  local g = read('ghostty/color' .. suffix .. '.ghostty')
  equal(w.background, c.bg, 'WezTerm background')
  equal(w.selection_bg, c.selection, 'WezTerm selection')
  assert(w.tab_bar.active_tab.bg_color ~= w.tab_bar.inactive_tab.bg_color)
  assert(g:find('background = ' .. c.bg, 1, true))
  assert(g:find('selection-background = ' .. c.selection, 1, true))
  equal(#w.ansi, 8, 'ANSI colors')
  equal(#w.brights, 8, 'Bright ANSI colors')
  for index = 0, 15 do
    local value = index < 8 and w.ansi[index + 1] or w.brights[index - 7]
    assert(g:find('palette = ' .. index .. '=' .. value, 1, true), 'ANSI mismatch: ' .. index)
  end
  local tmux = read('tmux/tawny' .. suffix .. '-colors.conf')
  for line in tmux:gmatch('[^\n]+') do
    if line:match('^set ') then
      assert(line:match('^set %-g [%w%-]+%-style '), 'Colors-only tmux file changes layout: ' .. line)
    end
  end
  -- Re-loading in transparent mode must preserve syntax role colors as well.
  require('tawny').setup({ transparent = true })
  vim.cmd.colorscheme(variant == 'light' and 'tawny-light' or 'tawny')
  assert(vim.api.nvim_get_hl(0, { name = 'Normal' }).bg == nil)
  equal(fg('Keyword'), z.syntax.keyword.color, 'Transparent syntax role')
  print(variant .. ': syntax parity, UI overlays, cursors, terminals, and tmux contracts OK')
end
