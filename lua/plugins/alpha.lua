return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require 'alpha.themes.dashboard'

      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#61afef' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#89ca78', bg = '#61afef' })
      vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#89ca78' })

      dashboard.section.header.val = {
        [[     █  █     ]],
        [[     ██ ██     ]],
        [[     █████     ]],
        [[     ██ ███     ]],
        [[     █  █     ]],
        [[]],
        [[N  E  O   V  I  M]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
        dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('n', ' ' .. ' New file', ':enew <CR>'),
        dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
        dashboard.button('s', ' ' .. ' Restore Session', [[:lua require("persistence").load() <cr>]]),
        dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
      }

      -- dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.header.opts.hl = {
        { { 'NeovimDashboardLogo1', 6, 8 }, { 'NeovimDashboardLogo3', 9, 22 } },
        { { 'NeovimDashboardLogo1', 6, 8 }, { 'NeovimDashboardLogo2', 9, 11 }, { 'NeovimDashboardLogo3', 12, 24 } },
        { { 'NeovimDashboardLogo1', 6, 11 }, { 'NeovimDashboardLogo3', 12, 26 } },
        { { 'NeovimDashboardLogo1', 6, 11 }, { 'NeovimDashboardLogo3', 12, 24 } },
        { { 'NeovimDashboardLogo1', 6, 11 }, { 'NeovimDashboardLogo3', 12, 22 } },
      }
      dashboard.opts.layout[1].val = 6
      return dashboard
    end,
    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)
      vim.api.nvim_create_autocmd('User', {
        callback = function()
          local stats = require('lazy').stats()
          local ms = math.floor(stats.startuptime * 100) / 100
          dashboard.section.footer.val = '󱐌 Lazy-loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
