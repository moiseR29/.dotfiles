return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local present, cmp = pcall(require, "cmp")

    if not present then
      return
    end

    local lspkind = require "lspkind"

    require("luasnip.loaders.from_vscode").lazy_load()

    --local confirm_key = nil
    --cmp.event:on("confirm_done", function()
    --  if confirm_key ~= nil then
    --    vim.fn.feedkeys(confirm_key)
    --  end
    --end)

    --[[ local skipConfirm = function(fallback)
      if cmp.visible() then
        return fallback()
        --return cmp.config.disable
      end
    end ]]

    --[[ local confirm = function(fallback, key)
      if cmp.visible() then
        confirm_key = key
        return cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }(fallback)
      else
        return fallback()
      end
    end ]]

    cmp.setup {
      preselect = cmp.PreselectMode.None,
      --completion = {
      --  completeopt = "menuone,noselect",
      --  --completeopt = "menu,menuone,noselect,preview",
      --  keyword_length = 0,
      --  autocomplete = true,
      --},
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = "...",
        },
        --format = function(_, vim_item)
        --   vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        --   return vim_item
        --end,
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
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
        --["<CR>"] = function(fallback)
        --  return confirm(fallback, nil)
        --end,
        ["<CR>"] = cmp.mapping.confirm {
          select = true,
          behavior = cmp.ConfirmBehavior.Insert,
        },
        --["<space>"] = function(fallback)
        --  return skipConfirm(fallback)
        --end,
        --[":"] = function(fallback)
        --  return skipConfirm(fallback)
        --end,
        --["."] = function(fallback)
        --  return skipConfirm(fallback)
        --end,
        ["<C-y>"] = cmp.config.disable,
        ["<c-space>"] = cmp.mapping.complete(),
        --[[       ["C-j"] = function (fallback)
          confirm_key = nil
          if cmp.visible() then
            return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }(fallback)
          else
            return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
          end
        end,
        ["C-k"] = function (fallback)
          confirm_key = nil
          if cmp.visible() then
            return cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
          else
            fallback()
          end
        end ]]

        --[[       ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Insert,
        }) ]]
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    }
  end,
}

-- [[
--
-- ]]
