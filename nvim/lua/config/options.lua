vim.cmd("let g:newrw_liststyle = 3")
local opt = vim.opt

-- Number
opt.relativenumber = true   -- Enable relative number
opt.number = true
opt.cursorline = true
-- vim.wo.signcolumn = 'yes:2'
-- vim.o.statuscolumn = "  %s%=%{v:relnum?v:relnum:v:lnum}   "
vim.wo.numberwidth = 6

-- Terminal colors
opt.termguicolors = true
vim.g.t_Co = 256

-- Tabs and indentation
opt.tabstop = 4         -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 4      -- Number of spaces for each indentation level
opt.expandtab = true    -- Convert tabs to spaces
opt.autoindent = true   -- copy indent from current line when starting new one
opt.smartindent = true

-- search settings
opt.ignorecase = true   -- ignore case when searching
opt.smartcase = true    -- if you include mixed case in your search, assumes you want case-sensitive

-- backspace
opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true   -- split vertical window to the right
opt.splitbelow = true   -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
