-- show line numbers
vim.o.number = true 

-- vertical splits open on right
vim.o.splitright = true
vim.o.splitbelow = true

-- Show line numbers relative to where the cursor is.
vim.o.relativenumber = true
vim.o.autocomplete = true
--I didn't understand why https://stackoverflow.com/a/2054674 guy suggested expandtab and tabstop but they exist
vim.o.tabstop = 4 
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list = false -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true
