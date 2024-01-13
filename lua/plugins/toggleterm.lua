return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup()

    -- t prefix ( terminal )
    vim.keymap.set('n', '<leader>ta', function()
      require('util').toggle_tinker()
    end, { desc = 'Tinker' })
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Terminal' })
    vim.keymap.set('n', '<leader>ty', function()
      require('util').toggle_yarn_watch()
    end, { desc = 'Yarn Watch' })
    vim.keymap.set('n', '<leader>td', function()
      require('util').toggle_yarn_dev()
    end, { desc = 'Yarn Run Dev' })
  end,
}
