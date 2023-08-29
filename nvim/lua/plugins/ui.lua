return {
    "rktjmp/lush.nvim",
    "kyazdani42/nvim-web-devicons",
    {
        "briones-gabriel/darcula-solid.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "darcula-solid"
            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = "|",
                    section_separators = ""
                },
                sections = {
                    lualine_b = {
                        {
                            "branch",
                            icon = "",
                            color = {
                                fg = "#98971A"
                            }
                        }
                    }
                }
            }
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = {
                        text = "+"
                    },
                    change = {
                        text = "~"
                    },
                    delete = {
                        text = "_"
                    },
                    topdelete = {
                        text = "‾"
                    },
                    changedelete = {
                        text = "~"
                    }
                },
                on_attach = function()
                    local gs = package.loaded.gitsigns

                    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, {desc = "[t]oggle line [b]lame"})
                    vim.keymap.set("n", "<leader>nh", gs.next_hunk, {desc = "[n]ext [h]unk"})
                    vim.keymap.set("n", "<leader>lh", gs.prev_hunk, {desc = "[l]ast [h]unk"})
                    vim.keymap.set("n", "<leader>ph", gs.preview_hunk, {desc = "[p]review [h]unk"})
                    vim.keymap.set("n", "<leader>rh", gs.reset_hunk, {desc = "[r]eset [h]unk"})

                    vim.api.nvim_command("hi GitSignsCurrentLineBlame guifg=#83A598")
                end
            }
        end
    },
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function()
            require("marks").setup {}
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {}
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            vim.opt.list = true
            require("indent_blankline").setup {
                show_end_of_line = false,
                show_first_indent_level = false,
                char = "¦",
                show_current_context = true
            }
        end
    },
    {
        "folke/twilight.nvim",
        opts = {
            dimming = {
                alpha = 0.50,
                color = {
                    "Normal",
                    "#ffffff"
                },
                term_bg = "#000000",
                inactive = false
            },
            context = 10,
            treesitter = true,
            expand = {
                "function",
                "method",
                "table",
                "if_statement"
            },
            exclude = {}
        }
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = .70,
                height = .95
            }
      }
    },
    {
        "folke/trouble.nvim",
        opts = {},
        config = function ()
            vim.keymap.set("n", "<leader>xx", function() require("trouble").open("document_diagnostics") end)
            vim.keymap.set("n", "<leader>Xx", function() require("trouble").close() end)
        end
    }
}
