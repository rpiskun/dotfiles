-- Basic settings
vim.opt.mouse = ""
vim.o.syntax = "on"
vim.o.encoding = "utf-8"
vim.o.number = true -- Enable line numbers
vim.o.relativenumber = false -- Enable relative line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = true -- Enable line wrapping
vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.scrolloff = 2
vim.o.laststatus = 3
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartindent = true
vim.o.fdm = indent
vim.o.autowrite = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.colorcolumn = '120'
vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case --no-ignore'
vim.g.NERDTreeWinSize = '40'

-- colorscheme
vim.o.background = "dark"
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_bold = 1
vim.cmd 'colorscheme gruvbox-material'

-- listchars
-- vim.opt.listchars = { space = '·', eol = '^', tab = '┊', }
vim.cmd([[
    set lcs+=space:·
    set lcs+=eol:\^
    set lcs+=tab:\┊\ 
    set fillchars+=vert:\▏
    set showbreak=+
]])

-- Ack.vim
vim.g.ackprg = 'rg -uuu --vimgrep --no-heading --smart-case -g "!test" --glob-case-insensitive'
