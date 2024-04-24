return {
	'folke/tokyonight.nvim',
	on_colors = function(color)
		color.Comment = "#05420a"
	end,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true
		})

		require("khaos.color")
	end,
}
