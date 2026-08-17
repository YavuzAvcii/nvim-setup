-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
-- OPTIONS
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.

-- global settings that makes vertical splits open on right and horizontals open below
vim.o.splitright = true
vim.o.splitbelow = true

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true
vim.o.autocomplete = true
--I didn't understand why https://stackoverflow.com/a/2054674 guy suggested expandtab and tabstop but they exist
vim.o.tabstop = 4 
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 5 -- Keep this many screen lines above/below the cursor.
vim.o.list = false -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

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
--TODO: lack of tab movement still

-- LEADER MAPPINGS
vim.keymap.set({ 'n' }, '<Leader>e', '<Cmd>Lexplore<CR>')
vim.keymap.set({ 'n' }, '<Leader>t', '<Cmd>terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>v', '<Cmd>vertical terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>h', '<Cmd>horizontal terminal<CR>')
vim.keymap.set({ 'n' }, '<Leader>c', '<Cmd>edit $MYVIMRC<CR>') -- keymap to edit this init.lua file

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

-- GO MAPPINGS
vim.keymap.set({ 'n' }, 'gf', '<Cmd>FzfLua files<CR>') --File search

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
  -- Fuzzy picker
  'https://github.com/ibhagwan/fzf-lua',
  -- Autocompletion
  'https://github.com/nvim-mini/mini.completion',
  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',
  -- Theme
  "https://github.com/ellisonleao/gruvbox.nvim",
  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',
  -- Mason
  "https://github.com/mason-org/mason.nvim.git",
  -- Mini icons
  "https://github.com/nvim-mini/mini.icons.git",
  -- Mini tabline
 -- "https://github.com/nvim-mini/mini.tabline.git",
  -- Mini status line
  "https://github.com/nvim-mini/mini.statusline.git",
  -- Lualine
  "https://github.com/nvim-lualine/lualine.nvim.git",
  -- Barbar Tabs
  "https://github.com/romgrk/barbar.nvim.git",
  -- Nvim-web-devicons
  "https://github.com/nvim-tree/nvim-web-devicons.git",
  -- GLSL Language server
  "https://github.com/stykhomyrov/vim-glsl.git",
})

-- LSP settings
vim.lsp.enable('clangd')
vim.lsp.enable('lua-language-server')

require('fzf-lua').setup { fzf_colors = true }
require('mini.completion').setup {}
require('mini.icons').setup {}
-- require('mini.tabline').setup {}
-- require('mini.statusline').setup {}
MiniIcons.tweak_lsp_kind()
require('quicker').setup {}
require('gitsigns').setup {}
require('mason').setup {}
require("gruvbox").setup {}
require('lualine').setup {}

vim.cmd.colorscheme("gruvbox")
