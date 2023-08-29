return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context"
        },
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup {
                modules = {},
                ignore_install = {},
                ensure_installed = {
                    "clojure",
                    "php",
                    "java",
                    "python",
                    "typescript",
                    "vue",
                    "html",
                    "javascript",
                    "lua",
                    "vimdoc",
                    "vim"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer"
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer"
                        }
                    }
                }
            }
        end
    }
}
