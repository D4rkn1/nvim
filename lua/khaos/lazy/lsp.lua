return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
      automatic_installation = true,
    })
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
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
      },
      capabilities = capabilities,
    })

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "off",
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
      handlers = {
        ["$/progress"] = function(err, result, ctx)
          if result.token == (vim.g.basedpyright_progress_token or result.token) then
            vim.g.basedpyright_progress_token = result.token
            vim.lsp.handlers["$/progress"](err, result, ctx)
          end
        end,
      },
      capabilities = capabilities,
    })
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--fallback-style=webkit",
      },
      capabilities = capabilities,
    })

    vim.diagnostic.config({
      float = {
        focusable = true,
        border = "none",
        source = "never",
      },
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
        },
      },
    })

    require("khaos.lspattach")
  end,
}
