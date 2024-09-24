return {
	'folke/tokyonight.nvim',
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true,
			on_colors = function(color)
				color.comment = "#00a16b"
			end,
		})
	end,
}
