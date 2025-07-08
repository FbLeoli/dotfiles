-- Choose your active theme here
local active_colorscheme = "kanagawa" -- or any other

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
      -- Only apply if selected
      if active_colorscheme == "kanagawa" then
        vim.cmd.colorscheme("kanagawa")
      end
    end,
  },
}

