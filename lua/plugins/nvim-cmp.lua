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
            Array = icons.Array,
            Boolean = icons.Boolean,
            Class = icons.Class,
            Constructor = icons.Constructor,
            Key = icons.Key,
            Namespace = icons.Namespace,
            Null = icons.Null,
            Number = icons.Number,
            Object = icons.Object,
            Package = icons.Package,
            Property = icons.Property,
            Reference = icons.Reference,
            Snippet = icons.Snippet,
            String = icons.String,
            TypeParameter = icons.TypeParameter,
            Unit = icons.Unit,
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
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
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
