return {
  "s1n7ax/nvim-window-picker",
  config = function()
    require("window-picker").setup({
      use_winbar = "smart",
      autoselect_one = true,
      include_current = false,
      selection_chars = "ABCDEF",
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal" },
        },
      },
      other_win_hl_color = "#89b4fa",
      fg_color = "#45475a",
    })
  end,
}
