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

-- CONFIG BELOW FOR REPL AND SLIME
-- Let vim know that we use tmux as our slime target
vim.g.slime_target = "tmux"
-- Pane default, so it does not ask
vim.g.slime_default_config = { socket_name = "default", target_pane = "1" }
-- Make it ask which session to use (because sometimes we have multiple sessions for multiple projects)
vim.g.slime_dont_ask_default = 1

-- Send visual selection with <leader>s
vim.keymap.set("x", "<leader>s", "<Plug>SlimeRegionSend")
-- Send paragraph with <leader>p
vim.keymap.set("n", "<leader>p", "<Plug>SlimeParagraphSend")
-- Send cell (ex. notebook-style) with  <leader>c
vim.keymap.set("n", "<leader>c", "<Plug>SlimeSendCell")

