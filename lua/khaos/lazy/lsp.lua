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

		require("mason-lspconfig").setup_handlers {
			function(server_name)
				require("lspconfig")[server_name].setup {
					capabilities = capabilities
				}
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim", "it", "describe", "before_each", "after_each" },
							}
						},
						capabilities = capabilities,
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
