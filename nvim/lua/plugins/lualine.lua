return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                -- Modus vivendi goes well with gruvbox dark
                theme = 'modus-vivendi'
            }
        })
    end
}
