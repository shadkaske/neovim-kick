-- Utility functions to use in multiple places
local M = {}

function M.plugin_loaded(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

function M.toggle_lazygit()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    hidden = true
  })

  lazygit:toggle()
end

function M.toggle_tinker()
  local Terminal = require("toggleterm.terminal").Terminal
  local tinker = Terminal:new({
    cmd = "php artisan tinker",
    dir = "git_dir",
    direction = "horizontal",
    size = 50,
    hidden = true
  })

  tinker:toggle()
end

function M.toggle_yarn_watch()
  local Terminal = require("toggleterm.terminal").Terminal
  local watch = Terminal:new({
    cmd = "yarn run watch",
    dir = "git_dir",
    direction = "horizontal",
    size = 50,
    hidden = true
  })

  watch:toggle()
end

function M.toggle_yarn_dev()
  local Terminal = require("toggleterm.terminal").Terminal
  local watch = Terminal:new({
    cmd = "yarn run dev",
    dir = "git_dir",
    direction = "horizontal",
    size = 50,
    hidden = true
  })

  watch:toggle()
end

return M
