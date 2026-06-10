return {
  "neovim-treesitter/nvim-treesitter",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  lazy = false,
  build = ":TSUpdate",
  config = function(args)
    require("nvim-treesitter").install({
      "vimdoc",
      "javascript",
      "typescript",
      "c",
      "lua",
      "go",
      "jsdoc",
      "bash",
      "c_sharp",
      "regex",
    })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if not pcall(vim.treesitter.start, args.buf) then
          return
        end
        -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- vim.wo.foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- vim.opt.foldlevel = 99
        -- vim.opt.foldenable = true
        -- vim.opt.foldtext = ""
        -- vim.api.nvim_set_hl(0, "Folded", {})
      end,
    })
  end,
}
