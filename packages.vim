packadd minpac

command! PackUpdate packadd minpac | source ~/.vim/init.vim | redraw | call minpac#update()
command! PackClean  packadd minpac | source ~/.vim/init.vim | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" General
call minpac#add('ervandew/supertab')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-obsession')

" Themes
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('altercation/vim-colors-solarized')

" Navigation
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')

" Snippets
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

" Git
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')

" Development
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('sgur/vim-editorconfig')
call minpac#add('janko-m/vim-test')
call minpac#add('w0rp/ale')

" Languages
call minpac#add('sheerun/vim-polyglot')
call minpac#add('mattn/emmet-vim')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('fatih/vim-go')

packloadall

source  ~/.vim/packages-config.vim
