return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup()

    -- t prefix ( terminal )
    vim.keymap.set('n', '<leader>lt', function()
      require('util').toggle_tinker()
    end, { desc = 'Tinker' })
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = 'Terminal' })
    vim.keymap.set('n', '<leader>ly', function()
      require('util').toggle_yarn_watch()
    end, { desc = 'Yarn Watch' })
    vim.keymap.set('n', '<leader>ld', function()
      require('util').toggle_yarn_dev()
    end, { desc = 'Yarn Run Dev' })
  end,
}
