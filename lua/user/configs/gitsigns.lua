import("gitsigns", function(gitsigns)
  gitsigns.setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "▐" },
      change = { hl = "GitSignsChange", text = "▐" },
      delete = {
        hl = "GitSignsDelete",
        text = "-",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = "‾",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = { hl = "GitSignsChange", text = "≈" },
      untracked = { hl = "GitSignsAdd", text = "▐" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = { interval = 1000, follow_files = true },
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 500,
      ignore_whitespace = true,
    },
    current_line_blame_formatter = "  <author>, <author_time> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = { enable = false },
    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
      map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

      -- Actions
      map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
      map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
      map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
      map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
      map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
      map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
      map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

      -- Text object
      map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  })
end)
