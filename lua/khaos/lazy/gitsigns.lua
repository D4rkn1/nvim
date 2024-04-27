return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require('gitsigns').setup {
			on_attach = function(bufnr)
				local gitsigns = require('gitsigns')

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', '<leader>;j', function()
					if vim.wo.diff then
						vim.cmd.normal({ '<leader>;j', bang = true })
					else
						gitsigns.nav_hunk('next')
					end
				end)

				map('n', '<leader>;k', function()
					if vim.wo.diff then
						vim.cmd.normal({ '<leader>;k', bang = true })
					else
						gitsigns.nav_hunk('prev')
					end
				end)

				-- Actions
				map('n', '<leader>;s', gitsigns.stage_hunk)
				map('n', '<leader>;r', gitsigns.reset_hunk)
				map('v', '<leader>;s', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('v', '<leader>;r', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('n', '<leader>;S', gitsigns.stage_buffer)
				map('n', '<leader>;u', gitsigns.undo_stage_hunk)
				map('n', '<leader>;R', gitsigns.reset_buffer)
				map('n', '<leader>;p', gitsigns.preview_hunk)
				map('n', '<leader>;b', function() gitsigns.blame_line { full = true } end)
				map('n', '<leader>;B', gitsigns.toggle_current_line_blame)
				map('n', '<leader>;d', gitsigns.diffthis)
				map('n', '<leader>;D', function() gitsigns.diffthis('~') end)
				map('n', '<leader>;t', gitsigns.toggle_deleted)

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end
		}
	end
}
