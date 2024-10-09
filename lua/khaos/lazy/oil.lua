return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            columns = {
                "icon",
            },
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<leader>."] = "actions.select",
            },
        })
        vim.keymap.set("n", "<leader>,", "<CMD>Oil<CR>")
    end,
}
