return {
  'adalessa/laravel.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'tpope/vim-dotenv',
    'MunifTanjim/nui.nvim',
    'nvimtools/none-ls.nvim',
  },
  cmd = { 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
  event = { 'VeryLazy' },
  features = {
    null_ls = {
      enable = true,
    },
  },
  keys = {
    { '<leader>la', ':Laravel artisan<cr>', desc = 'Artisan Commands' },
    { '<leader>lr', ':Laravel routes<cr>', desc = 'Laravel Routes' },
  },
  config = function()
    require('laravel').setup()
    require('telescope').load_extension 'laravel'
  end,
}
