vim.api.nvim_create_autocmd(
  { "BufWritePre", "BufNewFile" },
  { pattern = { "*.btxml" }, command = [[set filetype=xml]],
})
