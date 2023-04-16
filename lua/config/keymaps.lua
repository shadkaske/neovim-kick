local wk = require("which-key")

-- Don't Override Leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Visual Indent Lines
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Center view on jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Insert Lines in Normal Mode
vim.keymap.set("n", "[o", "O<ESC>")
vim.keymap.set("n", "]o", "o<ESC>")

-- Append semi colon
vim.keymap.set("n", ";;", "A;<ESC>")

-- Toggle NeoTree
vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", { desc = "NeoTree Toggle" })

-- Lsp Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)

-- Navigator Keymaps
vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({ 'n', 't' }, '<C-p>', '<CMD>NavigatorPrevious<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- Which key labels
local icons = require("util.icons")

wk.register(
  {
    b = { name = string.format("%s Buffers", icons.Buffers) },
    f = { name = string.format("%s Find", icons.Search) },
    g = { name = string.format("%s Git", icons.Git) },
    s = { name = string.format("%s Session", icons.Session) },
    y = { name = string.format("%s Clipboard", icons.Paste) },
  },
  {
    mode = { "n", "v" },
    prefix = "<leader>",
  }
)

-- f Prefix Find Keymaps
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "Current Word" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fi", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "In Current Buffer" })

-- y Prefix
vim.keymap.set({ "n", "v" }, "<leader>yo", '"_dP', { desc = "Paste Over" })
vim.keymap.set({ "n", "v" }, "<leader>yp", '"+p', { desc = "Paste System" })
vim.keymap.set({ "n", "v" }, "<leader>yy", '"+y', { desc = "Yank to System" })
vim.keymap.set({ "n", "v" }, "<leader>yd", '"+d', { desc = "Delete to System" })

-- b Prefix
-- Close Buffer
-- vim.keymap.set({ "n", "v" }, "<leader>bd", '"_dP', { desc = "Paste Over" })
-- Force Delete buffer
-- vim.keymap.set({ "n", "v" }, "<leader>bD", '"+p', { desc = "Paste System" })
-- vim.keymap.set({ "n", "v" }, "<leader>by", '"+y', { desc = "Yank to System" })
-- vim.keymap.set({ "n", "v" }, "<leader>bd", '"+d', { desc = "Delete to System" })

-- g prefix ( git stuff )
vim.keymap.set("n", "<leader>gn", "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<cr>",
{ desc = "Next Hunk" })
vim.keymap.set("n", "<leader>gp", "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<cr>",
{ desc = "Previous Hunk" })
