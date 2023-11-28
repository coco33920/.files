
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        {
            "vim-airline/vim-airline",
            lazy = false,
            priority = 1000,
            dependencies = {
                "vim-airline/vim-airline-themes",
                "ryanoasis/vim-devicons"
            }
        },
        {
            "LazyVim/LazyVim"
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            },
            config = function()
                require("nvim-tree").setup {}
            end
        },
        {
            "romgrk/barbar.nvim",
            dependencies = {
                "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
                "nvim-tree/nvim-web-devicons" -- OPTIONAL: for file icons
            },
            init = function()
                vim.g.barbar_auto_setup = false
            end,
            opts = {},
            version = "^1.0.0" -- optional: only update when a new 1.x version is released
        },
        {
            "kaarmu/typst.vim",
            ft = "typst",
            lazy = false
        },
        "wakatime/vim-wakatime",
        {
            "folke/which-key.nvim",
            lazy = true
        },
        {
            "akinsho/toggleterm.nvim",
            tag = "*",
            config = true
        },
        -- Git related plugins
        {"catppuccin/nvim", name = "catppuccin", priority = 1000},
        "simrat39/rust-tools.nvim",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        -- Detect tabstop and shiftwidth automatically
        "tpope/vim-sleuth",
        -- NOTE: This is where your plugins related to LSP can be installed.
        --  The configuration is done below. Search for lspconfig to find it below.
        {
            -- LSP Configuration & Plugins
            "neovim/nvim-lspconfig",
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                -- Useful status updates for LSP
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                {"j-hui/fidget.nvim", tag = "legacy", opts = {}},
                -- Additional lua configuration, makes nvim stuff amazing!
                "folke/neodev.nvim"
            }
        },
        {
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                -- Adds LSP completion capabilities
                "hrsh7th/cmp-nvim-lsp",
                -- Adds a number of user-friendly snippets
                "rafamadriz/friendly-snippets"
            }
        },
        -- Useful plugin to show you pending keybinds.
        {"folke/which-key.nvim", opts = {}},
        {
            -- Adds git related signs to the gutter, as well as utilities for managing changes
            "lewis6991/gitsigns.nvim",
            opts = {
                -- See `:help gitsigns.txt`
                signs = {
                    add = {text = "+"},
                    change = {text = "~"},
                    delete = {text = "_"},
                    topdelete = {text = "‾"},
                    changedelete = {text = "~"}
                },
                on_attach = function(bufnr)
                    vim.keymap.set(
                        "n",
                        "<leader>hp",
                        require("gitsigns").preview_hunk,
                        {buffer = bufnr, desc = "Preview git hunk"}
                    )

                    -- don't override the built-in and fugitive keymaps
                    local gs = package.loaded.gitsigns
                    vim.keymap.set(
                        {"n", "v"},
                        "]c",
                        function()
                            if vim.wo.diff then
                                return "]c"
                            end
                            vim.schedule(
                                function()
                                    gs.next_hunk()
                                end
                            )
                            return "<Ignore>"
                        end,
                        {expr = true, buffer = bufnr, desc = "Jump to next hunk"}
                    )
                    vim.keymap.set(
                        {"n", "v"},
                        "[c",
                        function()
                            if vim.wo.diff then
                                return "[c"
                            end
                            vim.schedule(
                                function()
                                    gs.prev_hunk()
                                end
                            )
                            return "<Ignore>"
                        end,
                        {expr = true, buffer = bufnr, desc = "Jump to previous hunk"}
                    )
                end
            }
        },
        {
            -- Set lualine as statusline
            "nvim-lualine/lualine.nvim",
            -- See `:help lualine.txt`
            opts = {
                options = {
                    icons_enabled = false,
                    component_separators = "|",
                    section_separators = ""
                }
            }
        },
        {
            -- Add indentation guides even on blank lines
            "lukas-reineke/indent-blankline.nvim",
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help ibl`
            main = "ibl",
            opts = {}
        },
        -- "gc" to comment visual regions/lines
        {"numToStr/Comment.nvim", opts = {}},
        -- Fuzzy Finder (files, lsp, etc)
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                -- Fuzzy Finder Algorithm which requires local dependencies to be built.
                -- Only load if `make` is available. Make sure you have the system
                -- requirements installed.
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    -- NOTE: If you are having trouble with this installation,
                    --       refer to the README for telescope-fzf-native for more instructions.
                    build = "make",
                    cond = function()
                        return vim.fn.executable "make" == 1
                    end
                }
            }
        },
        {
            -- Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects"
            },
            build = ":TSUpdate"
        },
        {import = "lazyvim.plugins.extras.ui.mini-starter"}
    },
    {}
)

require("toggleterm-config")
require("whichkey")
require("autocmds")
require("keymaps")
require("options")
require("telescope_config")
require("tree_config")
require("lsp_config_file")

vim.cmd.colorscheme "catppuccin"
