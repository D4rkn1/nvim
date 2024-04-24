return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "it", "describe", "before_each", "after_each" },
					}
				}
			}
		})
		lspconfig.csharp_ls.setup({})
		lspconfig.gopls.setup({})

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

