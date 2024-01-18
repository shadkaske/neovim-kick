return {
  'akinsho/bufferline.nvim',
  version = 'v3.*',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
      options = {
        always_show_bufferline = false,
        themable = true,
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        separator_style = 'thin',
        numbers = 'ordinal',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
            separator = true,
          },
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
          {
            filetype = 'dapui_scopes',
            text = 'Debug',
            text_align = 'left',
            separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
      },
    }
  end,
  keys = {
    { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
    { '<leader>bj', '<cmd>BufferLinePick<cr>', desc = 'Jump to Buffer' },
    { 'H', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { 'L', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  }
}
