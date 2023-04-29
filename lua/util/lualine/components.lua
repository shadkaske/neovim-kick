-- Custom and overrides for lualine components
local M = {}

function M.lsp_active()
  local buf_clients = vim.lsp.get_active_clients()
  if next(buf_clients) == nil then
    return '---'
  end
  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= 'null-ls' then
      table.insert(buf_client_names, client.name)
    end
  end

  -- add nullls Names
  local nullls_util = require("util.nullls")
  local supported_formatters = nullls_util.list_registered_formatters(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local supported_linters = nullls_util.list_registered_linters(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  local unique_client_names = vim.fn.uniq(buf_client_names)

  local language_servers = '[' .. table.concat(unique_client_names, ', ') .. ']'

  return language_servers
end

function M.progess_icon()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

return M
