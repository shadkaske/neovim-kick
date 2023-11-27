return {
  -- "navarasu/onedark.nvim"
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
      mason = true,
      mini = true,
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      nvimtree = true,
      noice = true,
      notify = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      lsp_trouble = true,
      window_picker = true,
      which_key = true,
    },
  }
}
