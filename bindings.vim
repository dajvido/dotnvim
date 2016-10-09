" FZF mapping selecting mappings
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>B :Buffers<CR>
nnoremap <silent> <leader>W :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>a :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>T :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
let old_reg = getreg('"')
let old_regtype = getregtype('"')
let old_clipboard = &clipboard
set clipboard&
normal! ""gvy
let selection = getreg('"')
call setreg('"', old_reg, old_regtype)
let &clipboard = old_clipboard
execute 'Ag' selection
endfunction

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" ,y to show the yankring
nmap <leader>y :YRShow<cr>
" put the yankring_history file in ~/.backup
let g:yankring_history_dir = '~/.backup'

" Deoplete autocomplete on the key
"if has("gui_running")
"    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
"else
"    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
"endif

" UltiSnips config
" inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Session hotkeys
nnoremap <Leader>sl :wall<Bar>execute "source " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>
nnoremap <Leader>ss :execute "mksession! " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Remove blank lines at eof
function! TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction
au BufWritePre * call TrimEndLines()

" Tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" Keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv

" nerdtree
" Ctrl-P to Display the file browser tree
map <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" neomake
" build
nnoremap <silent> <leader>m :Neomake<CR>

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Undo completion
"inoremap <expr><C-g> deoplete#mappings#undo_completion()

" Redraw candidates
"inoremap <expr><C-l> deoplete#mappings#refresh()

" Nerdcommenter
" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" Terminal
tnoremap <C-q> <C-\><C-n>

" Neoterminal
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,ra :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rc :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" open terminal
nnoremap <silent> ,to :call neoterm#open()<cr>
" hide/close terminal
nnoremap <silent> ,tc :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tk :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" Files diff
nmap <leader>diff :windo :diffthis<CR>

" Docs
nmap <silent> <leader>d <Plug>DashSearch

" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Fix for goimports - auto imports and retabs to spaces
au BufWrite *.go call s:AutoImportsAndRetabToSpaces()
function! s:AutoImportsAndRetabToSpaces()
  GoImports
  set expandtab
  retab
endfunction
