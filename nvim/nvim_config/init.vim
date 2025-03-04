" Specify a dgrectory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin(stdpath('data') . '/plugged')

" Plug 'scrooloose/nerdtree'
" Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'
" Plug 'ayu-theme/ayu-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ycm-core/YouCompleteMe'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/vim-easy-align'
" Plug 'Yggdroot/indentLine'
" Plug 'airblade/vim-gitgutter'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'preservim/nerdcommenter'
" Plug 'junegunn/fzf', { 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'preservim/tagbar'
" Plug 'rust-lang/rust.vim'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Initialize plugin system
" call plug#end()

" to make shell works in msys2 environment. Windows cmd.exe is used
set shell=cmd.exe noshellslash shellquote&vim shellxquote&vim

set encoding=utf-8
" let mapleader = ','
nnoremap <SPACE> <Nop>
let mapleader = " "
set scrolloff=2
set laststatus=3
" source ~/.data/nvim/autoload/cscope_maps.vim
source ~/.local/share/nvim-data/site/autoload/cscope_maps.vim
set termguicolors
" set t_ut=
set background=dark
" This configuration option should be placed before 'colorscheme gruvbox-material'
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_disable_italic_comment=1
" let g:gruvbox_material_enable_bold=1
" colorscheme gruvbox-material
packadd cfilter

" colorscheme rose-pine
" let g:gruvbox_contrast_dark = 'hard'
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
nnoremap <Leader><space> :b#<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :set wrap!<CR>
nnoremap <F5> :set list!<CR>
nnoremap <F2> :noh<CR>
" nnoremap / /\v
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" nnoremap yy "+yy
" nnoremap yw "+yw
" nnoremap yiw "+yiw
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
" nnoremap <Leader>bo :%bd\|e#\|bd#<CR>
nnoremap <Leader>x :cclose<CR>
nnoremap <Leader>gg :grep<Space>
nnoremap <Leader>gl :lgrep<Space>
nnoremap <Leader>qq :copen<CR>
nnoremap <Leader>ql :lopen<CR>
nnoremap <silent> [f :cprev<CR>
nnoremap <silent> ]f :cnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
command! BufOnly silent! execute "%bd|e#|bd#|normal! \<c-o>"
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
" set fdm=manual
set fdm=indent
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
" set nowrap
set showbreak=+
" let &colorcolumn="80,120".join(range(241,360),",")
set colorcolumn=120
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
let g:indentLine_leadingSpaceChar='·'
" match ErrorMsg '\(^ \+\|^\t\+ \+$\|^\t\+ \+\t\+\)'

function! LoadCscope()
    set nocscopeverbose
    let db = findfile("cscope.out", ".;")
	if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    elseif (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        " set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        " set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

let g:NERDTreeWinSize=40

command! TrimWhitespace call TrimWhitespace()
command! ReplaceDosNewline call ReplaceDosNewline()
command! LoadCscope call LoadCscope()

" Buffergator
" let g:buffergator_viewport_split_policy="B"
" let g:buffergator_suppress_keymaps=1
" nnoremap <Leader>bb :BuffergatorOpen<CR>
" nnoremap <Leader>bc :BuffergatorClose<CR>
" nnoremap <Leader>btt :BuffergatorTabsOpen<CR>
" nnoremap <Leader>btc :BuffergatorTabsClose<CR>

" Ack.vim"
" let g:ackprg = 'rg -uuu --vimgrep --no-heading --smart-case -g "!test" --glob-case-insensitive -S --path-separator /'
" cnoreabbrev Ack Ack!
" Ack.vim keymapping
" nnoremap <Leader>a :Ack!<Space>
" nnoremap <Leader>A :Ack! <C-R>=expand("<cword>")<CR> 
" nnoremap <Leader>wA :Ack! <C-R>=expand("<cword>")<CR><CR>

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
" nnoremap <Leader>e :Buffers<CR>
" nnoremap <Leader>t :Files<CR>
" nnoremap <Leader>r :Tags<CR>
" nnoremap <Leader>q :RG<CR>
" nnoremap <Leader>wq :RG <C-R><C-W><CR>
" nnoremap <Leader>z :Ag<Space>
" nnoremap <Leader>wz :Ag <C-R>=expand("<cword>")<CR><CR>
" nnoremap <Leader>bl :Lines<Space><CR>
" nnoremap <Leader>l :BLines<Space><CR>
" nnoremap <Leader>wl :BLines <C-R>=expand("<cword>")<CR><CR>

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
" nnoremap <leader>fF :execute 'Telescope find_files search_file=' . expand('<cword>')<cr>
" nnoremap <leader>fG :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>

" lua-style
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>
" nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_files({default_text = "keymaps"})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').tags()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <C-_> <cmd>lua require('mytelescope').curr_buf()<cr>
nnoremap <leader>fd :bprevious<CR>:bdelete #<CR>
nnoremap <leader>a <cmd>lua require('rgflow').open()<cr>
nnoremap <leader>A <cmd>lua require('rgflow').open_cword()<cr>


" nvim-style
nnoremap <leader>fG :execute 'Telescope grep_string sorting_strategy=ascending search=' . expand('<cword>')<cr>
nnoremap <leader>fR :execute 'Telescope tags default_text=' . expand('<cword>')<cr>
nnoremap <leader>fl :Telescope live_grep grep_open_files=true sorting_strategy=ascending<cr>
nnoremap <leader>fF :execute 'Telescope find_files default_text=' . expand('<cword>')<cr>
nnoremap <leader>fT :execute 'Telescope treesitter default_text=' . expand('<cword>')<cr>
nnoremap <leader>/ :execute 'Telescope current_buffer_fuzzy_find sorting_strategy=ascending default_text=' . expand('<cword>')<cr>
" telescope config end

" tagbar
" let g:tagbar_ctags_bin='C:\\Brose\\piskuro\\EE\\msyshome\\bin\\ctags'
let g:tagbar_use_cache=0

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
    silent! :%s/\r$//g
endfunction

" augroup remember_folds
"     autocmd!
"     autocmd BufWinLeave ?* mkview | filetype detect
"     autocmd BufWinEnter ?* silent loadview | filetype detect
" augroup END

lua require('init')
