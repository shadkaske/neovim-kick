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
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '', -- symbol prepended to a group
      },
    }

    local wk = require 'which-key'

    -- Which key labels
    local icons = require 'util.icons'

    wk.register({
      b = { name = string.format('%s Buffers', icons.Buffers),
        s = { name = 'swap' },
      },
      d = { name = string.format('%s Debug', icons.Debugger) },
      f = { name = string.format('%s Find', icons.Search) },
      g = { name = string.format('%s Git', icons.Git) },
      h = { name = string.format('%s Harppon', icons.kinds.Enum) },
      l = { name = string.format('%s LSP', icons.LSP) },
      -- p = { name = string.format('%s Plugins', icons.kinds.Package) },
      s = { name = string.format('%s Session', icons.Session) },
      t = { name = string.format('%s Terminal', icons.Terminal) },
      -- u = { name = string.format('%s UI', icons.UI) },
      w = { name = string.format('%s Window', icons.Window) },
      y = { name = string.format('%s Clipboard', icons.Paste) },
    }, {
      mode = { 'n', 'v' },
      prefix = '<leader>',
    })
  end,
}
