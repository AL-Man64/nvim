local set = vim.keymap.set

-- Get rid of that pesky help page
set({ "i", "n", "v" }, "<F1>", "<esc>")

-- Move Lines
set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Diagnostic
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
