" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
" Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()

source ~/.vim/autoload/cscope_maps.vim
set termguicolors
set background=dark
colorscheme gruvbox

" Keys mapping
map <C-n> :NERDTreeToggle $HOME<CR>
"noremap <C-w>- :split<CR>
"noremap <C-w>\ :vsplit<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-h> :call WinMove('h')<CR>
map <C-l> :call WinMove('l')<CR>
nnoremap <F5> :buffers<CR>:buffer<Space> 
nnoremap <F8> :tabs<CR>:tabn<Space> 
nnoremap / /\v

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
set fillchars+=vert:\|
set hlsearch
set incsearch
set smartindent
set fdm=syntax
set nofoldenable
set t_Co=256
set autowrite
set hidden
set ignorecase
set smartcase

" Global vars
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
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

function! BufSel(pattern)
    let bufcount = bufnr("$")
    let currbufnr = 1
    let nummatches = 0
    let firstmatchingbufnr = 0
    while currbufnr <= bufcount
        if(bufexists(currbufnr))
            let currbufname = bufname(currbufnr)
            if(match(currbufname, a:pattern) > -1)
                echo currbufnr . ": ". bufname(currbufnr)
                let nummatches += 1
                let firstmatchingbufnr = currbufnr
            endif
        endif
        let currbufnr = currbufnr + 1
    endwhile
    if(nummatches == 1)
        execute ":buffer ". firstmatchingbufnr
    elseif(nummatches > 1)
        let desiredbufnr = input("Enter buffer number: ")
        if(strlen(desiredbufnr) != 0)
            execute ":buffer ". desiredbufnr
        endif
    else
        echo "No matching buffers"
    endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 BB :call BufSel("<args>")

