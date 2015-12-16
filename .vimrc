" starting dir
if has("unix")
  cd ~/workspace
else
  cd C:\Users\ajohnston\Documents\dev
endif

" colors and display
syntax off
filetype off
set t_Co=0
highlight Normal guibg=Black
highlight Normal guifg=Grey
highlight LineNr guifg=Grey
highlight NonText guifg=Grey

" column marker
set colorcolumn=81
highlight ColorColumn guibg=DarkRed

" show whitespace characters
set list
set listchars=tab:>-,trail:·
highlight SpecialKey guifg=DarkGreen

" no line wrapping
set nowrap

" auto indentation
filetype indent on
set autoindent
set smartindent

" case insensitive search
set ignorecase

" highlight search results
set hlsearch

" line numbers
set number
set numberwidth=5

" use space to start a command
nnoremap <Space> :

" exit insert mode with quick jk
" exit visual mode with quick io
:imap jk <Esc>
:vmap io <Esc>

" yank and paste with system clipboard
vmap Y "*y
nmap P "*p

" insert lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" stay in visual mode after changing indent
vmap > >gv
vmap < <gv

"" indentation
let current_spacing="2 SPACES"
let short_width=2
let long_width=4

set expandtab
execute "set shiftwidth=".g:short_width
execute "set softtabstop=".g:short_width

function! TabToggle()
  if g:current_spacing == "2 SPACES"
    " set long
    set expandtab
    execute "set shiftwidth=".g:long_width
    execute "set softtabstop=".g:long_width
    let g:current_spacing="4 SPACES"
  elseif g:current_spacing == "4 SPACES"
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
    let g:current_spacing="2 SPACES"
  endif
  echo "current spacing scheme is: ".g:current_spacing
endfunction

" toggle between spaces and tabs with F9
nmap <F9> mz:execute TabToggle()<CR>'z

"" windows
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

" quickly resize windows
nmap J <C-W>-
nmap K <C-W>+
nmap H <C-W><
nmap L <C-W>>

" cycle through open windows
map <F6> <C-W>w

"" gui editor tabs
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

"" some rarely used utilities

" remove whitespace and save
map <S-Space> :%s/\s\+$//<enter> :w<enter>

" backspace
set backspace=indent,eol,start

" add GO every 10 lines
map <C-F12> :%s/\(.*\n\)\{10\}/\0GO\r/gc

""" packages

"" pathogen
execute pathogen#infect()
filetype plugin indent on

"" ctrlp

" number of results
let g:ctrlp_max_height = 30

" open with
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" clear cache with Ctrl + F7
nmap <C-F7> :CtrlPClearCache<CR>

" search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" ignore
set wildignore+=*\\tmp\\**,*.swp,*.zip,*.exe
set wildignore+=*\\images\\**,*\\node_modules\\**,*\\bower_components\\**
