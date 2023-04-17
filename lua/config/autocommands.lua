-- Autocommands here
-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Automagically Trim Whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]] })

-- Turn of diagnostics for .env files
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { ".env" },
  command = [[lua vim.diagnostic.disable()]],
})

-- Set Btxml Files to xml filetype
vim.api.nvim_create_autocmd(
  { "BufWritePre", "BufNewFile" },
  { pattern = { "*.btxml" }, command = [[set filetype=xml]],
})
