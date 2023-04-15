return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    sections = {
      lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 1) end } },
    },
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
  },
}
