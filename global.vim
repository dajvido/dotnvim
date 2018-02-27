" Set python path For python extensions
let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Assign leader key
let g:mapleader=","
let g:maplocalleader="\\"

" Set theme
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1  " in theory should fix nvim color problems in practical it doesn't work
filetype plugin indent on
syntax enable
set background=dark
set termguicolors
colorscheme nofrils-dark
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1
let g:nofrils_heavylinenumbers=1

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
" set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

" Deoplete config
let g:deoplete#enable_at_startup = 1
" disable autocomplete
"let g:deoplete#disable_auto_complete = 1

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
set signcolumn=yes
let g:ale_echo_msg_format = '%severity% [%linter%] %s'
let g:vimrubocop_config = '~/.config/nvim/rubocop.yml'
