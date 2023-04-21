return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = function()
    local icons = require("util.icons")

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

    return {
      sections = {
        lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 1) end } },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.DiagnosticError,
              warn = icons.DiagnosticWarn,
              info = icons.DiagnosticInfo,
              hint = icons.DiagnosticHint,
            },
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = {
              left = 1,
              right = 0
            }
          },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          -- stylua: ignore
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = fg("Statement")
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { "location", padding = { left = 0, right = 0 } },
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
      }
    }
  end,
}
