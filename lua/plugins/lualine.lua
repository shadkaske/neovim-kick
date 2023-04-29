return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = function()
    local icons = require 'util.icons'

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format('#%06x', hl.foreground) }
      end
    end

    local function lsp_active()
      local buf_clients = vim.lsp.get_active_clients()
      if next(buf_clients) == nil then
        return 'LSP Inactive'
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

    return {
      sections = {
        lualine_a = { {
          'mode',
          fmt = function(res)
            return res:sub(1, 1)
          end,
        } },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = icons.DiagnosticError,
              warn = icons.DiagnosticWarn,
              info = icons.DiagnosticInfo,
              hint = icons.DiagnosticHint,
            },
          },
          {
            'filetype',
            icon_only = true,
            separator = '',
            padding = {
              left = 1,
              right = 0,
            },
          },
          { 'filename', path = 1, symbols = { modified = '  ', readonly = '', unnamed = '' } },
          -- stylua: ignore
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          },
        },
        lualine_x = {
          -- stylua: ignore
          {
            lsp_active,
            color = fg("Statement"),
            cond = require("util.lualine.condition").hide_in_width,
          },
          {
            'diff',
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { 'location', padding = { left = 0, right = 0 } },
        },
      },
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      extensions = {
        'fugitive',
        'neo-tree',
        'lazy',
        'nvim-dap-ui',
        'quickfix',
      },
    }
  end,
}
