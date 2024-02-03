return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    'akinsho/org-bullets.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require('orgmode').setup_ts_grammar()
    --
    -- Setup treesitter
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    }
    require('orgmode').setup {
      org_agenda_files = { '~/org/**/*' },
      org_default_notes_file = '~/org/refile.org',
    }
  end,
}
