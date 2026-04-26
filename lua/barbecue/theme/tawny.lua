local palette = require("tawny.palette")

local c = vim.o.background == "light" and palette.light or palette.dark

return {
  normal = { fg = c.fg, bg = c.bg_dim },

  ellipsis = { fg = c.fg_dim },
  separator = { fg = c.border },
  modified = { fg = c.orange },

  dirname = { fg = c.fg_dim },
  basename = { fg = c.fg, bold = true },
  context = { fg = c.fg },

  context_file = { fg = c.fg },
  context_module = { fg = c.teal },
  context_namespace = { fg = c.teal },
  context_package = { fg = c.orange },
  context_class = { fg = c.teal },
  context_method = { fg = c.blue },
  context_property = { fg = c.fg },
  context_field = { fg = c.fg },
  context_constructor = { fg = c.blue },
  context_enum = { fg = c.yellow },
  context_interface = { fg = c.teal },
  context_function = { fg = c.blue },
  context_variable = { fg = c.fg },
  context_constant = { fg = c.yellow },
  context_string = { fg = c.green },
  context_number = { fg = c.orange },
  context_boolean = { fg = c.orange },
  context_array = { fg = c.violet },
  context_object = { fg = c.violet },
  context_key = { fg = c.yellow },
  context_null = { fg = c.fg_dim },
  context_enum_member = { fg = c.yellow },
  context_struct = { fg = c.teal },
  context_event = { fg = c.orange },
  context_operator = { fg = c.fg },
  context_type_parameter = { fg = c.teal },
}
