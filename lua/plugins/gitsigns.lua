return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "|" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" }
    },

    linehl = false, -- Could be good for a keymap

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align',
      delay = 0,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Actions
      map("n", "<leader>ghs", gs.stage_hunk, { desc = "Git stage hunk" })
      map("n", "<leader>ghr", gs.reset_hunk, { desc = "Git reset hunk" })
      map("n", "<leader>ghp", gs.preview_hunk, { desc = "Git preview hunk" })

      map("n", "<leader>ghb", function()
        gs.blame_line { full = false }
      end, { desc = "git blame line" })
      map("n", "<leader>ghd", gs.diffthis, { desc = "Diff this" })

      map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle git blame line" })
      map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle git show deleted" })
      map("n", "<leader>gth", gs.toggle_linehl, { desc = "Toggle git line highlight" })
    end,
  },
}
