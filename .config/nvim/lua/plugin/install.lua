local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

--Plug "morhetz/gruvbox"                                           -- theme
Plug('ayu-theme/ayu-vim')                                         -- theme

Plug('nvim-lualine/lualine.nvim')                                 -- down´s line
Plug('kyazdani42/nvim-web-devicons')                              -- icons

Plug('tpope/vim-fugitive')                                        -- git plugin
Plug('yggdroot/indentline')                                       -- show lines tabs

Plug('christoomey/vim-tmux-navigator')                            -- easy move between buffers
Plug('jiangmiao/auto-pairs')                                      -- autopairs [] <--

Plug('ddollar/nerdcommenter')                                     -- comments
Plug('mg979/vim-visual-multi',{branch='master'})                  -- plugin for easy use more one lines

Plug('nvim-treesitter/nvim-treesitter',{['do'] = ':TSUpdate'})    -- themes for langauges
Plug('kyazdani42/nvim-tree.lua')                                  -- tree panel files

Plug('nvim-lua/plenary.nvim')                                     -- funny finder´s dependency
Plug('nvim-telescope/telescope.nvim')                             -- funny finder

Plug("neovim/nvim-lspconfig")                                     -- Enable LSP
Plug("williamboman/nvim-lsp-installer")                           -- simple to use language server installer

Plug("hrsh7th/nvim-cmp")                                          -- Completation plugin
Plug("hrsh7th/cmp-buffer")                                        -- buffer completions
Plug("hrsh7th/cmp-path")                                          -- path completions
Plug("hrsh7th/cmp-nvim-lsp")
Plug("saadparwaiz1/cmp_luasnip")                                  -- snippets completions
Plug("onsails/lspkind-nvim")                                      -- icons popup
Plug("hrsh7th/cmp-cmdline")                                       -- cmdline completions
Plug("L3MON4D3/LuaSnip")                                          -- library snippets

Plug("b0o/schemastore.nvim")                                      -- schemas for jsonls


vim.call('plug#end')
