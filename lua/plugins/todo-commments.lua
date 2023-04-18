return {
  "folke/todo-comments.nvim",
  lazy = true,
  cmd = {
    "TodoTrouble",
    "TodoTelescope",
    "TodoLocList",
    "TodoQuickFix",
  },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>lt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  },
}
