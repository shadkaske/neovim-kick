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
  keys = {
    { '<C-p>', ':Telescope find_files<CR>', desc = 'Telescope Find Files' },
    { '<C-g>', ':Telescope live_grep<CR>', desc = 'Telescope Live Grep' },
    { '<leader>bf', ':Telescope buffers<CR>', desc = 'Buffers' },
    { '<leader>fb', ':Telescope buffers<CR>', desc = 'Buffers' },
    { '<leader>fc', ':Telescope registers<CR>', desc = 'Clipboard Registers' },
    { '<leader>fd', ':Telescope diagnostics<CR>', desc = 'Diagnostics' },
    { '<leader>ff', ':Telescope find_files<CR>', desc = 'Files' },
    { '<leader>ff', ':Telescope find_files<CR>', desc = 'Telescope Find Files' },
    { '<leader>fg', ':Telescope live_grep<CR>', desc = 'Live Grep' },
    { '<leader>fg', ':Telescope live_grep<CR>', desc = 'Telescope Live Grep' },
    { '<leader>fh', ':Telescope help_tags<CR>', desc = 'Help' },
    { '<leader>fh', ':Telescope help_tags<CR>', desc = 'Telescope Help' },
    { '<leader>fk', ':Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>fr', ':Telescope oldfiles<CR>', desc = 'Recent Files' },
    { '<leader>fw', ':Telescope grep_string<CR>', desc = 'Current Word' },
    { '<leader>gC', ':Telescope git_bcommits<cr>', desc = 'Checkout commit(for current file)' },
    { '<leader>gb', ':Telescope git_branches<CR>', desc = 'Checkout Branch' },
    { '<leader>go', ':Telescope git_status<cr>', desc = 'Open changed file' },
    { '<leader>lS', ':Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Workspace Symbols' },
    { '<leader>ld', ':Telescope diagnostics bufnr=0 theme=get_ivy<cr>', desc = 'Buffer Diagnostics' },
    { '<leader>ls', ':Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
    { '<leader>lw', ':Telescope diagnostics<cr>', desc = 'Diagnostics' },
    {
      '<leader>fi',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = 'In Current Buffer',
    },
  },
}
