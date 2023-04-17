return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup()

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

    local tinker = Terminal:new({
      cmd = "php artisan tinker",
      dir = "git_dir",
      direction = "horizontal",
      size = 50,
      hidden = true
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _tinker_toggle()
      tinker:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<cr>", {
      noremap = true,
      silent = true,
      desc = "LazyGit",
    })

    vim.api.nvim_set_keymap("n", "<leader>ua", "<cmd>lua _tinker_toggle()<cr>", {
      noremap = true,
      silent = true,
      desc = "Tinker",
    })
  end
}
