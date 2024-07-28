return {
    -- annoying defaults
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            close_if_last_window = true,
            window = {
                position = "right",
                width = 28,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
        },
    },

    -- unneeded
    {
        "nvim-pack/nvim-spectre",
        enabled = false,
    },

    -- very annoying
    {
        "folke/flash.nvim",
        enabled = false,
    },
}
