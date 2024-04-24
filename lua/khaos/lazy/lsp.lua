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
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		vim.diagnostic.config({
			float = {
				focusable = true,
				border = "rounded",
				source = "always",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = '',
					[vim.diagnostic.severity.WARN] = '',
				},

				numhl = {
					[vim.diagnostic.severity.WARN] = 'WarnMsg',
					[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
				},

				linehl = {
					[vim.diagnostic.severity.WARN] = 'WarnMsg',
					[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
				}
			},
		})

		require('khaos.lspattach')
	end,
}

