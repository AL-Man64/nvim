local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "lazyvim.plugins.extras.coding.luasnip" },
        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.dap.nlua" },
        { import = "lazyvim.plugins.extras.editor.harpoon2" },
        { import = "lazyvim.plugins.extras.editor.illuminate" },
        { import = "lazyvim.plugins.extras.editor.inc-rename" },
        { import = "lazyvim.plugins.extras.editor.overseer" },
        { import = "lazyvim.plugins.extras.editor.refactoring" },
        { import = "lazyvim.plugins.extras.formatting.black" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.lang.clangd" },
        { import = "lazyvim.plugins.extras.lang.cmake" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.git" },
        { import = "lazyvim.plugins.extras.lang.go" },
        { import = "lazyvim.plugins.extras.lang.java" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.lang.omnisharp" },
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.sql" },
        { import = "lazyvim.plugins.extras.lang.tex" },
        { import = "lazyvim.plugins.extras.lang.toml" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.lsp.neoconf" },
        { import = "lazyvim.plugins.extras.lsp.none-ls" },
        { import = "lazyvim.plugins.extras.ui.treesitter-context" },
        { import = "lazyvim.plugins.extras.util.chezmoi" },
        { import = "lazyvim.plugins.extras.util.dot" },
        { import = "lazyvim.plugins.extras.util.startuptime" },
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
