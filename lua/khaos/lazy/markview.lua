return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  commit = "67b69cdaf9055bebac3682a070d7e5c8eecba29c",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    vim.keymap.set('n', '<leader>mt', function()
      vim.cmd('Markview')
    end, {})
  end,
}
