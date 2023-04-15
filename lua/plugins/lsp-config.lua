return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true
    },

    { 'williamboman/mason-lspconfig.nvim' },

    {
      'j-hui/fidget.nvim',
      opts = {
        window = {
          blend = 0,
        },
      }
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim' },
  },
}
