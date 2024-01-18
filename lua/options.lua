local opt = vim.opt


-- [[ Behavior ]]

-- General
opt.mouse = "a"
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"

-- Undo File
opt.undofile = true
opt.undolevels = 8192

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Indents
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Scrolloff
opt.scrolloff = 6
opt.sidescrolloff = 12


-- [[ Display ]]

-- General
opt.termguicolors = true
opt.signcolumn = "yes"
opt.conceallevel = 3
opt.cursorline = true
opt.list = true
opt.wrap = false
opt.colorcolumn = "80"

-- Line Numbers
opt.number = true
opt.relativenumber = true
