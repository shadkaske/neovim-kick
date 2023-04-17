return {
  'echasnovski/mini.move',
  version = '*',
  config = function ()
    require('mini.move').setup({
      mappings = {
        -- Visual Selection
        up = '<C-Up>',
        down = '<C-Down>',
        left = '<C-Left>',
        right = '<C-Right>',
        -- Current line in Normal Mode
        line_up = '<C-Up>',
        line_down = '<C-Down>',
        line_left = '<C-Left>',
        line_right = '<C-Right>',
      },
      options = {
        reindent_linewise = true,
      },
    })
  end,
}
