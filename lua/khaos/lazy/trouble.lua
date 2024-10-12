return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>d<leader>",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Toggle trouble",
        },
        {
            "<leader>dj",
            "<cmd>Trouble diagnostics next jump=true<cr>",
            desc = "Diagnostics next",
        },
        {
            "<leader>dk",
            "<cmd>Trouble diagnostics prev jump=true<cr>",
            desc = "Diagnostics prev",
        },
    },
}
