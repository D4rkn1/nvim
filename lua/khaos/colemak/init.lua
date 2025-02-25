vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>R", "<cmd>bd!<CR>")
vim.keymap.set("n", "<C-r>", function() vim.cmd('silent! %bd') end)
vim.keymap.set("n", "<leader>y", [[<C-w>q]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>q", function() vim.cmd('qa!') end)
vim.keymap.set("n", "<leader>I", "<cmd>:Lazy<CR>")
vim.keymap.set("v", "<leader>j", [["+j]])
vim.keymap.set("n", "<leader>t", "<cmd>:e!<CR>")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("v", "G", "Gzz")
vim.keymap.set("n", "<C-e>", "<C-u>zz")
vim.keymap.set("n", "<C-n>", "<C-d>zz")
vim.keymap.set("v", "<C-e>", "<C-u>zz")
vim.keymap.set("v", "<C-n>", "<C-d>zz")
vim.keymap.set("n", "n", "jzz")
vim.keymap.set("o", "n", "j")
vim.keymap.set("n", "e", "kzz")
vim.keymap.set("o", "e", "k")
vim.keymap.set("v", "n", "jzz")
vim.keymap.set("v", "e", "kzz")
vim.keymap.set("n", "<leader>ch", "<cmd>make<CR>")
vim.keymap.set("n", "<leader>cx", "<cmd>make clean<CR>")
vim.keymap.set("n", "<leader>cy", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cn", "<cmd>cn<CR>")
vim.keymap.set("n", "<leader>ce", "<cmd>cp<CR>")
vim.keymap.set({ "n", "o", "v" }, "i", "l")
vim.keymap.set({ "n", "o", "v" }, "m", "h")
vim.keymap.set({ "n", "o", "v" }, "h", "e")
vim.keymap.set({ "n", "o", "v" }, "H", "E")
vim.keymap.set({ "n", "o", "v" }, "l", "i")
vim.keymap.set("n", "k", "nzz")
vim.keymap.set("n", "U", function() vim.cmd('redo') end)
vim.keymap.set("n", "<leader>rn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>re", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>c<leader>", "<CMD>TSContextToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>[", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set("i", "<C-y>", function()
  require("khaos.shortcut.endl").Init()
end, { silent = true })
