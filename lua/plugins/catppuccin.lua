return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      show_end_of_buffer = true,

      styles = {
        comments = { "italic" },
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
      }
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
