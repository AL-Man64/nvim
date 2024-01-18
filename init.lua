vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy-setup")

if not vim.g.vscode then
    vim.cmd.colorscheme("catppuccin")
end

require("options")
require("keymaps")

-- require("post")
