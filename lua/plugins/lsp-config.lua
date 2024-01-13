return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true,
    },

    { 'williamboman/mason-lspconfig.nvim' },

    { 'b0o/schemastore.nvim' },

    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {
        window = {
          blend = 0,
        },
      },
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim' },
  },
  config = function()
    local on_attach = function(_, bufnr)
      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    local servers = {
      ansiblels = {},
      bashls = {},
      cssls = {},
      eslint = {},
      html = {},
      jsonls = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      marksman = {},
      intelephense = {},
      pyright = {},
      sqlls = {},
      tailwindcss = {},
      volar = {},
      yamlls = {
        yaml = {
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code Action' })
    vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'Format' })
    vim.keymap.set('n', '<leader>ci', '<cmd>LspInfo<cr>', { desc = 'Info' })
    vim.keymap.set('n', '<leader>cn', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = 'Next Diagnostic' })
    vim.keymap.set('n', '<leader>cp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Prev Diagnostic' })
    vim.keymap.set('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<cr>', { desc = 'CodeLens Action' })
    vim.keymap.set('n', '<leader>cq', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = 'Quickfix' })
    vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
    vim.keymap.set('n', '<leader>cI', '<cmd>Mason<cr>', { desc = 'Mason Info' })
  end,
}
