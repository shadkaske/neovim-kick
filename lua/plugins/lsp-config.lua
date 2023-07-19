return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true
    },

    { 'williamboman/mason-lspconfig.nvim' },

    { "b0o/schemastore.nvim" },

    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {
        window = {
          blend = 0,
        },
      }
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim' },
  },
  config = function ()
    local on_attach = function(_, bufnr)
      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
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
  end
}
