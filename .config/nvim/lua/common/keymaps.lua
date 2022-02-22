local u = require("utils")

-- reset space key
u.keymap("", "<Space>", "<Nop>", opts)

-- space as a leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- reset source
u.keymap("n", "<F5>", ":source ~/.vimrc<CR>")
u.keymap("v", "<F5>", ":source ~/.vimrc<CR>")

-- reset for none arrows
u.keymap("", "<up>", "<Nop>")
u.keymap("", "<down>", "<Nop>")
u.keymap("", "<left>", "<Nop>")
u.keymap("", "<right>", "<Nop>")

-- vertical split
u.keymap("n", "<leader>r", ":vs<CR>")
u.keymap("n", "<leader>b", ":sp<CR>")

-- resize windows
u.keymap("n", "<right>", ":vertical resize +3<CR>")
u.keymap("n", "<left>", ":vertical resize -3<CR>")
u.keymap("n", "<up>", ":resize -3<CR>")
u.keymap("n", "<down>", ":resize +3<CR>")

-- open/close terminal
-- u.keymap("v", "<c-t>", ":split<CR>:ter<CR>")
-- u.keymap("n", "<c-t>", ":split<CR>:ter<CR>")

-- create buffer
u.keymap("n", "<leade>t", ":tabe<CR>")

-- close buffer
u.keymap("n", "<leade>ww", ":bdelete<CR>")

-- move between buffers
u.keymap("n", "<leade>l", ":tabn<CR>")
u.keymap("n", "<leade>h", ":tabp<CR>")
u.keymap("n", "<leade>1", ":bp<CR>")
u.keymap("n", "<leade>2", ":bn<CR>")

-- find file
u.keymap("n", "<leade>ff", ":File")

-- save
u.keymap("n", "<leader>w", ":w<CR>")

-- move block between lines
u.keymap("n", "<A-j>", ":m .+1<CR>==")
u.keymap("n", "<A-k>", ":m .-2<CR>==")
u.keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
u.keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
u.keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
u.keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")