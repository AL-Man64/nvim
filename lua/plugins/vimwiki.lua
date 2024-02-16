return {
    "vimwiki/vimwiki",

    lazy = false,

    init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/Documents/knowledge",
                syntax = "markdown",
                ext = ".md",
            },
        }

        vim.keymap.set(
            "n",
            "<leader>wx",
            "<cmd>VimwikiIndex<cr>",
            { desc = "Open index file of the [count]'s wiki" }
        )

        vim.keymap.set(
            "n",
            "<leader>wt",
            "<cmd>VimwikiTabIndex<cr>",
            { desc = "Open index file of the [count]'s wiki in a new tab." }
        )

        vim.keymap.set(
            "n",
            "<leader>ws",
            "<cmd>VimwikiUISelect<cr>",
            { desc = "List and select available wikis." }
        )

        vim.keymap.set(
            "n",
            "<leader>wi",
            "<cmd>VimwikiDiaryIndex<cr>",
            { desc = "Open diary index file of the [count]'s wiki" }
        )

        vim.keymap.set(
            "n",
            "<leader>w<leader>w",
            "<cmd>VimwikiMakeDiaryNote<cr>",
            { desc = "Open diary wiki-file for today of the [count]'s wiki." }
        )

        vim.keymap.set(
            "n",
            "<leader>w<leader>t",
            "<cmd>VimwikiTabMakeDiaryNote<cr>",
            {
                desc = "Open diary wiki-file for today of the [count]'s wiki in a new tab.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>w<leader>y",
            "<cmd>VimwikiMakeYesterdayDiaryNote<cr>",
            {
                desc = "Open diary wiki-file for yesterday of the [count]'s wiki.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>w<leader>m",
            "<cmd>VimwikiMakeTomorrowDiaryNote<cr>",
            {
                desc = "Open diary wiki-file for tomorrow of the [count]'s wiki.",
            }
        )
    end,
}
