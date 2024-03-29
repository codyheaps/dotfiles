return {
    {
        "tpope/vim-dispatch",
        "clojure-vim/vim-jack-in",
        "radenling/vim-dispatch-neovim",
        "Olical/conjure",
        ft = {
            "clojure",
            "fennel",
            "python"
        },
        dependencies = {
            {
                "PaterJason/cmp-conjure",
                config = function()
                    local cmp = require("cmp")
                    local config = cmp.get_config()
                    table.insert(config.sources, {
                        name = "buffer",
                        option = {
                            sources = {
                                {
                                    name = "conjure"
                                }
                            }
                        }
                    })
                    cmp.setup(config)
                end
            }
        },
        config = function(_, _opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            -- Set configuration options here
            vim.g["conjure#debug"] = true
            vim.g["conjure#log#hud#enabled"] = false
        end
    }
}
