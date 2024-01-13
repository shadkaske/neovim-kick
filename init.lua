vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Disable Netrw before loading plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
require('lazy').setup({
  { import = 'plugins' }
})

-- Load Configs
require('config')

-- vim: ts=2 sts=2 sw=2 et
