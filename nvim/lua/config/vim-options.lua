-- Set the leader key to space:
vim.g.mapleader = " "

-- Some options to set the tabs equal to 4 spaces:
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

-- Show absolute and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
