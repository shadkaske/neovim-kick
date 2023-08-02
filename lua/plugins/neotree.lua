return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    }
  },
  cmd = {
    "Neotree",
  },
}
