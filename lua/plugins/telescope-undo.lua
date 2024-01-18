return {
  'debugloop/telescope-undo.nvim',
  dependencies = {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
  },
  keys = {
    {
      '<leader>u',
      '<cmd>Telescope undo<cr>',
      desc = 'Undo History',
    },
  },
  opts = {
    extensions = {
      undo = {
        use_delta = true,
        use_custom_command = nil,
        side_by_side = false,
        diff_context_lines = vim.o.scrolloff,
        entry_format = 'state #$ID, $STAT, $TIME',
        time_format = '',
        saved_only = false,
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'undo'
  end,
}
