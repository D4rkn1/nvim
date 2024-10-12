return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>", { silent = true })
        vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
        vim.keymap.set("n", "<leader>gj", function()
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
                vim.keymap.set("n", "<leader>gh", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>gP", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, opts)

                vim.keymap.set("n", "<leader>gp", ":!git push<CR>", opts)
            end,
        })
    end
}
