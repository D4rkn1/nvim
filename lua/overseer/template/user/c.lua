return {
  name = "run c",
  builder = function()
    return {
      cmd = { "ninja", "-C", "build", "run" },
    }
  end,
}
