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
      neotree = true,
      noice = true,
      telescope = true,
      treesitter = true,
    },
  }
}

-- { -- Theme inspired by Atom
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "onedark"
--   end,
-- },
