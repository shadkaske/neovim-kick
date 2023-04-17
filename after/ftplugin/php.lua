vim.cmd("setlocal tabstop=4 shiftwidth=4 expandtab")


local dap = require("dap")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { vim.fn.expand('$HOME/Code/sources/vscode-php-debug/out/phpDebug.js') },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = "9003",
    log = true,
  },
}

