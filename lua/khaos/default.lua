vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.cursorline = true

vim.opt.autoread = true

vim.opt.laststatus = 3


vim.api.nvim_create_autocmd({"BufWinEnter", "VimEnter","WinEnter"}, {
	callback = function()
		vim.opt.cursorline = true
	end
})
vim.api.nvim_create_autocmd({"WinLeave"}, {
	callback = function()
		vim.opt.cursorline = false
	end
})
