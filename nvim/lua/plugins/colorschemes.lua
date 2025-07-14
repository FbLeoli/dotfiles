-- Choose your active theme here
local active_colorscheme = "gruvbox" -- or "catppuccin", "kanagawa", etc.

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            if active_colorscheme == "catppuccin" then
                vim.cmd.colorscheme("catppuccin")
            end
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            if active_colorscheme == "kanagawa" then
                vim.cmd.colorscheme("kanagawa")
            end
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                contrast = "hard", -- "hard", "soft", or ""
                overrides = {},
            })

            if active_colorscheme == "gruvbox" then
                vim.cmd.colorscheme("gruvbox")
            end
        end,
    },
}
