return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'php',
      },
    }

    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { os.getenv("HOME") .. "/Code/sources/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug - Local',
        port = '9003',
        log = true,
      },
    }

    vim.fn.sign_define('DapBreakpoint', { text = '󰯯', texthl = 'ErrorMsg', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '󰯲', texthl = 'WarningMsg', linehl = '', numhl = '' })

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '',
          play = '󰐊',
          step_into = '',
          step_over = '',
          step_out = '󰆸',
          step_back = '',
          run_last = '󰐊󰐊',
          terminate = '',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
