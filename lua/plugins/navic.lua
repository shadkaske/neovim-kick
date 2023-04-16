return {
  "SmiteshP/nvim-navic",
  init = function()
    vim.g.navic_silence = true
    require("util").on_attach(function(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer)
      end
    end)
  end,
  opts = function ()
    local icons = require "util.icons"
    return {
      separator = string.format(" %s ", icons.DoubleChevronRight),
      highlight = true,
      depth_limit = 4,
      depth_limit_indicator = icons.Ellipsis,
      icons = icons.kinds,
    }
  end
}
