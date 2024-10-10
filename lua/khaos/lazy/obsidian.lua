return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/vaults/personal",
            }
        },
        {
            name = "no-vault",
            path = function()
                return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
            end,
            overrides = {
                notes_subdir = vim.NIL,
                new_notes_location = "current_dir",
                templates = {
                    folder = vim.NIL,
                },
                disable_frontmatter = true,
            },
        },
        mappings = {
            ["<leader>al"] = {
                action = function()
                    return vim.cmd('ObsidianToday')
                end,
                opts = { noremap = false, expr = false, buffer = true },
            },
            ["<leader>aj"] = {
                action = function()
                    return vim.cmd('ObsidianTomorrow')
                end,
                opts = { noremap = false, expr = false, buffer = true },
            },
            ["<leader>ak"] = {
                action = function()
                    return vim.cmd('ObsidianYesterday')
                end,
                opts = { noremap = false, expr = false, buffer = true },
            },
            ["<leader>a;"] = {
                action = function()
                    return vim.cmd('ObsidianNew')
                end,
                opts = { noremap = false, expr = false, buffer = true },
            },
        },
    },
}
