local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug "neovim/nvim-lspconfig"                      -- Enable LSP
Plug "williamboman/nvim-lsp-installer"            -- simple to use language server installer

Plug "hrsh7th/nvim-cmp"                           -- Completation plugin
Plug "hrsh7th/cmp-buffer"                         -- buffer completions
Plug "hrsh7th/cmp-path"                           -- path completions
Plug "hrsh7th/cmp-nvim-lsp" 
Plug "saadparwaiz1/cmp_luasnip"                   -- snippets completions 
Plug "onsails/lspkind-nvim"                       -- icons popup
Plug "hrsh7th/cmp-cmdline"                        -- cmdline completions
Plug "L3MON4D3/LuaSnip"                           -- library snippets 

Plug "b0o/schemastore.nvim"                       -- schemas for jsonls 

vim.call('plug#end')