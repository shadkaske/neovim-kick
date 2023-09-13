return {
  'echasnovski/mini.move',
  version = '*',
  config = function ()
    require('mini.move').setup({
      mappings = {
        -- Visual Selection
        up = '<C-S-k>',
        down = '<C-S-j>',
        left = '<C-S-h>',
        right = '<C-S-l>',
      },
      options = {
        reindent_linewise = true,
      },
    })
  end,
}
