return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  init = function()
    require("kanagawa").setup()
    vim.cmd("colorscheme kanagawa-dragon")
  end,
}
