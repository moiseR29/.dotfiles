return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
    { "ray-x/lsp_signature.nvim", event = "InsertEnter" },
  },
  config = function()
    local lspconfig = require "lspconfig"

    local mason_lspconfig = require "mason-lspconfig"

    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buff, silent = true }
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Go to definition"
        keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        opts.desc = "Go to definition with Telescope"
        keymap.set("n", "<leader>tgd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
        opts.desc = "Show LSP implementations with Telescope"
        keymap.set("n", "<leader>tgi", "<cmd>Telescope lsp_implementations<CR>", opts)

        keymap.set("n", "<leader>tgi", "<cmd>Telescope lsp_implementations<CR>", opts)

        keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = true, desc = "LSP signature help" })

        opts.desc = "See available code actions"
        keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)

        keymap.set("n", "<leader>vn", ':lua vim.lsp.diagnostic.goto_next({ border = "rounded" })<cr>')
        keymap.set("n", "<leader>vp", ':lua vim.lsp.diagnostic.goto_prev({ border = "rounded" })<cr>')
        keymap.set("n", "<leader>vf", ":lua vim.lsp.buf.format()<cr>")

        --u.buf_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
        --u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>")
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>tsd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        --u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        require("lsp_signature").on_attach {
          hint_enable = false,
          hi_parameter = "QuickFixLine",
          handler_opts = {
            border = vim.g.floating_window_border,
          },
        }
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = "", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers {
      -- TODO: default handlers for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,

      -- TODO: lua lsp config server
      ["lua_ls"] = function()
        require("neodev").setup()
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settigns = {
            Lua = {
              diagnostics = {
                enable = true,
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
              workspace = {
                library = {
                  [vim.fn.expand "VIMRUNTIME/lua"] = true,
                  [vim.fn.stdpath "config" .. "/lua"] = true,
                },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end,

      -- TODO: terraform
      ["terraformls"] = function()
        lspconfig["terraformls"].setup {
          capabilities = capabilities,
          cmd = { "terraform-ls", "serve" },
          fyletypes = { "tf" },
        }
      end,

      ---- TODO: go
      ["gopls"] = function()
        lspconfig["gopls"].setup {
          capabilities = capabilities,
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              gofumpt = true,
              usePlaceholders = true,
              analyses = {
                nilness = true,
                shadow = true,
                unusedparams = true,
                ususewrites = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        }
      end,

      -- TODO: jsonls
      ["jsonls"] = function()
        lspconfig["jsonls"].setup {
          capabilities = capabilities,
          settings = {
            json = {
              schemas = {
                {
                  fileMatch = { "package.json" },
                  url = "https://json.schemastore.org/package.json",
                },
                {
                  fileMatch = { "tsconfig*.json" },
                  url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                  fileMatch = { ".prettierrc", ".prettierrc.json", ".prettierrc.config.json" },
                  url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                  fileMatch = { ".eslintrc", ".eslintrc.json" },
                  url = "https://json.schemastore.org/eslintrc.json",
                },
              },
            },
          },
        }
      end,

      -- TODO: yaml
      ["yamlls"] = function()
        lspconfig["yamlls"].setup {
          capabilities = capabilities,
          settings = {
            yaml = {
              schemas = {
                ["https://kubernetesjsonschema.dev/v1.10.3-standalone/service-v1.json"] = "*service.yaml",
                ["https://kubernetesjsonschema.dev/v1.14.0/deployment-app-v1.json"] = "*deployment.yaml",
              },
            },
          },
        }
      end,
    }
  end,
}
