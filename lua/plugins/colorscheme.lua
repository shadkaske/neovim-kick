return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  opts = {
    integrations = {
      bufferline = true,
      cmp = true,
      fidget = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      leap = true,
      mini = true,
      navic = {
        enabled = true,
      },
      neotree = true,
      noice = true,
      telescope = true,
      treesitter = true,
    },
  }
}
