return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  cmd = {
    "NeoTreeFocusToggle"
  },
}
