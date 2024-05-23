local h = {}

h.config = function ()
  local present, cmp = pcall(require, "cmp")
  
  if not present then
    return
  end

  local lspkind = require("lspkind")

  local icons = {
     Namespace = "",
     Text = " ",
     Method = " ",
     Function = " ",
     Constructor = " ",
     Field = "ﰠ ",
     Variable = " ",
     Class = "ﴯ ",
     Interface = " ",
     Module = " ",
     Property = "ﰠ ",
     Unit = "塞 ",
     Value = " ",
     Enum = " ",
     Keyword = " ",
     Snippet = " ",
     Color = " ",
     File = " ",
     Reference = " ",
     Folder = " ",
     EnumMember = " ",
     Constant = " ",
     Struct = "פּ ",
     Event = " ",
     Operator = " ",
     TypeParameter = " ",
     Table = "",
     Object = " ",
     Tag = "",
     Array = "[]",
     Boolean = " ",
     Number = " ",
     Null = "ﳠ",
     String = " ",
     Calendar = "",
     Watch = " ",
     Package = "",
  }

  cmp.setup({
    completion = {
      completeopt = "menuone,noselect"
    },
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = "..."
      })
      --format = function(_, vim_item)
      --   vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      --   return vim_item
      --end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    }),
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-j>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
      ["<C-k>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
      ["<C-y>"] = cmp.config.disable,
      ["<c-space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Insert,
      })
    },
    snippet = {
      expand = function (args)
        require("luasnip").lsp_expand(args.body)
      end
    }
  })

end

return h
