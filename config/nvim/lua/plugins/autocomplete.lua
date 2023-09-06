return {
    "tpope/vim-sleuth",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            require("neodev").setup {}
        end
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {}
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP
            {
                "neovim/nvim-lspconfig"
            },
            {
                "williamboman/mason.nvim"
            },
            {
                "williamboman/mason-lspconfig.nvim"
            },

            -- Autocomplete
            {
                "hrsh7th/nvim-cmp"
            },
            {
                "hrsh7th/cmp-nvim-lsp"
            },
            {
                "L3MON4D3/LuaSnip"
            }
        },
        event = "VeryLazy",
        config = function()
            local lsp = require("lsp-zero").preset("recommended")

            local cmp = require("cmp")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
            })

            lsp.setup_nvim_cmp({
                mapping = cmp_mappings
            })

            -- :help lsp-zero-keybindings
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})

                -- Disable syntax highlighting from LSP
                client.server_capabilities.semanticTokensProvider = nil
            end)

            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = true
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
            require("which-key").setup {}
        end
    }
}
