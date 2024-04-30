return {
	'jiaoshijie/undotree',
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require('undotree').setup({})
		vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
		vim.opt.undofile = true
	end,
	keys = {
		{ "<leader>u", "<CMD>lua require('undotree').toggle()<CR>" },
	},
}
