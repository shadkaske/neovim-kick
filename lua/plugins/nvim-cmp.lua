return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    {
      'L3MON4D3/LuaSnip',
      event = "BufReadPre",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "onsails/lspkind.nvim",
      opts = function()
        local icons = require("util.icons")
        return {
          mode = "symbol",
          symbol_map = {
            Array = icons.kinds.Array,
            Boolean = icons.kinds.Boolean,
            Class = icons.kinds.Class,
            Constructor = icons.kinds.Constructor,
            Key = icons.kinds.Key,
            Namespace = icons.kinds.Namespace,
            Null = icons.kinds.Null,
            Number = icons.kinds.Number,
            Object = icons.kinds.Object,
            Package = icons.kinds.Package,
            Property = icons.kinds.Property,
            Reference = icons.kinds.Reference,
            Snippet = icons.kinds.Snippet,
            String = icons.kinds.String,
            TypeParameter = icons.kinds.TypeParameter,
            Unit = icons.kinds.Unit,
          },
        }
      end,
      enabled = vim.g.icons_enabled,
      config = function(_, opts)
        require("lspkind").init(opts)
      end
    },
    'saadparwaiz1/cmp_luasnip'
  },
  opts = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.config.setup {}

    require("luasnip.loaders.from_vscode").lazy_load()
    local lspkind = require("lspkind")

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 40,
          ellipsis_char = '',
          before = function (entry, vim_item)
            return vim_item
          end
        })
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  end
}
