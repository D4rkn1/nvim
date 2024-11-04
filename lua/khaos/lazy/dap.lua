return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" }
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        args = { "/home/khaos/video/badapple.mp4" },
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }
  end,
  keys = {
    { "<leader>fa", function() require("dap").toggle_breakpoint() end },
    { "<leader>f;", function() require("dap").clear_breakpoints() end },
    { "<leader>fs", function() require("dap").continue() end },
    { "<leader>fd", function() require("dap").repl.open() end },
    { "<leader>fj", function() require("dap").step_over() end },
    { "<leader>fk", function() require("dap").step_into() end },
    { "<leader>fl", function() require("dap.ui.widgets").hover() end },
    { "<leader>fh", function()
      local widget = require("dap.ui.widgets")
      widget.centered_float(widget.expression)
    end },
  },
}
