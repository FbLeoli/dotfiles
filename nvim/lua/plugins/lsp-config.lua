return {
    -- First, mason: 
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function ()
            --Small example config
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    -- Now Mason-LSPconfig, a plugin that bridges these 2.
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "pylsp" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Activate servers, from nvim 0.11 and later
            vim.lsp.enable({'lua_ls', 'pylsp'})
            -- Define LSP keybindings on attach
            local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = group,
                callback = function(args)
                    local bufnr = args.buf
                    local map = function(mode, keys, fn)
                        vim.keymap.set(mode, keys, fn, { buffer = bufnr, silent = true })
                    end

                    map("n", "gd", vim.lsp.buf.definition)
                    map("n", "gr", vim.lsp.buf.references)
                    map("n", "gi", vim.lsp.buf.implementation)
                    map("n", "K", vim.lsp.buf.hover)
                    map("n", "<leader>rn", vim.lsp.buf.rename)
                    map("n", "<leader>ca", vim.lsp.buf.code_action)
                    map("n", "<C-W>d", vim.diagnostic.open_float)
                end,
            })
        end,
    }
}
