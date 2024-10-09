return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>d<leader>", function() trouble.toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>dj", function()
            if not trouble.is_open() then trouble.toggle("workspace_diagnostics") end
            require("trouble").next({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<leader>dk", function()
            if not trouble.is_open() then trouble.toggle("workspace_diagnostics") end
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end,
}
