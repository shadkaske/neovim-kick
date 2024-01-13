return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "rcarriga/nvim-notify",
      opts = {
        render = "compact",
        stages = "fade",
        timeout = 1500,
      },
    },
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- cmdline = {
    --   enabled = true,
    --   view = 'cmdline',
    --   opts = {},
    -- },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
  init = function() vim.g.lsp_handlers_enabled = false end,
}
