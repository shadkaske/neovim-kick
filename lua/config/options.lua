-- Some Global options
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/usr/bin/python3'

-- Set highlight on search
vim.opt.hlsearch = false

-- Set Cursor Line on
vim.opt.cursorline = true

vim.opt.hidden = true

-- Set Scrolloff
vim.opt.scrolloff = 4

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- No Wrap
vim.opt.wrap = false

-- Default tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamed'

-- Split options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 100

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Colorscheme
-- vim.cmd.colorscheme "onedark"
-- require('onedark').setup {
--   style = 'darker'
-- }

-- require('onedark').load()
vim.cmd.colorscheme "catppuccin"
