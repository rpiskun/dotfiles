" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'doums/darcula'
" Plug 'altercation/vim-colors-solarized'
" Plug 'dracula/vim',{ 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()

source ~/.vim/autoload/cscope_maps.vim
set termguicolors
set background=dark
" colorscheme gruvbox
colorscheme darcula 
" colorscheme solarized 
" colorscheme dracula 
" colorscheme gruvbox-material 

" Keys mapping
map <C-n> :NERDTreeToggle $HOME<CR>
"noremap <C-w>- :split<CR>
"noremap <C-w>\ :vsplit<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-h> :call WinMove('h')<CR>
map <C-l> :call WinMove('l')<CR>

" Sets
syntax on
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set lcs+=space:·
set lcs+=eol:\^
set lcs+=tab:>-
set list
"set tags=$PWD/projects/glstk/STM32CubeIDE/workspace/xlgyro/tags
set fillchars+=vert:\|
set hlsearch
set incsearch
set smartindent
set fdm=syntax
set nofoldenable

" Global vars
let g:airline_theme='base16'
let g:NERDTreeWinSize=40
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'wrc'
let g:ctrlp_root_markers = ['.gitignore']
let g:ycm_global_ycm_extra_conf = "$PWD/.ycm_extra_conf.py"
let g:indentLine_leadingSpaceChar='·'

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

