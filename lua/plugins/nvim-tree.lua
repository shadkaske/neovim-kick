return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      actions = {
        open_file = {
          resize_window = false,
        },
        view = {
          preserve_window_proportions = false,
        },
      },
    }
  end,
}
