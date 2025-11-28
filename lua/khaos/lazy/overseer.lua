return {
  'stevearc/overseer.nvim',
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  config = function ()
    require("overseer").setup()

    -- meson build
    require("overseer").register_template({
      name = "meson",
      builder = function(params)
        return {
          cmd = { "meson", "setup", "build" },
          args = {},
          name = "Greet",
        }
      end,
      tags = {require("overseer").TAG.BUILD},
      condition = {
        filetype = { "c", "cpp" },
      },
    })

    -- ninja run
    require("overseer").register_template({
      name = "ninja",
      builder = function (params)
        return {
          cmd = {"ninja", "-C", "build", "run"},
          name = "run",
        }
      end,
      tags = {require("overseer").TAG.BUILD},
      condition = {
        filetype = { "c", "cpp" },
      },
    })
  end,
  opts = {},
}
