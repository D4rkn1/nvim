return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			skip_confirm_for_simple_edits = true,
		})
		vim.keymap.set("n", "<leader>,", "<CMD>Oil<CR>")
	end,
}
