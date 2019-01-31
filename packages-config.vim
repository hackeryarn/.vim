" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Colorscheme
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Markdown
let g:markdown_folding = 1
let g:vim_markdown_no_default_key_mappings = 0

" JavaScript
let g:jsx_ext_required = 0

" Go
let g:polyglot_disabled = ['go']
if fnamemodify(expand('%'), ':e') == "go"
  let b:SuperTabDefaultCompletionType = "<C-x><C-o>"
endif
let g:go_fmt_command = "goimports"

" Rust
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
let g:ale_rust_cargo_use_check = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Airline
let g:airline#extensions#tabline#enable=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pycodestyle'],
\   'rust': ['cargo'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'haskell': ['hfmt'],
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\   'rust': ['cargo'],
\}

let g:ale_linter_aliases = {
\   'javacript.jsx': 'javascript',
\   'jsx': 'javascript'
\}

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Compilers
let g:dispatch_compilers={}
let g:dispatch_compilers['stack build']='stack-build'
let g:dispatch_compilers['stack install']='stack-install'

" Tests
let test#strategy = 'dispatch'

" FZF
nmap <C-p> :Files<CR>
nmap gb :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Find
\ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
