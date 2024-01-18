return {
    "rose-pine/nvim",

    cond = not vim.g.vscode,

    name = "rose-pine",

    config = function()
        require("rose-pine").setup({
            variant = "main",
        })
    end
}
