return {
  "nvim-mini/mini.map",
  config = function()
    local map = require("mini.map")
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.gitsigns(),
        map.gen_integration.diagnostic(),
      },
      symbols = {
        encode = map.gen_encode_symbols.dot("4x2"),
        scroll_line = "•",
        scroll_view = "┃",
      },
      window = {
        side = "right",
        width = 10,
        winblend = 100,
        show_integration_count = true,
      },
    })
    vim.keymap.set("n", "<Leader><Leader>", map.toggle)
  end,
}
