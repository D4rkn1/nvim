return {
  "folke/tokyonight.nvim",
  lazy = false,
  init = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      on_colors = function(color)
        color.comment = "#00a16b"
      end,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
