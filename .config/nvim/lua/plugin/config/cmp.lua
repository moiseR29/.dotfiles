local u = require("utils")
local lspkind = require "lspkind"

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end  

cmp.setup {
  --snippet = {
  --  expand = function(args)
  --    luasnip.lsp_expand(args.body) -- For `luasnip` users.
  --  end,
  --},

  mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.close()
          elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
          else
              fallback()
          end
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif luasnip.choice_active() then
              luasnip.change_choice(1)
          else
              fallback()
          end
      end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif luasnip.choice_active() then
              luasnip.change_choice(1)
          else
              fallback()
          end
      end, { "i", "s" }),
      ["<C-y>"] = cmp.config.disable,
      ["<c-b>"] = cmp.mapping.complete(),
  },

  formatting = {
      format = lspkind.cmp_format {
          with_text = true,
          menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
             -- luasnip = "[snip]",
          }
      }
  },

  sources = {
    { name = "nvim_lsp" },
    --{ name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())