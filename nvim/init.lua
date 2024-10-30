vim.cmd 'set shiftwidth=2'
vim.cmd 'set number'
require 'config.lazy'
vim.g.mapleader = ' '

-- telescope keybinds
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', builtin.live_grep, { desc = 'Telescope live grep' }) --ctrl + p for live grep
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- space ff for finding files

-- nvim-tree keybinds
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', {})

-- terminal
-- Open terminal in split or vertical split
vim.api.nvim_set_keymap('n', '<Leader>t', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>vt', ':vsplit | terminal<CR>', { noremap = true, silent = true })

-- Exit terminal insert mode with Escape
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Navigate buffers
vim.api.nvim_set_keymap('n', '<leader>l', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Close current buffer
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true })

-- Split keybindings
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true }) -- Vertical split
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', { noremap = true, silent = true }) -- Horizontal split
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Move left
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- Move down
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- Move up
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Move right

-- Resize splits using Ctrl + Arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true }) -- Increase height
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true }) -- Decrease height
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true }) -- Decrease width
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true }) -- Increase width
