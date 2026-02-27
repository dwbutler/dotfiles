-- Basic editor options
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.fillchars = { eob = ' ' }

-- Clipboard integration
vim.opt.clipboard = 'unnamedplus'

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- UI settings
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes:1'

-- Better splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Disable swap files and enable undo history
vim.opt.swapfile = false
vim.opt.undofile = true

-- Set colorscheme (temporary, will be moved to plugins later)
vim.cmd('colorscheme desert')
