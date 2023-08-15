return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end
            }
        },
        event = "VeryLazy",
        config = function()
            require("telescope").setup {
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = {height = 0.95}
                }
            }

            pcall(require("telescope").load_extension, "fzf")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>sgf", builtin.git_files, {desc = "[S]earch [G]it [F]iles"})
            vim.keymap.set("n", "<leader>spf", builtin.find_files, {desc = "[S]earch [P]roject [F]iles"})
            vim.keymap.set("n", "<leader>gpf", builtin.live_grep, {desc = "[G]rep [P]roject [F]iles"})
        end
    }
}
