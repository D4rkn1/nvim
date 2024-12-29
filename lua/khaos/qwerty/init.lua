vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>S", "<cmd>bd!<CR>")
vim.keymap.set("n", "<C-s>", function() vim.cmd('silent! %bd') end)
vim.keymap.set("n", "<leader>o", [[<C-w>q]])
vim.keymap.set("n", "<leader>q", function() vim.cmd('qa!') end)
vim.keymap.set("n", "<leader>L", "<cmd>:Lazy<CR>")
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>e", "<cmd>:e!<CR>")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("v", "G", "Gzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("v", "j", "jzz")
vim.keymap.set("v", "k", "kzz")
vim.keymap.set("n", "<leader>c<leader>", "<cmd>make<CR>")
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cj", "<cmd>cn<CR>")
vim.keymap.set("n", "<leader>ck", "<cmd>cp<CR>")

vim.keymap.set("n", "<leader>c<leader>", "<CMD>TSContextToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>[", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
