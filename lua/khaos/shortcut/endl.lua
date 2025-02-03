local M = {}

function M.Init()
  vim.cmd('stopinsert')
  vim.api.nvim_feedkeys("$", "n", true)
  vim.api.nvim_feedkeys("a;\027", "n", true)
end

return M
