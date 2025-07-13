return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,           -- important: do NOT lazy-load Treesitter
        build = ":TSUpdate",    -- run :TSUpdate after install
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "python" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}

