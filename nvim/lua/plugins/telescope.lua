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

            vim.keymap.set("n", "<leader>gf", builtin.git_files, {desc = "Search [G]it [F]iles"})
            vim.keymap.set("n", "<leader>sf", builtin.find_files, {desc = "[S]earch [F]iles"})
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, {desc = "[S]earch by [G]rep"})
        end
    }
}
