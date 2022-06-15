local present, gitsigns = pcall(require, "gitsigns")
local secondpresent, base46 = pcall(require, "base46")

if not present then
  return
end

if secondpresent then
  base46.load_highlight "git"
end

local options = {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  current_line_blame = true
}

gitsigns.setup(options)