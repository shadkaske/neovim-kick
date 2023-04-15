return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  opts = {
    integrations = {
      cmp = true,
      bufferline = true,
      fidget = true,
      telescope = true,
      treesitter = true,
      noice = true,
      neotree = false,
      mini = true,
      leap = true,
      gitsigns = true,
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
