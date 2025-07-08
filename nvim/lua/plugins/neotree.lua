return{
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- Optional image support for file preview: See `# Preview Mode` for more information.
            -- {"3rd/image.nvim", opts = {}},
            -- OR use snacks.nvim's image module:
            -- "folke/snacks.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- add options here
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<C-s>"] = "open_split",     -- Horizontal split
                        ["<C-v>"] = "open_vsplit",    -- Vertical split
                        ["<C-t>"] = "open_tabnew",    -- Open in new tab
                    },
                },
            })
            vim.keymap.set('n', '<C-e>', ':Neotree toggle reveal<CR>', {desc = 'activate/deactivate neo-tree'})
            vim.keymap.set('n', '<leader>e', ':Neotree focus<CR>', {desc = 'focus neo-tree'})
        end
    }
}
