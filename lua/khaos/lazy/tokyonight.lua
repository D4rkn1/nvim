return {
	'folke/tokyonight.nvim',
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true
		})

		require("khaos.color")
	end,
}
