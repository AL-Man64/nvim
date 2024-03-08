return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    window = {
      position = "right",
      width = 28,
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
    },
  },
}
