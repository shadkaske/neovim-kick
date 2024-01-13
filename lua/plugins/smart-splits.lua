return {
  'mrjones2014/smart-splits.nvim',
  build = './kitty/install-kittens.bash',
  lazy = false,
  config = function()
    require('smart-splits').setup {}

    -- resizing splits
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader>bsh', require('smart-splits').swap_buf_left, { desc = 'Swap Buffer Left' })
    vim.keymap.set('n', '<leader>bsj', require('smart-splits').swap_buf_down, { desc = 'Swap Buffer Down' })
    vim.keymap.set('n', '<leader>bsk', require('smart-splits').swap_buf_up, { desc = 'Swap Buffer Up' })
    vim.keymap.set('n', '<leader>bsl', require('smart-splits').swap_buf_right, { desc = 'Swap Buffer Right' })
  end,
}
