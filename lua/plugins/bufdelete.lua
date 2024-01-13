return {
  'famiu/bufdelete.nvim',
  lazy = true,
  cmd = {
    'Bdelete',
    'Bwipeout',
  },
  keys = {
    { '<leader>bd', '<cmd>Bdelete<cr>', desc = 'Close Buffer' },
    { '<leader>bD', '<cmd>Bdelete<cr>', desc = 'Force Close Buffer' },
    { '<leader>c', '<cmd>Bdelete!<cr>', desc = 'Close Buffer' },
  },
}
