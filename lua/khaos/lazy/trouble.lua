return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>d<leader>", function() require("trouble").toggle() end)
		vim.keymap.set("n", "<leader>dj", function() require("trouble").next({skip_groups = true , jump = true}) end)
		vim.keymap.set("n", "<leader>dk", function() require("trouble").previous({skip_groups = true , jump = true}) end)
	end,
}
