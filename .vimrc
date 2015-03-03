""" START FROM
cd C:\Users\ajohnston\java

""" ALLOW SYNTAX HIGHLIGHTING
syntax on

""" KEY REMAP
" insert lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" backspace
set backspace=indent,eol,start

""" OPTIONS
"" Indentation
" spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" tabs
"set noexpandtab
"set copyindent
"set preserveindent
"set softtabstop=0
"set shiftwidth=8
"set tabstop=8

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

""" THEME
" colorscheme
syntax enable
set background=dark
colorscheme solarized

" no italics
let g:solarized_italic=0

" highlight trailing whitespace (but not in insert mode)
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""" EXPLORER MODE :e.
" uncomment below to get tree structure
" let g:netrw_liststyle=3

""" PACKAGES
"" Pathogen
execute pathogen#infect()
filetype plugin indent on

"" CtrlP
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