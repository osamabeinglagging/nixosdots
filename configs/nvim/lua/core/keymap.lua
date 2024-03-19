vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set("i", "jk", "<Esc>")

-- Map in visual mode
vim.keymap.set("v", "<C-~>", ":lua require('comment').com()<CR>", { noremap = true, expr = false })

-- Map in normal mode
vim.keymap.set("n", "<C-~>", ":lua require('comment').com()<CR>", { noremap = true, expr = false })

-- Map in insert mode
vim.keymap.set("i", "<C-~>", "<Esc>:lua require('comment').com()<CR>", { noremap = true, expr = false })
