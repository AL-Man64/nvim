return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.basedpyright = {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "standard",
                        },
                    },
                },
            }
        end,
    },
}
