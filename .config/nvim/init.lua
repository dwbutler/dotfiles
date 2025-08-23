-- Set leader key early to ensure it's available for plugin configs
vim.g.mapleader = ' '

-- Set up lazy.nvim as the package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
require('config.options')

-- Load plugins
require("lazy").setup("plugins")

-- Key mappings
require('config.keymaps')