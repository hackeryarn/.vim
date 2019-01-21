source ~/.vim/packages.vim

imap fd <Esc>
let mapleader = " "
let g:mapleader = " "

" general
set noerrorbells
set backspace=indent,eol,start   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set noshowmode
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set lazyredraw
set hidden
set ttyfast
set smarttab
set wildmenu

" folds
set foldmethod=syntax
set nofoldenable
nnoremap zA za
nnoremap za zA

" speed up syntax highlighting
syntax on
set nocursorcolumn
set nocursorline

" softwrap
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set textwidth=79
set colorcolumn=+1

set autoindent
set showmatch
set smarttab

" Softtabs, 2 spaces
set et
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Time out on key codes but no mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set number relativenumber numberwidth=5

" Better Completion
set complete=.,w,b,u,t

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Fixing the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <BS> <C-w>h
nnoremap <C-l> <C-w>l

" Open file relative to the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Better CTRL-U
inoremap <C-U> <C-G>u<C-U>

" search
set gdefault
set incsearch     " do incremental searching
set ignorecase    " Search case insensitive...
set smartcase     " ... but not when search pattern contains upper case chars
nnoremap ,, :nohlsearch<CR>
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --no-heading\ --vimgrep
endif

" NetRW
let g:netrw_liststyle = 1
let g:netrw_sizwstyle = "H"
let g:netrw_banner = 0

if has('mouse')
  set mouse=a
endif

" Backup, Swap and Undo
set undofile
set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
set undodir=~/.vim/undo,/tmp

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" ctags
nnoremap <f5> :!ctags -R --exclude=.git --exclude=node_modules --exclude=gulp<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    runtime macros/matchit.vim

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \	exe "normal! g`\"" |
            \ endif

        " Enable auto line wrap for specific file types
        autocmd FileType text,markdown
            \ setlocal formatoptions+=t

    augroup END

else
endif " has("autocmd")
