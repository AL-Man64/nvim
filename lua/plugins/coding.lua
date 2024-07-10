return {
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {},
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
