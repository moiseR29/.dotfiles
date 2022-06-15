local present, blankline = pcall(require, "indent_blankline")
local secondpresent, base46 = pcall(require, "base46")

if not present then
  return
end

if secondpresent then
  base46.load_highlight("blankline")
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

local options = {
  show_end_of_line = false,
  space_char_blankline = "⋅",
  indentLine_enabled = 1,
  char = "⋅",
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}


blankline.setup(options)

