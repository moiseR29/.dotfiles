local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

-- for async code Lua
Plug('nvim-lua/plenary.nvim')

-- helper NvChad for themes
Plug("NvChad/extensions")
Plug("NvChad/base46")

-- iconst
Plug("kyazdani42/nvim-web-devicons")

-- buffer with tabs as vscode
Plug('akinsho/bufferline.nvim', { ['tag'] = 'v2.*' })

-- indentations
Plug("lukas-reineke/indent-blankline.nvim")

-- hexa in colors
Plug("NvChad/nvim-colorizer.lua")

-- themes for languages
Plug('nvim-treesitter/nvim-treesitter',{['do'] = ':TSUpdate'})

-- git plugin for inspect commits
Plug('lewis6991/gitsigns.nvim')

-- LSP

-- simple to use language server installer
Plug("williamboman/nvim-lsp-installer")

-- LSP (Lenguage Server Protocol)
Plug("neovim/nvim-lspconfig")

-- easy snippets
Plug("rafamadriz/friendly-snippets")

-- Completation plugin
Plug("hrsh7th/nvim-cmp")

-- library snippets
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

-- Additonals
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")

-- autopair
Plug("windwp/nvim-autopairs")


-- schemas for json
Plug("b0o/schemastore.nvim")

vim.call('plug#end')
