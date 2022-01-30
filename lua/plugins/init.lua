local fn = vim.fn
local file_exists = require("core.utils").file_exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    vim.cmd("packadd packer.nvim")
end

local config = {
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    },
    log = { level = "warn" },
    profile = {
        enable = true,
        threshold = 1,
    }
}

local packer = require("packer")

return packer.startup({
    function(use)
        -- ensure packer is not removed
        use { "wbthomason/packer.nvim" }

        -- git integration
        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            event = "VimEnter",
            config = function()
                require("plugins.configs.gitsigns")
            end
        }

        -- lsp stuff
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "windwp/nvim-autopairs",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                {
                    "L3MON4D3/LuaSnip",
                    config = function()
                        require("plugins.configs.luasnip")
                    end
                }
            },
            config = function()
                require("plugins.configs.cmp-nvim")
            end
        }
        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.lsp_signature")
            end
        }
        use {
            "neovim/nvim-lspconfig",
            after = "lsp_signature.nvim",
            config = function()
                require("plugins.configs.lspconfig")
            end
        }
        use {
            "jose-elias-alvarez/null-ls.nvim",
            event = "VimEnter",
            config = function()
                require("plugins.configs.null-ls")
            end
        }
        use {
            "folke/lsp-trouble.nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            cmd = {"TroubleToggle"},
            config = function()
                require("plugins.configs.trouble")
            end
        }
        use {
            "rmagatti/goto-preview",
            keys = {"gpd", "gpi"},
            config = function()
                require("plugins.configs.goto-preview")
            end
        }
        use {
            "j-hui/fidget.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("fidget").setup({})
            end
        }

        -- syntax highlighting
        use {
            "nvim-treesitter/nvim-treesitter",
            event = {"BufRead"},
            config = function()
                require("plugins.configs.treesitter")
            end
        }

        -- utilities
        use {
            "numToStr/Comment.nvim",
            event = {"BufRead"},
            config = function()
                require("Comment").setup()
            end
        }
        use {
            "ggandor/lightspeed.nvim",
            config = function()
                require("lightspeed").setup({
                    repeat_ft_with_target_char = true,
                })
            end
        }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {"NvimTreeToggle", "NvimTreeFocus"},
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function()
                require("plugins.configs.nvimtree")
            end
        }
        use {
            "tpope/vim-surround",
            event = {"BufRead"},
        }
        use {
            "ethanholz/nvim-lastplace",
            event = {"BufRead"},
            config = function()
                require("nvim-lastplace").setup({
                    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                    lastplace_open_folds = true
                })
            end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            cmd = "Telescope",
            config = function()
                require("plugins.configs.telescope")
            end
        }
        use {
            "simrat39/symbols-outline.nvim",
            cmd = {"SymbolsOutline"},
            config = function()
                require("plugins.configs.outline")
            end
        }
        use {
            "editorconfig/editorconfig-vim",
            cond = file_exists(".editorconfig")
        }
        use {
            "famiu/bufdelete.nvim",
            cmd = "Bdelete",
        }
        use {"Iron-E/nvim-cartographer"}
        use {
            "mizlan/iswap.nvim",
            after = "nvim-treesitter",
        }

        -- terminal
        use {
            "akinsho/toggleterm.nvim",
            cmd = { "ToggleTerm" },
            config = function()
                require("toggleterm").setup({
                    shade_terminals = true,
                    size = 13,
                    direction = "horizontal",
                    float_opts = {
                        border = "rounded",
                    },
                })
            end
        }
        use {
            "TimUntersberger/neogit",
            requires = {"nvim-lua/plenary.nvim"},
            cmd = "Neogit",
            config = function()
                require("neogit").setup({
                    signs = {
                        section = { " ", " " },
                        item = { " ", " " },
                        hunk = { " ", " " },
                    }
                })
            end
        }
        use {
            "mfussenegger/nvim-dap",
            requires = {
                "mfussenegger/nvim-dap-python",
                "leoluz/nvim-dap-go",
            },
            module = {"dap"},
            config = function()
                require("plugins.configs.dap")
            end
        }

        -- user interfaces
        use {
            "akinsho/bufferline.nvim",
            event = {"VimEnter"},
            config = function()
                require("plugins.configs.bufferline")
            end
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = {"BufRead"},
            config = function()
                require("plugins.configs.indentblankline")
            end
        }
        use {
            "rebelot/heirline.nvim",
            config = function()
                require("plugins.configs.heirline")
            end
        }

        -- language specific
        use {
            "Vimjas/vim-python-pep8-indent",
            ft = "python"
        }

        -- colorschemes
        use { "rose-pine/neovim", as = "rose-pine" }
        use { "~/github/kosmikoa.nvim" }
    end,

    config = config
})