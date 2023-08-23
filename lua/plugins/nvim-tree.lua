return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      view = {
        width = '20%',
        side = 'left',
      },
      update_focused_file = {
        enable = true,
      },
      diagnostics = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      filters = {
        git_ignored = false,
        custom = {
          "^.null-ls.*",
        },
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    }
  end,
}
