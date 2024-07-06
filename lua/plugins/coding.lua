return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- TODO: find better alternative
            inlay_hints = {
                enabled = false,
            },
        },
    },

    {
        "nvim-cmp",
        keys = {
            { "<Tab>", mode = { "i", "s" }, false },
            { "<S-Tab>", mode = { "i", "s" }, false },
        },
    },

    -- more annoying than helpful
    {
        "echasnovski/mini.pairs",
        enabled = false,
    },
}
