return {
    "nvim-telescope/telescope-fzf-native.nvim",

    cond = not vim.g.vscode,

    build = "make",

    cond = function()
        return vim.fn.executable "make" == 1
    end,
}
