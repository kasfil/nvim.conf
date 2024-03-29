import("kanagawa", function(kanagawa)
  local palette = require("kanagawa.colors").setup()

  local colors = {
    lightgreen = "#7ae582",
    lightblue = "#77aaff",
  }

  local custom_hl = {
    -- normal
    NonText = { fg = palette.sumiInk3 },
    CursorLine = { bg = palette.sumiInk2 },
    WinSeparator = { fg = palette.sumiInk4 },
    SideWin = { fg = palette.fujiWhite, bg = palette.sumiInk0 },
    -- LineNr = {bg = palette.sumiInk0},

    -- HTML (mostly linked by markdown)
    htmlBoldItalic = { fg = palette.oniViolet, italic = true, bold = true },

    -- nvim-tree
    NvimTreeNormal = { link = "SideWin" },
    NvimTreeNormalNC = { link = "SideWin" },

    -- treesitter
    -- Comment = {fg = palette.fujiGray, italic = true},

    -- Telescope
    TelescopePromptNormal = { bg = palette.autumnGreen, fg = palette.sumiInk3 },
    TelescopePromptBorder = { bg = palette.autumnGreen, fg = palette.autumnGreen },
    TelescopePromptTitle = { bg = palette.autumnYellow, fg = palette.sumiInk3 },
    TelescopePromptPrefix = { fg = palette.sumiInk3, bg = palette.autumnGreen },
    TelescopePromptCounter = { fg = palette.sumiInk3 },

    TelescopeResultsNormal = { bg = palette.sumiInk2 },
    TelescopeResultsBorder = { bg = palette.sumiInk2, fg = palette.sumiInk2 },
    TelescopeResultsTitle = { bg = palette.sumiInk2, fg = palette.sumiInk2 },

    TelescopePreviewNormal = { bg = palette.sumiInk0 },
    TelescopePreviewBorder = { bg = palette.sumiInk0, fg = palette.sumiInk0 },
    TelescopePreviewTitle = { bg = palette.carpYellow, fg = palette.sumiInk0 },

    TelescopeSelection = { bg = palette.sumiInk3 },
    TelescopeSelectionCaret = { fg = palette.waveRed, bg = palette.sumiInk3 },

    -- Lightspeed
    LeapBackdrop = { fg = palette.fujiGray },

    -- SymbolsOutline
    -- TODO: set better highlight
    FocusedSymbol = { bg = "NONE" },

    -- dap nvim
    DebugPC = { bg = palette.winterRed },
    DapStatusLine = { bg = "NONE", fg = palette.roninYellow, bold = true },

    -- Gitsigns
    GitSignsCurrentLineBlame = { fg = palette.waveBlue2 },

    -- neogit
    -- TODO: set better highlight
    NeogitNotificationInfo = { fg = palette.springBlue },
    NeogitNotificationWarning = { fg = palette.carpYellow },
    NeogitNotificationError = { fg = palette.peachRed },
    NeogitDiffAddHighlight = { bg = palette.springGreen, fg = palette.sumiInk0 },
    NeogitDiffDeleteHighlight = { bg = palette.sumiInk3, fg = palette.autumnRed },
    NeogitDiffContextHighlight = { bg = palette.sumiInk2, fg = palette.oldWhite },
    NeogitHunkHeader = { bg = palette.sumiInk2, fg = palette.fujiWhite },
    NeogitHunkHeaderHighlight = { bg = palette.sumiInk2, fg = palette.fujiWhite },

    -- bqf
    BqfPreviewBorder = { fg = palette.springGreen, bg = palette.sumiInk0 },
    BqfPreviewFloat = { bg = palette.sumiInk0 },

    -- dressing
    DressingInput = { bg = palette.sumiInk1, fg = palette.fujiWhite },
    DressingBorder = { bg = palette.sumiInk1, fg = palette.autumnYellow },
    FloatTitle = { bg = palette.sumiInk1, fg = palette.autumnYellow, bold = true, italic = true },

    -- nvim-surround
    NvimSurroundHighlightTextObject = { link = "IncSearch" },

    -- neotest
    -- TODO: set better highlight
    NeotestAdapterName = { fg = palette.fujiWhite, bold = true },
    NeotestDir = { fg = palette.springBlue },
    NeotestFile = { fg = palette.autumnYellow, bold = true },
    NeotestTest = { fg = palette.carpYellow, bold = true },
    NeotestNamespace = { fg = palette.waveBlue2 },
    NeotestFocused = { fg = palette.sumiInk2, bg = palette.roninYellow, bold = true },
    NeotestMarked = { fg = palette.sumiInk2, bg = colors.lightgreen, bold = true },
    NeotestWinSelect = { link = "SideWin" },
  }

  kanagawa.setup({
    commentStyle = { italic = true },
    dimInactive = false,
    globalStatus = true,
    overrides = custom_hl,
    colors = colors,
  })
end)
