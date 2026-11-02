vim.g.mapleader = ' '

options = require('options')

-- Sync clipboard between OS and Neovim. 
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

keybindings = require('keybindings')

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
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Mason
  "https://github.com/mason-org/mason.nvim.git",
  -- Quickstart configs for LSP
  "https://github.com/neovim/nvim-lspconfig",
  -- Everything from mini
  "https://github.com/nvim-mini/mini.nvim",
  -- Enhanced quickfix/loclist
  "https://github.com/stevearc/quicker.nvim",
  -- Theme
  "https://github.com/ellisonleao/gruvbox.nvim",
  -- Git integration
  "https://github.com/lewis6991/gitsigns.nvim",
  -- Lualine
  "https://github.com/nvim-lualine/lualine.nvim.git",
  -- Barbar Tabs
  "https://github.com/romgrk/barbar.nvim.git",
  -- Nvim-web-devicons
  "https://github.com/nvim-tree/nvim-web-devicons.git",
  -- GLSL Language server
  "https://github.com/stykhomyrov/vim-glsl.git",
  -- Markdown preview
  "https://github.com/OXY2DEV/markview.nvim.git", 
  -- Plenary for telescope
  "https://github.com/nvim-lua/plenary.nvim.git",
  -- Telescope
  "https://github.com/nvim-telescope/telescope.nvim.git",
  -- Show images
  "https://github.com/3rd/image.nvim.git",
})

-- LSP settings
vim.lsp.enable('clangd')
vim.lsp.enable('lua-language-server')
vim.lsp.enable('cmake-language-server')

require('mason').setup {}
require('mini.completion').setup {}
require('mini.icons').setup {}
require('mini.files').setup {}
require('quicker').setup {}
require("gruvbox").setup {}
require('lualine').setup {}
require('image').setup {}
require('telescope').setup {}

vim.cmd.colorscheme("gruvbox")
