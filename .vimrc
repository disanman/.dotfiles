" __     ___                              __ _
" \ \   / (_)_ __ ___     ___ ___  _ __  / _(_) __ _
"  \ \ / /| | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"   \ V / | | | | | | | | (_| (_) | | | |  _| | (_| |
"    \_/  |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                              |___/
"


"___________________________________________
" Force python3
if has('python3')
    set pyx=3
endif
" if has('python3')
" endif

" python highlight
let python_highlight_all=1

" close autocompletion when done, defines <space g> to go to definition
let g:ycm_autoclose_preview_window_after_completion=1
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Settings for Vundle (package manager)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wmvanvliet/jupyter-vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"___________________________________________

" set clipboard=unnamedplus
" to allow sync among vim register and clipboard

syntax on
filetype plugin on
set number relativenumber
" Set Python Spaces
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

set background=dark

" Search color
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Black


set mouse=v

" Paste from clipboard when in insert mode.
imap <C-V> <ESC>"+gpa
" Paste from clipboard when in visual mode. (Replace whatever is selected in visual mode.)
vmap <C-V> "+gp
" Copy selection to clipboard when in visual mode.
vmap <C-C> "+y
" Cut selection to clipboard when in visual mode.
vmap <C-X> "+y

" old changes to use + register (clipboard)
" noremap <C-c> "+y
" nnoremap <C-v> "+P
" vnoremap <C-X> "+x

" map "select all text"
map <C-a> GVgg
" map new document
map <C-n> :enew

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Select color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" Toggle color scheme with F5
call togglebg#map("<F5>")
