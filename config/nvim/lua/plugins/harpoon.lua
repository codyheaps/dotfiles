return {
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        event = "VeryLazy",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = '[h]arpoon [a]dd'})
            vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, {desc = '[h]arpoon [m]enu'})

            vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, {desc = '[h]arpoon [1]'})
            vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, {desc = '[h]arpoon [2]'})
            vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, {desc = '[h]arpoon [3]'})
            vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, {desc = '[h]arpoon [4]'})
        end
    }
}
