return {
	"neovim/nvim-lspconfig",
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "it", "describe", "before_each", "after_each" },
					}
				}
			},
			capabilities = capabilities,
		})
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
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
				numhl = {
					[vim.diagnostic.severity.WARN] = '',
					[vim.diagnostic.severity.ERROR] = '',
				},

				linehl = {
					[vim.diagnostic.severity.WARN] = '',
					[vim.diagnostic.severity.ERROR] = '',
				}
			},
		})

		require('khaos.lspattach')
	end,
}

