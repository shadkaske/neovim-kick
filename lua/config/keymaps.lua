local util = require 'util'

-- Don't Override Leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Insert Mode Shortcuts
vim.keymap.set('i', '<A-e>', '<C-o>$', { silent = true })
vim.keymap.set('i', '<A-;>', '<C-o>A;<ESC>', { silent = true })
vim.keymap.set('i', '<A-,>', '<C-o>A,<ESC>', { silent = true })
vim.keymap.set('n', '<A-;>', 'A;<ESC>', { silent = true })
vim.keymap.set('n', '<A-,>', 'A,<ESC>', { silent = true })

-- Save buffer with C-s
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Turn off search highlight
vim.keymap.set(
  'n',
  '<leader>.',
  [[ (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" <BAR> redraw<CR>]],
  { desc = 'Toggle Highlight Search', silent = true, expr = true }
)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Visual Indent Lines
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Window close shortcut
vim.keymap.set('n', '<leader>q', '<C-w>q', { desc = 'Close Window' })

-- Center view on jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Insert Lines in Normal Mode
vim.keymap.set('n', '[o', 'O<ESC>')
vim.keymap.set('n', ']o', 'o<ESC>')

-- Lsp Keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code Action' })
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'Format' })
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = 'Info' })
vim.keymap.set('n', '<leader>lI', '<cmd>Mason<cr>', { desc = 'Mason Info' })
vim.keymap.set('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<leader>lp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Prev Diagnostic' })
vim.keymap.set('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', { desc = 'CodeLens Action' })
vim.keymap.set('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = 'Quickfix' })
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })

-- Window Shortcuts
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equally high and wide' })
vim.keymap.set('n', '<leader>w_', '<C-w>_', { desc = 'Max out the height' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close all other windows' })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Quit a window' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split window' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Switch windows' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Swap current with next' })
vim.keymap.set('n', '<leader>w|', '<C-w>|', { desc = 'Max out the width' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>Q', '<cmd>qa!<cr>', { desc = 'Force Quit' })

-- t prefix ( terminal )
vim.keymap.set('n', '<leader>ta', function()
  require('util').toggle_tinker()
end, { desc = 'Tinker' })
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Terminal' })
vim.keymap.set('n', '<leader>ty', function()
  require('util').toggle_yarn_watch()
end, { desc = 'Yarn Watch' })
vim.keymap.set('n', '<leader>td', function()
  require('util').toggle_yarn_dev()
end, { desc = 'Yarn Run Dev' })

-- yank Prefix
vim.keymap.set({ 'n', 'v' }, '<leader>yo', '"_dP', { desc = 'Paste Over' })
vim.keymap.set({ 'n', 'v' }, '<leader>yp', '"+p', { desc = 'Paste System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yy', '"+y', { desc = 'Yank to System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yd', '"+d', { desc = 'Delete to System' })

-- b Prefix
vim.keymap.set({ 'n' }, '<leader>bd', '<cmd>Bdelete<cr>', { desc = 'Close Buffer' })
vim.keymap.set({ 'n' }, '<leader>bD', '<cmd>Bdelete<cr>', { desc = 'Force Close Buffer' })
vim.keymap.set({ 'n' }, '<leader>br', '<cmd>e %<cr>', { desc = 'Reload Buffer' })
vim.keymap.set({ 'n' }, '<leader>bn', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set({ 'n' }, '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous Buffer' })
vim.keymap.set({ 'n' }, '<leader>bj', '<cmd>BufferLinePick<cr>', { desc = 'Jump to Buffer' })
vim.keymap.set({ 'n' }, '<leader>b1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Go To Buffer 1' })
vim.keymap.set({ 'n' }, '<leader>b2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Go To Buffer 2' })
vim.keymap.set({ 'n' }, '<leader>b3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Go To Buffer 3' })
vim.keymap.set({ 'n' }, '<leader>b4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Go To Buffer 4' })
vim.keymap.set({ 'n' }, '<leader>b5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Go To Buffer 5' })
vim.keymap.set({ 'n' }, '<leader>b6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Go To Buffer 6' })
vim.keymap.set({ 'n' }, '<leader>b7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Go To Buffer 7' })
vim.keymap.set({ 'n' }, '<leader>b8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Go To Buffer 8' })
vim.keymap.set({ 'n' }, '<leader>b9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Go To Buffer 9' })
vim.keymap.set({ 'n' }, '<leader>b0', '<cmd>BufferLineGoToBuffer 0<cr>', { desc = 'Go To Buffer 0' })

-- Buffer related
vim.keymap.set({ 'n' }, '<leader>c', '<cmd>Bdelete!<cr>', { desc = 'Close Buffer' })
vim.keymap.set({ 'n' }, 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
vim.keymap.set({ 'n' }, 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { desc = 'Close All Buffers' })

-- g prefix ( git stuff )
-- vim.keymap.set('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>', { desc = 'Checkout commit(for current file)' })
vim.keymap.set('n', '<leader>gc', '<cmd>G commit<cr>', { desc = 'Git Commit' })
vim.keymap.set('n', '<leader>gP', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = 'Preview Hunk' })
vim.keymap.set('n', '<leader>gR', "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = 'Reset Buffer' })
-- vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Checkout Branch' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis HEAD<cr>', { desc = 'Git Diff' })
vim.keymap.set('n', '<leader>gg', '<cmd>G<cr>', { desc = 'Fugitive Status' })
vim.keymap.set('n', '<leader>gl', function()
  require('util').toggle_lazygit()
end, { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>gn', "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<cr>", { desc = 'Next Hunk' })
-- vim.keymap.set('n', '<leader>go', '<cmd>Telescope git_status<cr>', { desc = 'Open changed file' })
vim.keymap.set('n', '<leader>gp', "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<cr>", { desc = 'Previous Hunk' })
vim.keymap.set('n', '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = 'Reset Hunk' })
vim.keymap.set('n', '<leader>gs', '<cmd>G<cr>', { desc = 'Status' })
vim.keymap.set('n', '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = 'Stage Hunk' })
vim.keymap.set('n', '<leader>gu', "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = 'Undo Stage Hunk' })

-- d prefix ( Debug Stuff )
if util.plugin_loaded 'nvim-dap' then
  vim.keymap.set('n', '<F5>', function()
    require('dap').continue()
  end, { desc = 'Debugger: Start' })
  vim.keymap.set('n', '<F17>', function()
    require('dap').terminate()
  end, { desc = 'Debugger: Stop' })
  vim.keymap.set('n', '<F29>', function()
    require('dap').restart_frame()
  end, { desc = 'Debugger: Restart' })
  vim.keymap.set('n', '<F6>', function()
    require('dap').pause()
  end, { desc = 'Debugger: Pause' })
  vim.keymap.set('n', '<F9>', function()
    require('dap').toggle_breakpoint()
  end, { desc = 'Debugger: Toggle Breakpoint' })
  vim.keymap.set('n', '<F10>', function()
    require('dap').step_over()
  end, { desc = 'Debugger: Step Over' })
  vim.keymap.set('n', '<F11>', function()
    require('dap').step_into()
  end, { desc = 'Debugger: Step Into' })
  vim.keymap.set('n', '<F23>', function()
    require('dap').step_out()
  end, { desc = 'Debugger: Step Out' })
  vim.keymap.set('n', '<leader>db', function()
    require('dap').toggle_breakpoint()
  end, { desc = 'Toggle Breakpoint (F9)' })
  vim.keymap.set('n', '<leader>dB', function()
    require('dap').clear_breakpoints()
  end, { desc = 'Clear Breakpoints' })
  vim.keymap.set('n', '<leader>dc', function()
    require('dap').continue()
  end, { desc = 'Start/Continue (F5)' })
  vim.keymap.set('n', '<leader>di', function()
    require('dap').step_into()
  end, { desc = 'Step Into (F11)' })
  vim.keymap.set('n', '<leader>do', function()
    require('dap').step_over()
  end, { desc = 'Step Over (F10)' })
  vim.keymap.set('n', '<leader>dO', function()
    require('dap').step_out()
  end, { desc = 'Step Out (S-F11)' })
  vim.keymap.set('n', '<leader>dq', function()
    require('dap').close()
  end, { desc = 'Close Session' })
  vim.keymap.set('n', '<leader>dQ', function()
    require('dap').terminate()
  end, { desc = 'Terminate Session (S-F5)' })
  vim.keymap.set('n', '<leader>dp', function()
    require('dap').pause()
  end, { desc = 'Pause (F6)' })
  vim.keymap.set('n', '<leader>dr', function()
    require('dap').restart_frame()
  end, { desc = 'Restart (C-F5)' })
  vim.keymap.set('n', '<leader>dR', function()
    require('dap').repl.toggle()
  end, { desc = 'Toggle REPL' })
  if util.plugin_loaded 'nvim-dap-ui' then
    vim.keymap.set('n', '<leader>du', function()
      require('dapui').toggle()
    end, { desc = 'Toggle Debugger UI' })
    vim.keymap.set('n', '<leader>dh', function()
      require('dap.ui.widgets').hover()
    end, { desc = 'Debugger Hover' })
  end
  vim.keymap.set('n', '<leader>dx', ':!sudo phpenmod xdebug<cr>', { desc = 'Enable Xdebug' })
  vim.keymap.set('n', '<leader>dX', ':!sudo phpdismod xdebug<cr>', { desc = 'Disable Xdebug' })
end

-- p prefix (plugin manager)
vim.keymap.set('n', '<leader>pS', function()
  require('lazy').sync()
end, { desc = 'Plugins Sync' })
vim.keymap.set('n', '<leader>pU', function()
  require('lazy').update()
end, { desc = 'Plugins Update' })
vim.keymap.set('n', '<leader>pc', function()
  require('lazy').clean()
end, { desc = 'Plugins Clean' })
vim.keymap.set('n', '<leader>pi', function()
  require('lazy').install()
end, { desc = 'Plugins Install' })
vim.keymap.set('n', '<leader>ps', function()
  require('lazy').home()
end, { desc = 'Plugins Status' })
vim.keymap.set('n', '<leader>pu', function()
  require('lazy').check()
end, { desc = 'Plugins Check Updates' })

-- u prefix ( ui toggles )
vim.keymap.set(
  'n',
  '<leader>uh',
  [[ (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" <BAR> redraw<CR>]],
  { desc = 'Toggle Highlight Search', silent = true, expr = true }
)
vim.keymap.set('n', '<leader>ut', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })

-- terminal mode maps
vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], { noremap = true })
