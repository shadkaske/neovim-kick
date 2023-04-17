return {
  "windwp/nvim-spectre",
  -- stylua: ignore
  keys = {
    { "<leader>fR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
}
