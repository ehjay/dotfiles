""" START FROM
cd C:\Users\ajohnston\java

""" ALLOW SYNTAX HIGHLIGHTING
syntax on

""" KEY REMAP
" use space to start a command
nnoremap <Space> :

" exit insert mode with quick jk
:imap jk <Esc>

" save with Ctrl+S
nmap <C-S> :w<enter>

" insert lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" stay in visual mode after changing indent
vmap > >gv
vmap < <gv

" remove whitespace and save
map <S-Space> :%s/\s\+$//<enter> :w<enter>

" backspace
set backspace=indent,eol,start

" add GO every 10 lines
map <C-F12> :%s/\(.*\n\)\{10\}/\0GO\r/gc

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
filetype indent on
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
" no italics
let g:solarized_italic=0

" colorscheme
syntax enable
set background=dark
colorscheme solarized

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
" number of results
let g:ctrlp_max_height = 30

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
