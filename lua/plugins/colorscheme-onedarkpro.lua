return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedarkpro').setup({})
    -- vim.cmd.colorscheme "onedark"
    -- vim.cmd.colorscheme "onelight"
    vim.cmd.colorscheme "onedark_vivid"
    -- vim.cmd.colorscheme "onedark_dark"
  end,
}
