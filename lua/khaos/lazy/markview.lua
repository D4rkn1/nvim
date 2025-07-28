return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = false
      },
    })
    vim.keymap.set('n', '<leader>mt', function()
      vim.cmd('Markview')
    end, {})
  end,
}
