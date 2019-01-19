packadd minpac

command! PackUpdate packadd minpac | source ~/.vim/init.vim | redraw | call minpac#update()
command! PackClean  packadd minpac | source ~/.vim/init.vim | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" Add other plugins here.
call minpac#add('ervandew/supertab')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')

call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('altercation/vim-colors-solarized')

call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')

call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')

call minpac#add('w0rp/ale')

call minpac#add('sheerun/vim-polyglot')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('fatih/vim-go')

packloadall
