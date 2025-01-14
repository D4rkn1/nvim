vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.cursorline = true

vim.opt.autoread = true

vim.opt.laststatus = 0

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.api.nvim_create_autocmd({ "BufWinEnter", "VimEnter", "WinEnter" }, {
  callback = function()
    vim.opt.cursorline = true
  end
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.opt.cursorline = false
  end
})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 300 }
  end
})

vim.api.nvim_create_autocmd({"CursorMoved", "BufWinEnter", "VimEnter", "WinEnter" }, {
  callback = function()
    vim.cmd("normal! zz")
  end,
})

vim.opt.conceallevel = 1
