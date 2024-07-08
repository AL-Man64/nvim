return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts, {
                "glslls",
                "wgsl-analyzer",
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                glslls = {},
                wgsl_analyzer = {},
            },
        },
    },

    {
        "nvimtools/none-ls.nvim",

        opts = function(_, opts)
            local nls = require("null-ls")

            -- HACK: none-ls only supports the glsl filetype, but glslc needs to
            -- know the shader stage to work properly, which can be inferred
            -- from the extension, hence adding the glsl filetype to each shader
            -- extension
            vim.filetype.add({
                extension = {
                    vert = "glsl",
                    tesc = "glsl",
                    tese = "glsl",
                    frag = "glsl",
                    geom = "glsl",
                    comp = "glsl",
                },
            })

            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.diagnostics.glslc.with({
                    -- use opengl instead of vulkan1.0
                    extra_args = { "--target-env=opengl" },
                }),
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "glsl",
                "wgsl",
            })
        end,
    },
}
