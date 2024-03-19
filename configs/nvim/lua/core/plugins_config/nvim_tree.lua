vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<c-m>', ':NvimTreeToggle<CR>')
