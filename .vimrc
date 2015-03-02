" START FROM
cd C:\Users\ajohnston\java

" KEY REMAP
" insert lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" backspace
set backspace=indent,eol,start

" OPTIONS
" indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" auto indentation
:filetype indent on
set autoindent
set smartindent

" case insensitive search
set ignorecase

" highlight
set hlsearch

" numbers
set number
set numberwidth=5

" THEME
" colorscheme
syntax enable
set background=dark
colorscheme solarized
" no italics
let g:solarized_italic=0

" :e. (explorer mode)
" uncomment below to get tree structure
" let g:netrw_liststyle=3

" PACKAGES
" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" CtrlP
" open
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" clear cache with Ctrl + F7
nmap <C-F7> :CtrlPClearCache<CR>
" search from current directory instead of project root
let g:ctrlp_working_path_mode = 0
" ignore
set wildignore+=*\\tmp\\**,*.swp,*.zip,*.exe
set wildignore+=*\\images\\**,*\\node_modules\\**,*\\bower_components\\**,*\\external_components\\**