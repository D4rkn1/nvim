return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require 'treesitter-context'.setup {
      enable = false,
      max_lines = 1,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = nil,
      zindex = 20,
      on_attach = nil,

    }
  end,
}
