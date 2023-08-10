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
                    add = {text = "+"},
                    change = {text = "~"},
                    delete = {text = "_"},
                    topdelete = {text = "‾"},
                    changedelete = {text = "~"}
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, {desc = "[T]oggle Line [B]lame"})
                    vim.keymap.set("n", "<leader>nh", gs.next_hunk, {desc = "[N]ext [H]unk"})
                    vim.keymap.set("n", "<leader>lh", gs.prev_hunk, {desc = "[L]ast [H]unk"})
                    vim.keymap.set("n", "<leader>ph", gs.preview_hunk, {desc = "[P]review [H]unk"})
                    vim.keymap.set("n", "<leader>rh", gs.reset_hunk, {desc = "[R]eset [H]unk"})
                end
            }
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
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
                show_end_of_line = false
            }
        end
    }
}
