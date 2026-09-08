-- A reproducible highlight preview, not a terminal screenshot.
-- Run from the repository root with Neovim and this repository on runtimepath.
local output = {
  '<svg xmlns="http://www.w3.org/2000/svg" width="1120" height="490" viewBox="0 0 1120 490">',
  '<title>Tawny dark and light highlight previews</title>',
  '<desc>Lua syntax, active buffer, cursor line, visual selection, and diagnostics using the theme highlight colors.</desc>',
}
local function add(s) output[#output + 1] = s end
local function escape(s)
  return s:gsub('&', '&amp;'):gsub('<', '&lt;'):gsub('>', '&gt;')
end
local function color(group, field)
  local value = vim.api.nvim_get_hl(0, { name = group, link = false })[field or 'fg']
  return string.format('#%06x', assert(value, group))
end
local function rect(x, y, w, h, fill)
  add(string.format('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', x, y, w, h, fill))
end
local function text(x, y, value, fill, size)
  add(string.format('<text x="%d" y="%d" fill="%s" font-size="%d">%s</text>', x, y, fill, size or 16, escape(value)))
end
local lines = {
  { { '-- Warm colors, readable structure', 'Comment' } },
  { { 'local ', 'Keyword' }, { 'catalog', '@module' }, { ' = ', 'Operator' }, { 'require', 'Function' }, { '(', 'Delimiter' }, { '"catalog"', 'String' }, { ')', 'Delimiter' } },
  {},
  { { 'local function ', 'Keyword' }, { 'greet', 'Function' }, { '(', 'Delimiter' }, { 'name', 'Identifier' }, { ')', 'Delimiter' } },
  { { '  local ', 'Keyword' }, { 'message', 'Identifier' }, { ' = ', 'Operator' }, { '"Hello, "', 'String' }, { ' .. ', 'Operator' }, { 'name', 'Identifier' } },
  { { '  return ', 'Keyword' }, { 'message', 'Identifier' } },
  { { 'end', 'Keyword' } },
  {},
  { { 'greet', 'Function' }, { '(', 'Delimiter' }, { '"Tawny"', 'String' }, { ')', 'Delimiter' } },
}
for i, name in ipairs({ 'tawny', 'tawny-light' }) do
  require('tawny').setup({ transparent = false })
  vim.cmd.colorscheme(name)
  local x = (i - 1) * 560
  rect(x, 0, 560, 490, color('Normal', 'bg'))
  add('<g font-family="Menlo,DejaVu Sans Mono,monospace" xml:space="preserve">')
  text(x + 24, 38, i == 1 and 'TAWNY / DARK' or 'TAWNY / LIGHT', color('Title'), 19)
  rect(x, 60, 560, 38, color('BufferLineFill', 'bg'))
  rect(x + 16, 60, 190, 38, color('BufferLineBufferSelected', 'bg'))
  text(x + 28, 85, 'greet.lua   ×', color('BufferLineBufferSelected'))
  text(x + 228, 85, 'catalog.lua', color('BufferLineBackground'))
  rect(x + 12, 247, 536, 27, color('CursorLine', 'bg'))
  rect(x + 74, 274, 164, 27, color('Visual', 'bg'))
  for row, tokens in ipairs(lines) do
    local y = 151 + (row - 1) * 27
    text(x + 25, y, tostring(row), color(row == 5 and 'CursorLineNr' or 'LineNr'), 15)
    local pos = x + 54
    for _, token in ipairs(tokens) do
      text(pos, y, token[1], color(token[2]))
      pos = pos + #token[1] * 10
    end
  end
  text(x + 24, 423, '● error', color('DiagnosticError'), 14)
  text(x + 144, 423, '● warning', color('DiagnosticWarn'), 14)
  text(x + 284, 423, '● info', color('DiagnosticInfo'), 14)
  text(x + 404, 423, '● hint', color('DiagnosticHint'), 14)
  text(x + 24, 464, 'Row 5: cursor line   Row 6: selection', color('Comment'), 13)
  add('</g>')
end
add('</svg>')
vim.fn.mkdir('assets', 'p')
vim.fn.writefile(output, 'assets/preview.svg')
