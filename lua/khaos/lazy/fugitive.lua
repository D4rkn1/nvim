return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>", { silent = true })
        vim.keymap.set("n", "<leader>gh", ":Telescope git_stash<CR>", { silent = true })
        vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
        vim.keymap.set("n", "<leader>gp", ":Git! push<CR>", { silent = true })
        vim.keymap.set("n", "<leader>gl", ":Gclog! -- %:p<CR>", { silent = true })
        vim.keymap.set("n", "<leader>gL", function()
            local file = vim.fn.expand("%:.")
            local gitCmd = ":Git log -p -- " .. file
            vim.cmd(gitCmd)
        end)
        vim.keymap.set("n", "<leader>gc", function()
            vim.cmd.Git({ 'commit' })
        end)

        local khaos_fug = vim.api.nvim_create_augroup("khaos_fug", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = khaos_fug,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>gP", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, opts)
            end,
        })
    end
}
