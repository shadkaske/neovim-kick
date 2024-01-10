return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  cmd = { 'Telescope' },
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    defaults = {
      prompt_prefix = ' 󰭎  ',
      selection_caret = '  ',
      sorting_strategy = 'descending',
      mappings = {
        i = {
          ['<esc>'] = require('telescope.actions').close,
        },
      },
      file_ignore_patterns = { 'node_modules' },
      path_display = { 'truncate' },
      set_env = { ['COLORTERM'] = 'truecolor' },
    },
  },
}
