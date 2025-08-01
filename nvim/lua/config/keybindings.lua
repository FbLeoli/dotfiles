-- For specifically plugin targeted keybinds, please look in the specific plugin.lua file (e.g. for keybinds related to formatters look into none-ls.lua file

vim.keymap.set("i", "jk", "<Esc>", { noremap = true}) -- Use jk to go to normal mode if in insert mode

-- For better navigation (sync with tmux)
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
