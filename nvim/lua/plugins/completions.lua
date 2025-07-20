-- Here we will manage everything related to snippets and completions :)
return {
    { -- NVIM-CMP: This is the CORE. It's the engine that allows us to manage and display the suggestions, but IT DOESN'T PROVIDE DATA ITSELF
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    --	completion = cmp.config.window.bordered(),
                    --  documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- move down
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- move up
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- This guy communicates with the lsp's so they can feed nvim-cmp with autocompletions
        config = function()
            local cmp = require("cmp")
            require("cmp").setup({
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    {
                        name = "path",
                        option = {
                            pathMappings = {
                                ["@"] = "${folder}/src",
                                -- ['/'] = '${folder}/src/public/',
                                -- ['~@'] = '${folder}/src',
                                -- ['/images'] = '${folder}/src/images',
                                -- ['/components'] = '${folder}/src/components',
                            },
                        },
                    },
                    { name = "buffer" },
                    { name = "luasnip" },
                }),
            })
        end,
    },
    { "hrsh7th/cmp-path" },
    { -- LUASNIP is the plugin that will be the SNIPPETS engine (in the same way that nvim-cmp handles autocompletions, this one handles the snippets
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",     -- This guy is a bridge between LuaSnip and nvim-cmp, it's the bridge that allows the snipets to appear in nvim-cmp,
            "rafamadriz/friendly-snippets", -- This guy is the responsible to actually PROVIDE the snippets to LuaSnip, for ALL MAJOR LANGUAGES
        },
    },
}
