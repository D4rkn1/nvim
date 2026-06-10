return {
  "folke/tokyonight.nvim",
  lazy = true,
  init = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      on_colors = function(color)
        color.comment = "#00a16b"
      end,
    })
  end,
}
