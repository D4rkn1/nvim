return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls" },
      automatic_installation = true,
    }

    require("mason-lspconfig").setup {
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                },
              },
            },
            capabilities = capabilities,
          }
        }
      end,
      ["clangd"] = function()
        lspconfig.clangd.setup {
          cmd = {
            "clangd",
            "--fallback-style=webkit"
          }
        }
      end,
    }

    vim.diagnostic.config({
      float = {
        focusable = true,
        border = "none",
        source = "never",
      },
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
        },
      },
    })

    require('khaos.lspattach')
  end,
}
