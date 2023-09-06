return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--ignore-case",
                "--hidden",
                "--trim",
                "--glob=!.git/*"
            }
            require("telescope").setup {
                defaults = {
                    path_display = function(_opts, path)
                        local tail = require("telescope.utils").path_tail(path)
                        return string.format("%s : (%s)", tail, path)
                    end,
                    layout_strategy = "vertical",
                    layout_config = {
                        height = 0.95
                    },
                    -- mappings = {
                    --     i = {
                    --         ["<esc>"] = actions.close
                    --     }
                    -- },
                    vimgrep_arguments = vimgrep_arguments
                }
            }

            vim.keymap.set("n", "<leader>pf", function()
                builtin.find_files({hidden=true, follow=true, no_ignore=true})
            end)

            vim.keymap.set("n", "<leader>grep", builtin.live_grep)
            vim.keymap.set("n", "<leader>ugrep", function()
                -- Performance option to use filetypes in the filter
                table.insert(vimgrep_arguments, "-u")
                builtin.live_grep()
            end)

            vim.keymap.set("n", "<leader>buf", builtin.buffers)
        end
    }
}
