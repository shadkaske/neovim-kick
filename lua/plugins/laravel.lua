return {
  'adalessa/laravel.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'tpope/vim-dotenv',
    'MunifTanjim/nui.nvim',
    'nvimtools/none-ls.nvim',
  },
  cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
  keys = {
    { "<leader>aa", ":Laravel artisan<cr>" },
    { "<leader>ar", ":Laravel routes<cr>" },
    { "<leader>am", ":Laravel related<cr>" },
    {
      "<leader>at",
      function()
        require("laravel.tinker").send_to_tinker()
      end,
      mode = "v",
      desc = "Laravel Application Routes",
    },
  },
  event = { 'VeryLazy' },
  features = {
    null_ls = {
      enable = true,
    },
  },
  config = function()
    require('laravel').setup()
    require('telescope').load_extension 'laravel'
  end,
}
