return {
  'stevearc/overseer.nvim',
  config = function()
    require("overseer").setup()
    vim.keymap.set("n", "<leader>oa", function()
      local task = require("overseer").new_task({
        cmd = { "make" },
        cwd = vim.fn.getcwd(),
      })
      task:start()
      vim.api.nvim_win_set_buf(0, task:get_bufnr())
    end)
  end,
  opts = {},
}
