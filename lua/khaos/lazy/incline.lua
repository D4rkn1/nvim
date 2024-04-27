return {
	"b0o/incline.nvim",
	config = function()
		require("incline").setup {
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
				local modified = vim.bo[props.buf].modified
				local normalColor = '#eeeeee'
				local modifiedColor = '#e84713'
				local color = modified and modifiedColor or normalColor
				return {
					filename,
					guifg = color,
				}
			end
		}
	end,
	event = 'VeryLazy',
}
