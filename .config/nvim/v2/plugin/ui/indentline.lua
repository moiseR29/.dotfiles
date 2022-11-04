local u = require "utils"

u.global("indentLine_enabled", 0)
u.global("indentLine_leadingSpaceEnabled", 1)
u.global("indentLine_leadingSpaceChar", "·")
u.global("indentLine_conceallevel", 0)

vim.cmd "autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif"
