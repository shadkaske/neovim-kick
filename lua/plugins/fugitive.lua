return {
  'tpope/vim-fugitive',
  cmd = {
    "G",
  },
  keys = {
    { '<leader>gc', '<cmd>G commit<cr>', desc = 'Git Commit' },
    { '<leader>gg', '<cmd>G<cr>', desc = 'Fugitive Status' },
    { '<leader>gX', '<cmd>G rm % | Bdelete!<cr>', desc = 'Remove File' },
  }
}
