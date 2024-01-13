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

-- yank Prefix
vim.keymap.set({ 'n', 'v' }, '<leader>yo', '"_dP', { desc = 'Paste Over' })
vim.keymap.set({ 'n', 'v' }, '<leader>yp', '"+p', { desc = 'Paste System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yy', '"+y', { desc = 'Yank to System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yd', '"+d', { desc = 'Delete to System' })

-- b Prefix
vim.keymap.set({ 'n' }, '<leader>br', '<cmd>e %<cr>', { desc = 'Reload Buffer' })

-- Buffer related
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { desc = 'Close All Buffers' })

-- terminal mode maps
vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], { noremap = true })
