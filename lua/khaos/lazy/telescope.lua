return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require('telescope').setup({
            pickers = {
                find_files = {
                    style = {
                        border = "single",
                    },
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                grep_strings = {
                    theme = "ivy",
                },
            },
        })

        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>pc", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {})
        vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
    end
}
