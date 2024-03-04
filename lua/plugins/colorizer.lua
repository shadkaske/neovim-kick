return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  cmd = {
    "ColorizerAttachToBuffer",
    "ColorizerDetachFromBuffer",
    "ColorizerReloadAllBuffers",
    "ColorizerToggle",
  },
  keys = {
    { '<leader>bc', '<mcd>ColorizerToggle<cr>', desc = 'ColorizerToggle' },
  },
}
