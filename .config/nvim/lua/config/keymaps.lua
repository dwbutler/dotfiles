-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Resize windows with arrow keys
-- vim.keymap.set('n', '<Up>', ':resize +2<CR>', { silent = true })
-- vim.keymap.set('n', '<Down>', ':resize -2<CR>', { silent = true })
-- vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', { silent = true })
-- vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', { silent = true })

-- Terminal mode: escape to normal mode and window navigation
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move to left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move to right window' })

-- Clear search highlights
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
