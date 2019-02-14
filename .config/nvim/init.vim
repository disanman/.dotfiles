"  _   _         __     _____ __  __    ____             __ _
" | \ | | ___  __\ \   / /_ _|  \/  |  / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / / | || |\/| | | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V /  | || |  | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/  |___|_|  |_|  \____\___/|_| |_|_| |_|\__, |
                                                            " |___/
"___________________________________________

" python highlight
let python_highlight_all=1
" let maplocalleader = ","
let mapleader = ","      " Maps <leader> ('\' key) to ','
nmap <C-e> V<Plug>JupyterRunVisual
vmap <C-e> <Plug>JupyterRunVisual

" Using fzf.vim, and a modified version of Files: Filesp (with preview)
nmap <C-f> :Filesp<CR>

" close autocompletion when done, defines <space g> to go to definition
let g:ycm_autoclose_preview_window_after_completion=1
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Split navigations
set splitbelow
set splitright
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>
nnoremap <A-h> <C-w><C-h>
nnoremap <C-t> :tabnew<CR>:Ranger<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
" Resize splits
nnoremap <A-J> :res -3<CR>
nnoremap <A-K> :res +3<CR>
nnoremap <A-L> :vertical resize +5<CR>
nnoremap <A-H> :vertical resize -5<CR>
" Tab navigation

"___________________________________________
" Settings for Vundle (package manager)
set nocompatible                   " be iMproved, required
filetype off                       " required
set rtp+=~/.vim/bundle/Vundle.vim  " Vundle path
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wmvanvliet/jupyter-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'  " it says ranger.vim needs it?
Plugin 'gcmt/taboo.vim'         " Cool tab names
Plugin 'vim-airline/vim-airline'  " Statusbar
Plugin 'vim-airline/vim-airline-themes'
" Plugins for markdown editing:
Plugin 'vimwiki/vimwiki'
Plugin 'Alok/notational-fzf-vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'   " Must install!
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"___________________________________________

syntax on
filetype plugin on

" Set relative number:
set number relativenumber
nmap <leader><F3> :set nu! <CR>
nmap <leader><F4> :set rnu! <CR>

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


" Select color scheme
set background=dark
if has('gui_running')
  colorscheme delek
else
  colorscheme delek
endif
" Toggle color scheme with F5
call togglebg#map("<F5>")
nnoremap <F4> :Color<CR>

" Search color
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Black

" Search case
set ignorecase
set smartcase
" if an uppercase character, it will do a case sensitive search
" if search for purely lowercase, it will do a case insensitive search

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

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Settings for ranger.vim
let g:ranger_map_keys = 0  " don't use default key map
map <f3> :RangerCurrentDirectory<CR>

" Settings for taboo.vim (tab behaviour)
let g:taboo_tab_format=' |%N| %f%m  '

" Settings for airline-statusbar
" let g:airline_skip_empy_sections = 1  " To remove right triangles
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_theme='sol'
" let g:airline_theme='serene'
let g:airline_theme='murmur'

" Options for markdown editing:  helppage -> vimwiki-syntax
" set nocompatible
" filetype plugin on    " already enabled
" syntax on             " already enabled
let g:vimwiki_list = [{'path': '~/Documents/Notes', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_global_ext = 0
nmap <Leader>wo <Plug>VimwikiUISelect
nmap <Leader>sp <Plug>VimwikiSplitLink
nmap <Leader>vs <Plug>VimwikiVSplitLink
nmap <Leader>t <Plug>VimwikiTabnewLink
nmap <Leader>n <Plug>VimwikiIncrementListItem
nmap <Leader>p <Plug>VimwikiDecrementListItem
nmap <Leader>x <Plug>VimwikiToggleRejectedListItem


" Turn on spell for markdown files
autocmd FileType markdown setlocal spell
set mouse=a mousemodel=popup
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :set spelllang=es<CR>

" To activate instant preview (html preview of notes), install:
" https://github.com/suan/vim-instant-markdown
" let g:instant_markdown_autostart = 0
" map <leader>md :InstantMarkdownPreview<CR>


" Options for note taking using notational-fzf-vim
" Shortcuts c-x: use string as filename for new file
"           c-v: open in vertical split
"           c-s: open in horizontal split
"           c-t: open in new tab
"           c-y: yank selected filename
"           <enter>: open highlighted search result in buffer
"           c-p: previous result
"           c-n: next result
let g:nv_search_paths = ['~/Documents/Notes']
let g:nv_use_short_pathnames = 1
" Note search with Control-N
nnoremap <c-N> :NV<CR>

