local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.local/share/nvim/plugged")

-- for async code Lua
Plug "nvim-lua/plenary.nvim" -- *************

-- iconst
Plug "kyazdani42/nvim-web-devicons" -- *************

-- Theme
Plug "moiseR29/base46"

-- buffer with tabs as vscode
Plug("akinsho/bufferline.nvim", { ["tag"] = "v2.*" })

-- indentations
--Plug "lukas-reineke/indent-blankline.nvim"
Plug "yggdroot/indentline"

-- hexa in colors
Plug "NvChad/nvim-colorizer.lua" -- *************

-- themes for languages
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- *************

-- GIT PLUGINS
-- for status and resolve merge
Plug "tpope/vim-fugitive" -- *************

-- git plugin for inspect commits
Plug "lewis6991/gitsigns.nvim" -- *************

-- line
Plug "nvim-lualine/lualine.nvim"

-- LSP

-- simple to use language server installer
Plug "williamboman/nvim-lsp-installer"

-- LSP (Lenguage Server Protocol)
Plug "neovim/nvim-lspconfig"

-- easy snippets
Plug "rafamadriz/friendly-snippets"

-- Completation plugin
Plug "hrsh7th/nvim-cmp"

-- library snippets
Plug "L3MON4D3/LuaSnip"
Plug "saadparwaiz1/cmp_luasnip"

-- Additonals
Plug "hrsh7th/cmp-nvim-lua"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"

-- autopair
Plug "windwp/nvim-autopairs" -- *************

-- formatter and linter
Plug "jose-elias-alvarez/null-ls.nvim"

-- main page
Plug "goolord/alpha-nvim" -- *************

-- comment
Plug "numToStr/Comment.nvim"

-- file management
Plug "kyazdani42/nvim-tree.lua"

-- utility
Plug "nvim-telescope/telescope.nvim"

-- for movements
Plug "christoomey/vim-tmux-navigator" -- *************

-- plugin for easy use more one lines *
Plug("mg979/vim-visual-multi", { branch = "master" })

-- schemas for json
Plug "b0o/schemastore.nvim"

-- Terminal
Plug("akinsho/toggleterm.nvim", { ["tag"] = "v1.*" })

-- Test
Plug "kubejm/jest.nvim"

vim.call "plug#end"
