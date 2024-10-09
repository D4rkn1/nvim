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
                path = "~/vault/vlt",
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
    },
}
