local present, cmp = pcall(require, "cmp")

if not present then
  return
end

require("base46").load_highlight("cmp")

vim.opt.completeopt = "menuone,noselect"

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

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
   local info = self:info_()
   info.scrollable = false
   return info
end

local options = {
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
--[[         ["<C-e>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }), ]]
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
        --["<C-j>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() then
        --        cmp.select_next_item()
        --    elseif luasnip.choice_active() then
        --        luasnip.change_choice(1)
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),
        --["<C-k>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() then
        --        cmp.select_prev_item()
        --    elseif luasnip.choice_active() then
        --        luasnip.change_choice(1)
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),
      ["<C-y>"] = cmp.config.disable,
      ["<c-space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Insert,
      })
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
        --{
        --    name = "buffer",
        --    keyword_length = 5,
        --    option = {
        --        get_bufnrs = function()
        --            local bufs = {}
        --            for _, win in ipairs(vim.api.nvim_list_wins()) do
        --                bufs[vim.api.nvim_win_get_buf(win)] = true
        --            end
        --            return vim.tbl_keys(bufs)
        --        end
        --    }
        --},
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    formatting = {
      format = function(_, vim_item)
         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
         return vim_item
      end,
--[[ 
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
               -- luasnip = "[snip]",
            }
        } ]]
    },
   window = {
      completion = {
         border = border "CmpBorder",
         winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
         border = border "CmpDocBorder",
      },
   },

--[[     experimental = {
        native_menu = false,
        ghost_text = true,
    } ]]
}

cmp.setup(options)
