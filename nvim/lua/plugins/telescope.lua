return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- These are my keymaps to OPEN FILES in Telescope
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-s>"] = actions.file_split,    -- Ctrl-s to open in horizontal split (insert mode)
                            ["<C-v>"] = actions.file_vsplit,   -- Ctrl-v to open in vertical split (insert mode)
                            ["<C-t>"] = actions.select_tab, -- Insert mode: open in new tab
                        },
                        n = {
                            ["<C-s>"] = actions.file_split,    -- Ctrl-s to open in horizontal split (normal mode)
                            ["<C-v>"] = actions.file_vsplit,   -- Ctrl-v to open in vertical split (normal mode)
                            ["<C-t>"] = actions.select_tab, -- Insert mode: open in new tab
                        },
                    },
                },
            })

            -- These are my keymaps for opening Telescope:
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        -- This is your opts table
        config = function ()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
