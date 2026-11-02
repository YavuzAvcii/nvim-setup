-- KEYMAPS
-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n', 'i', }, '<C-s>', function() vim.cmd('w') end)
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- LEADER MAPPINGS
vim.keymap.set({ 'n' }, '<Leader>e', '<Cmd>lua MiniFiles.open()<CR>')
vim.keymap.set({ 'n' }, '<Leader>t', '<Cmd>terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>v', '<Cmd>vertical terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>h', '<Cmd>horizontal terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>c', '<Cmd>edit $MYVIMRC<CR>') -- keymap to edit this init.lua file

-- Telescope mappings
vim.keymap.set({ 'n' }, '<Leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set({ 'n' }, '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set({ 'n' }, '<Leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set({ 'n' }, '<Leader>fh', '<Cmd>Telescope help_tags<CR>')

-- TABS CONTROL MAPPINGS
vim.keymap.set({ 'n' }, '<Tab>', '<Cmd>BufferNext<CR>')
vim.keymap.set({ 'n' }, '<A-1>', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set({ 'n' }, '<A-2>', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set({ 'n' }, '<A-3>', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set({ 'n' }, '<A-4>', '<Cmd>BufferGoto 4<CR>')
vim.keymap.set({ 'n' }, '<A-5>', '<Cmd>BufferGoto 5<CR>')
vim.keymap.set({ 'n' }, '<A-6>', '<Cmd>BufferGoto 6<CR>')
vim.keymap.set({ 'n' }, '<A-7>', '<Cmd>BufferGoto 7<CR>')
vim.keymap.set({ 'n' }, '<A-8>', '<Cmd>BufferGoto 8<CR>')
vim.keymap.set({ 'n' }, '<A-9>', '<Cmd>BufferGoto 9<CR>')
vim.keymap.set({ 'n' }, 'tc', '<Cmd>BufferClose<CR>')
vim.keymap.set({ 'n' }, 'tl', '<Cmd>BufferMoveNext<CR>')
vim.keymap.set({ 'n' }, 'th', '<Cmd>BufferMovePrevious<CR>')
