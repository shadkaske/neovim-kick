return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {
      plugins = {
        registers = false,
      },
      layout = {
        align = 'center',
        spacing = 4,
      },
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '',
      },
    }

    local wk = require 'which-key'

    -- Which key labels
    local icons = require 'util.icons'

    wk.register({
      b = {
        name = string.format('%s Buffers', icons.Buffers),
        s = { name = 'swap' },
      },
      c = { name = string.format('%s Code', icons.LSP) },
      d = { name = string.format('%s Debug', icons.Debugger) },
      f = { name = string.format('%s Find', icons.Search) },
      g = { name = string.format('%s Git', icons.Git) },
      h = { name = string.format('%s Harppon', icons.kinds.Enum) },
      l = { name = string.format('%s Laravel', icons.Laravel) },
      o = { name = string.format('%s Org', icons.Spellcheck) },
      q = { name = string.format('%s Quit', icons.BufferClose) },
      s = { name = string.format('%s Session', icons.Session) },
      -- t = { name = string.format('%s Terminal', icons.Terminal) },
      y = { name = string.format('%s Clipboard', icons.Paste) },
    }, {
      mode = { 'n', 'v' },
      prefix = '<leader>',
    })
  end,
}
