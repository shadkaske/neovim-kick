local wk = require("which-key")
local util = require("util")

-- Don't Override Leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Save buffer with C-s
vim.keymap.set({ "n", "i" }, "<C-s>", ":w<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Visual Indent Lines
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Center view on jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
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
    l = { name = string.format("%s LSP", icons.LSP) },
    p = { name = string.format("%s Plugins", icons.kinds.Package) },
    s = { name = string.format("%s Session", icons.Session) },
    t = { name = string.format("%s Trouble", icons.Diagnostic) },
    y = { name = string.format("%s Clipboard", icons.Paste) },
  },
  {
    mode = { "n", "v" },
    prefix = "<leader>",
  }
)

-- f Prefix Find Keymaps
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
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
vim.keymap.set({ "n" }, "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Close Buffer" })
vim.keymap.set({ "n" }, "<leader>bD", "<cmd>Bdelete<cr>", { desc = "Force Close Buffer" })
vim.keymap.set({ "n" }, "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set({ "n" }, "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
vim.keymap.set({ "n" }, "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Jump to Buffer" })
vim.keymap.set("n", "<leader>bf", require("telescope.builtin").buffers, { desc = "Buffers" })

-- Buffer related
vim.keymap.set({ "n" }, "<leader>C", "<cmd>Bdelete!<cr>", { desc = "Force Close Buffer" })
vim.keymap.set({ "n" }, "<leader>c", "<cmd>Bdelete!<cr>", { desc = "Close Buffer" })
vim.keymap.set({ "n" }, "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set({ "n" }, "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- g prefix ( git stuff )
vim.keymap.set("n", "<leader>gn", "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<cr>",
  { desc = "Next Hunk" })
vim.keymap.set("n", "<leader>gp", "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<cr>",
  { desc = "Previous Hunk" })
vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "Checkout Branch" })
vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>", { desc = "Status" })

-- l prefix ( Lsp Stuff )
if util.plugin_loaded("nvim-dap") then
  wk.register({ d = { name = string.format("%s Debug", icons.Debugger) } })
  vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Debugger: Start" })
  vim.keymap.set("n", "<F17>", function() require("dap").terminate() end, { desc = "Debugger: Stop" })
  vim.keymap.set("n", "<F29>", function() require("dap").restart_frame() end, { desc = "Debugger: Restart" })
  vim.keymap.set("n", "<F6>", function() require("dap").pause() end, { desc = "Debugger: Pause" })
  vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Debugger: Toggle Breakpoint" })
  vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Debugger: Step Over" })
  vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Debugger: Step Into" })
  vim.keymap.set("n", "<F23>", function() require("dap").step_out() end, { desc = "Debugger: Step Out" })
  vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end,
    { desc = "Toggle Breakpoint (F9)" })
  vim.keymap.set("n", "<leader>dB", function() require("dap").clear_breakpoints() end, { desc = "Clear Breakpoints" })
  vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Start/Continue (F5)" })
  vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into (F11)" })
  vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over (F10)" })
  vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step Out (S-F11)" })
  vim.keymap.set("n", "<leader>dq", function() require("dap").close() end, { desc = "Close Session" })
  vim.keymap.set("n", "<leader>dQ", function() require("dap").terminate() end, { desc = "Terminate Session (S-F5)" })
  vim.keymap.set("n", "<leader>dp", function() require("dap").pause() end, { desc = "Pause (F6)" })
  vim.keymap.set("n", "<leader>dr", function() require("dap").restart_frame() end, { desc = "Restart (C-F5)" })
  vim.keymap.set("n", "<leader>dR", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
  if util.plugin_loaded("nvim-dap-ui") then
    vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle Debugger UI" })
    vim.keymap.set("n", "<leader>dh", function() require("dap.ui.widgets").hover() end, { desc = "Debugger Hover" })
  end
end

-- p prefix (plugin manager)
vim.keymap.set("n", "<leader>pi", function() require("lazy").install() end, { desc = "Plugins Install" })
vim.keymap.set("n", "<leader>ps", function() require("lazy").home() end, { desc = "Plugins Status" })
vim.keymap.set("n", "<leader>pS", function() require("lazy").sync() end, { desc = "Plugins Sync" })
vim.keymap.set("n", "<leader>pu", function() require("lazy").check() end, { desc = "Plugins Check Updates" })
vim.keymap.set("n", "<leader>pU", function() require("lazy").update() end, { desc = "Plugins Update" })
