return {
  "akinsho/toggleterm.nvim",
  lazy = true,
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  opt = {},
  keys = {
    { "<leader>gl", function () require("util").toggle_lazygit() end, desc = "LazyGit" },
    { "<leader>ta", function () require("util").toggle_tinker() end, desc = "Tinker" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
  }
}
