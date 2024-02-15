return {
  'olimorris/onedarkpro.nvim',
  dependencies = {
    'nvim-lualine/lualine.nvim',
  },
  priority = 1000,
  lazy = false,
  -- Comment out config to not load
  config = function()
    require('onedarkpro').setup {
      highlights = {
        NvimTreeFolderIcon = {
          fg = '${blue}',
        },
      },
    }
    vim.cmd.colorscheme 'onedark_vivid'
    require('lualine').setup { options = { theme = 'onedark_vivid' } }
  end,
}
