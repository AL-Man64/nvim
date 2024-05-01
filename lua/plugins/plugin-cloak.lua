return {
  "laytan/cloak.nvim",

  opts = {
    enabled = true,
    cloak_character = "*",
    highlight_group = "Comment",
    cloak_length = 12,
    try_all_patterns = true,
    patterns = {
      {
        file_pattern = ".env*",
        cloak_pattern = "=.+",
        replace = nil,
      },
    },
  },
}
