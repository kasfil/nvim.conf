local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function(use)
    -- packer ensure installed
    use {"wbthomason/packer.nvim"}

    -- colorscheme
    use {"shaunsingh/nord.nvim"}

    -- git integration
    use {"tpope/vim-fugitive"}
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}
        },
        config = function()
            require("packs.gitsigns")
        end
    }

    -- lsp and completion
    use {"neovim/nvim-lspconfig"}
    use {"ray-x/lsp_signature.nvim"}
    use {"glepnir/lspsaga.nvim"}
    use {"L3MON4D3/LuaSnip"}
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
        }
    }
    use {"saadparwaiz1/cmp_luasnip"}
    use {
        "folke/trouble.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
    }

    -- utilities
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("packs.treesitter")
        end
    }
    use {"LionC/nest.nvim"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}
        },
        config = function()
            require("packs.telescope")
        end
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            {"kyazdani42/nvim-web-devicons"}
        },
        config = function()
            require("packs.nvimtree")
        end
    }
    use {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup()
        end
    }
    use {"tpope/vim-surround"}
    use {"windwp/nvim-autopairs"}
    use {
        "ggandor/lightspeed.nvim",
        config = function()
            require("packs.lightspeed")
        end
    }
    use {
        "numtostr/FTerm.nvim",
        config = function()
            require("packs.fterm")
        end
    }

    -- user interface
    use {
        "hoob3rt/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            require("packs.lualine")
        end
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("packs.indentblankline")
        end
    }
end)
