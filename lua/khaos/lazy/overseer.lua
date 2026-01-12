return {
  'stevearc/overseer.nvim',
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      templates = {},
    })

    -- meson build
    overseer.register_template({
      name = "meson",
      builder = function(params)
        return {
          cmd = { "meson", "setup", "build" },
        }
      end,
      tags = { overseer.TAG.BUILD },
      condition = {
        filetype = { "c", "cpp" },
      },
    })

    -- cargo run
    overseer.register_template({
      name = "run",
      builder = function(params)
        -- This must return an overseer.TaskDefinition
        return {
          -- cmd is the only required field. It can be a list or a string.
          cmd = { "cargo", "run" },
          -- additional arguments for the cmd (usually only useful if cmd is a string)
          -- args = {},
          -- the name of the task (defaults to the cmd of the task)
          -- name = "Greet",
          -- set the working directory for the task
          -- cwd = "/tmp",
          -- additional environment variables
          -- env = {
          --   VAR = "FOO",
          -- },
          -- the list of components or component aliases to add to the task
          -- components = { "my_custom_component", "default" },
          -- arbitrary table of data for your own personal use
          -- metadata = {
          --   foo = "bar",
          -- },
        }
      end,
      -- Optional fields
      -- desc = "Optional description of task",
      -- Tags can be used in overseer.run_task()
      -- params = {
        -- See :help overseer-params
      -- },
      -- Add requirements for this template. If they are not met, the template will not be visible.
      -- All fields are optional.
      condition = {
        -- A string or list of strings
        -- Only matches when current buffer is one of the listed filetypes
        condition = {
          callback = function()
            return vim.bo.filetype == "rs"
          end,
        }
        -- A string or list of strings
        -- Only matches when cwd is inside one of the listed dirs
        -- dir = "/home/user/my_project",
      },
    })

    -- ninja run
    overseer.register_template({
      name = "run",
      builder = function(params)
        return {
          cmd = { "ninja", "-C", "build", "run" },
        }
      end,
      tags = { overseer.TAG.BUILD },
      condition = {
        filetype = { "c", "cpp" },
      },
    })
  end,
  opts = {},
}
