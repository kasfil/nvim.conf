import("nvim-treesitter.configs", function(treesitter)
  treesitter.setup({
    ensure_installed = {
      "bash",
      "help",
      "comment",
      "gitignore",
      "go",
      "gomod",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "norg",
      "python",
      "sql",
      "toml",
      "vim",
      "yaml",
    },
    sync_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "python", "yaml" },
    },
    yati = {
      enable = true,
      disable = { "lua" },
      default_lazy = true,
      suppress_conflict_warning = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  })
end)
