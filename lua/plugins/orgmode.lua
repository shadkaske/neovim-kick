return {
  'nvim-orgmode/orgmode',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'akinsho/org-bullets.nvim',
  },
  config = function ()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = {'~/org/*'},
      org_default_notes_file = '~/org/refile.org'
    })
  end
}
