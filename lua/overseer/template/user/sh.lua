return {
  name = "run sh",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { "bash", file }
    return {
      cmd = cmd,
    }
  end,
}
