return {
  'tpope/vim-fugitive',
  cmd = {
    "G",
    "Git",
    "Gstatus",
    "Gdiffsplit",
    "Gvdiffsplit",
  },
  keys = {
    { '<leader>gc', '<cmd>G commit<cr>', desc = 'Git Commit' },
    { '<leader>gg', '<cmd>G<cr><c-w>K', desc = 'Fugitive Status' },
    { '<leader>gX', '<cmd>G rm % | Bdelete!<cr>', desc = 'Remove File' },
  }
}
