-- Mini is basically a library with many tools to help us in neovim. We will only install submodules of this library:
-- BY DEFAULT MINIMOVE ALLOWS YOU TO USE ALT+MOTIONS(HJKL) TO MOVE LIENS OR SELECTIONS AROUND!!!
return {
    { "echasnovski/mini.move", version = false,
    config = function()
        require("mini.move").setup()
    end,
},
}
