" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.data/nvim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kyazdani42/nvim-web-devicons'

" Initialize plugin system
call plug#end()
set encoding=utf-8
" let mapleader = ','
nnoremap <SPACE> <Nop>
let mapleader = " "
set scrolloff=0
source ~/.data/nvim/autoload/cscope_maps.vim
set termguicolors
" set t_ut=
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
" if exists('+termguicolors')
" 	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" 	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" let ayucolor="light"
" let ayucolor="mirage"
" let ayucolor="dark"
" colorscheme ayu

if &diff
	colorscheme gruvbox
endif

" Keys mapping
map <C-n> :NERDTreeToggle $HOME<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-h> :call WinMove('h')<CR>
map <C-l> :call WinMove('l')<CR>
noremap <F9> :tabs<CR>:tabn<Space>
nnoremap <Leader>d :NERDTreeFind<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F5> :set list!<CR>
nnoremap <F2> :noh<CR>
" nnoremap / /\v
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <Leader>bo :%bd\|e#\|bd#<CR>
nnoremap <Leader>gg :grep<Space>
nnoremap <Leader>gl :lgrep<Space>
nnoremap <Leader>qq :copen<CR>
nnoremap <Leader>ql :lopen<CR>
nnoremap <silent> [f :cprev<CR>
nnoremap <silent> ]f :cnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
command! BufOnly silent! execute "%bd|e#|bd#"
" autocmd BufWritePre * :call TrimWhitespace()

" Sets
syntax on
set number
set cursorline
" Use spaces for indentation === START ===
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Use spaces for indentation === END ===

" Use tabs for indentation === START ===
" set noexpandtab
" set copyindent
" set preserveindent
" set softtabstop=0
" set shiftwidth=0
" set tabstop=8
" Use tabs for indentation  === END ===

set lcs+=space:·
set lcs+=eol:\^
" set lcs+=tab:>-
set lcs+=tab:\┊\ 
set fillchars+=vert:\▏
hi SpecialKey ctermfg=grey guifg=grey20
set nolist
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
set hlsearch
set incsearch
set smartindent
" set fdm=syntax
set fdm=manual
set nofoldenable
if &term == "screen"
	set t_Co=256
endif
set autowrite
set noconfirm
set hidden
set ignorecase
set smartcase
set directory^=$HOME/.vim/tmp//
set noswapfile
set wrap
set showbreak=+
" let &colorcolumn="80,120".join(range(241,360),",")
set colorcolumn=120
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
let g:indentLine_leadingSpaceChar='·'
" match ErrorMsg '\(^ \+\|^\t\+ \+$\|^\t\+ \+\t\+\)'

function! LoadCscope()
  set nocscopeverbose
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    " set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    " set cscopeverbose
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_section_b = 'BN: %{bufnr("%")}'
let g:airline#extensions#branch#format = 2
let g:airline#extensions#branch#displayed_head_limit = 12
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

function! CustomLineNumber()
   return join([line('.'), line('$')], '/')
endfunction

function! AirlineInit()
    call airline#parts#define('linenr', {'function': 'CustomLineNumber', 'accents': 'bold'})
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create_left(['branch'])
    let g:airline_section_c = airline#section#create(['%t'])
    let g:airline_section_x = airline#section#create(['tagbar'])
    let g:airline_section_y = ''
    let g:airline_section_z = airline#section#create_right(['linenr'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
let g:airline_extensions = ['branch', 'fugitiveline', 'keymap', 'netrw', 'quickfix', 'tabline', 'tagbar', 'term']

let g:NERDTreeWinSize=40

" YouCompleteMe
nmap <F3> <plug>(YCMHover)
let g:ycm_auto_hover=''
let g:ycm_show_diagnostics_ui=0
" Disable preview buffer
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

command! TrimWhitespace call TrimWhitespace()
command! ReplaceDosNewline call ReplaceDosNewline()

" Buffergator
let g:buffergator_viewport_split_policy="B"
let g:buffergator_suppress_keymaps=1
nnoremap <Leader>bb :BuffergatorOpen<CR>
nnoremap <Leader>bc :BuffergatorClose<CR>
nnoremap <Leader>btt :BuffergatorTabsOpen<CR>
nnoremap <Leader>btc :BuffergatorTabsClose<CR>

" Ack.vim"
let g:ackprg = 'rg --vimgrep --no-heading --smart-case '
cnoreabbrev Ack Ack!
" Ack.vim keymapping
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>wa :Ack! <C-R>=expand("<cword>")<CR><CR>

" fzf.vim
let g:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" Rg with fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" fzf.vim keymapping
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>r :Tags<CR>
nnoremap <Leader>q :RG<CR>
nnoremap <Leader>wq :RG <C-R><C-W><CR>
nnoremap <Leader>x :cclose<CR>
nnoremap <Leader>z :Ag<Space>
nnoremap <Leader>wz :Ag <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>bl :Lines<Space><CR>
nnoremap <Leader>l :BLines<Space><CR>
nnoremap <Leader>wl :BLines <C-R>=expand("<cword>")<CR><CR>

" coc.nvim
nnoremap <leader>c :CocSearch<Space>
nnoremap <leader>wc :CocSearch <C-R>=expand("<cword>")<CR> -g *.[ch]<CR>
" nnoremap <leader>wc :CocSearch <C-R>=expand("<cword>")<CR><CR>

" telescope config start
" nvim-style
" nnoremap <leader>ff :Telescope find_files<cr>
" nnoremap <leader>fg :Telescope live_grep<cr>
" nnoremap <leader>fb :Telescope buffers<cr>
" nnoremap <leader>fh :Telescope help_tags<cr>
" nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>
" nnoremap <leader>fF :execute 'Telescope find_files default_text=' . expand('<cword>')<cr>
" nnoremap <leader>fG :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>

" lua-style
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-_> <cmd>lua require('mytelescope').curr_buf()<cr>

" nvim-style
nnoremap <leader>fG :execute 'Telescope grep_string sorting_strategy=ascending search=' . expand('<cword>')<cr>
nnoremap <leader>fl :Telescope live_grep grep_open_files=true sorting_strategy=ascending<cr>
" telescope config end

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! TrimWhitespace()
    let l:save = winsaveview()
    " trailing whitespaces
    silent! keeppatterns %s/\s\+$//e
    " one whitespace at the beginning of the line before tab
    silent! keeppatterns %s/^ \t/\t
    call winrestview(l:save)
endfunction

function! ReplaceDosNewline()
    silent! :%s/$//g
endfunction

lua require('init')
