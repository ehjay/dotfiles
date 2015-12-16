" START FROM
if has("win32unix")
  "only in Cygwin
  cd /cygdrive/c/Users/ajohnston/Documents/dev
elseif has("unix")
  cd ~/workspace
else
  cd C:\Users\ajohnston\Documents\dev
endif

" TMUX or other parent process
"" use 256 screen
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" CYGWIN
"" use block cursor
if has("win32unix")
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

" ALLOW SYNTAX HIGHLIGHTING
syntax on

" No line wrapping, better for splits
set nowrap

" KEY REMAP
" use space to start a command
nnoremap <Space> :

" exit insert mode with quick jk
" exit visual mode with quick io
:imap jk <Esc>
:vmap io <Esc>

" save with Ctrl+S
nmap <C-S> :w<enter>

" yank and paste with system clipboard
vmap Y "*y
nmap P "*p

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

" INDENTATION
" 4 spaces at startup
" toggle between spaces and tabs with F9
let short_width=2
let long_width=4
let current_spacing="LONG"

set expandtab
execute "set shiftwidth=".g:long_width
execute "set softtabstop=".g:long_width

function! TabToggle()
  if g:current_spacing == "SHORT"
    " set long
    set expandtab
    execute "set shiftwidth=".g:long_width
    execute "set softtabstop=".g:long_width
    let g:current_spacing="LONG"
  elseif g:current_spacing == "LONG"
    " set tab
    set noexpandtab
    set shiftwidth=8
    set softtabstop=0
    let g:current_spacing="TAB"
  elseif g:current_spacing == "TAB"
    " set short
    set expandtab
    execute "set shiftwidth=".g:short_width
    execute "set softtabstop=".g:short_width
    let g:current_spacing="SHORT"
  endif
  echo "current spacing scheme is: ".g:current_spacing
endfunction

nmap <F9> mz:execute TabToggle()<CR>'z

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

" WINDOWS
" switch windows with ALT + arrow key
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" move windows with CTRL + arrow key
nmap <silent> <C-Up> :wincmd K<CR>
nmap <silent> <C-Down> :wincmd J<CR>
nmap <silent> <C-Left> :wincmd H<CR>
nmap <silent> <C-Right> :wincmd L<CR>

" cycle through open windows
map <F6> <C-W>w

" TABS
if v:version >= 700 && has('gui_running')
  " go to first and last tabs
  nnoremap <C-Home>  :tabfirst<CR>
  nnoremap <C-End>   :tablast<CR>

  " move tab to start
  nnoremap <C-S-Home> :tabmove 0<CR>
  " move tab to end
  nnoremap <C-S-End> :tabmove<CR>
  " move tab left
  nnoremap <C-S-PageUp> :execute 'tabmove ' . (tabpagenr()-2)<CR>
  " move tab right
  nnoremap <C-S-PageDown> :execute 'tabmove ' . tabpagenr()<CR>
endif

" quickly resize windows
nmap J <C-W>-
nmap K <C-W>+
nmap H <C-W><
nmap L <C-W>>

" THEME
" no italics
let g:solarized_italic=0

" colorscheme
syntax off
highlight Normal guibg=Black
highlight Normal guifg=Grey
highlight LineNr guifg=Grey
highlight NonText guifg=Grey

set t_Co=0
filetype off
"colorscheme apprentice
" syntax enable
"set background=dark

" highlight trailing whitespace (but not in insert mode)
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" EXPLORER MODE :e.
" uncomment below to get tree structure
" let g:netrw_liststyle=3

" PACKAGES
" Pathogen
execute pathogen#infect()
filetype plugin indent on

" CtrlP
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
set wildignore+=*\\images\\**,*\\node_modules\\**,*\\bower_components\\**
