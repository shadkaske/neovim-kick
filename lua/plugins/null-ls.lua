return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function ()
    local formatting = require("null-ls").builtins.formatting
    -- Can use this if you need diagnostics
    -- local diagnostics = require("null-ls").builtins.diagnostics

    require("null-ls").setup({
      debug = false,
      sources = {
        formatting.prettier,
        formatting.stylua,
        formatting.blade_formatter,
        formatting.xmlformat,
        formatting.sql_formatter,
        formatting.shfmt,
      }
    })
  end
}
