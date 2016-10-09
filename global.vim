" Set python path For python extensions
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Assign leader key
let g:mapleader=","

" Set theme to solarized
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1  " in theory should fix nvim color problems in practical it doesn't work
syntax enable
set background=dark
colorscheme solarized

" Ensure newline at EOF on save
set eol

" Config backspace
set backspace=indent,eol,start

" Copy paste to clipboard
set clipboard=unnamed

" Relative line numbers
set relativenumber

" Show current line
set number

" Set path for backup and swap files
set backupdir=~/.config/nvim/session/backup//
set directory=~/.config/nvim/session/swp//

" Set session dir
let g:session_dir='$HOME/.config/nvim/session/ss/'

set listchars=tab:▷⋅,trail:·,extends:❯,precedes:❮

set autoindent          " automatically indent new line
set visualbell          " use visual bell instead of beeping
set laststatus=2        " always show the status line

set splitbelow " Open split window - bottom
set splitright " Open split window - right

set textwidth=0   " Do not wrap words (insert)

set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)

set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters

set cursorline      " highlight current line
set colorcolumn=101 " highlight column

set timeoutlen=300 " Fix delay problem
set ttimeoutlen=10 " Fix delay problem

" FZF
let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

" Deoplete config
"let g:deoplete#enable_at_startup = 1
" disable autocomplete
""let g:deoplete#disable_auto_complete = 1
" YCM config
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_add_preview_to_completeopt = 0
" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Airline tabline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized' "light dark simple badwolf solarized solarized2
set noshowmode
let g:airline#extensions#tabline#enabled = 1

" Nerdtree
" Close if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neoterm
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_size = 15

" Syntax
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_haml_checkers = ['haml_lint']
"let g:syntastic_ruby_checkers = ['rubocop']
let g:neomake_ruby_enabled_makers=['rubocop']
let g:used_javascript_libs = 'jquery,underscore,react,backbone'
let g:vimrubocop_config = '~/.config/nvim/rubocop.yml'
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] } " start lagging while saving and opening files
let g:go_list_type = "quickfix" " Issue with vim-go and syntastic is that the location list window that contains the output of commands such as :GoBuild and :GoTest might not appear

" Go config
"let g:go_fmt_command = \"goimports"
let g:go_fmt_command = "gofmt -tabs=false -tabwidth=2"
let g:go_term_mode = "split"
let g:go_term_enabled = 1
