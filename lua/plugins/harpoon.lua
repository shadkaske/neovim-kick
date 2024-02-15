return {
  'ThePrimeagen/harpoon',
  config = function()
    pcall(require('telescope').load_extension 'harpoon')
  end,
  keys = {
    {
      '<leader>hx',
      function()
        require('harpoon.mark').add_file()
      end,
      desc = 'Add Harpoon Mark',
    },
    {
      '<leader>hn',
      function()
        require('harpoon.ui').nav_next()
      end,
      desc = 'Next Harpoon Mark',
    },
    {
      '<leader>hp',
      function()
        require('harpoon.ui').nav_prev()
      end,
      desc = 'Previous Harpoon Mark',
    },
    {
      '<leader>hf',
      '<cmd>Telescope harpoon marks<cr>',
      desc = 'Find Harpoon Marks',
    },
    {
      '<leader>hu',
      function ()
        require('harpoon.ui').toggle_quick_menu()
      end,
      desc = 'Harpoon UI',
    },
    {
      '<leader>fm',
      '<cmd>Telescope harpoon marks<cr>',
      desc = 'Find Harpoon Marks',
    },
  },
}
