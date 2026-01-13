return {
  name = "run cpp",
  builder = function()
    return {
      cmd = { "ninja", "-C", "build", "run" },
    }
  end,
}
