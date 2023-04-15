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
vim.keymap.set({"n", "v" }, "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", { desc = "NeoTree Toggle" })

-- Lsp Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)

-- Which key labels
wk.register(
  {
    y = { name = " 󰨸 Clipboard" },
    b = { name = "  Buffers"},
    g = { name = "  Git"},
  },
  {
    mode = { "n", "v" },
    prefix = "<leader>",
  }
)

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
-- ["<leader>gn"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk", },
-- ["<leader>gp"] = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Previous Hunk", },
