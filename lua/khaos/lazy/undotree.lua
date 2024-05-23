return {
	'jiaoshijie/undotree',
	branch = "master",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require('undotree').setup({})
	end,
	keys = {
		{ "<leader>u", "<CMD>lua require('undotree').toggle()<CR>" },
	},
}
