return {
	"nvim-lualine/lualine.nvim",

    cond = not vim.g.vscode,

    lazy = false,

	opts = {
		options = {
			theme = "catppuccin",
		},
	},
}
