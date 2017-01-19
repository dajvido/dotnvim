call plug#begin('~/.config/nvim/plugged')
" Solarized theme
Plug 'altercation/vim-colors-solarized'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Git diff in the number column
Plug 'airblade/vim-gitgutter'

" Operators on blocks
Plug 'michaeljsmith/vim-indent-object'

" Autocompleter
"function! DoRemote(arg)
  "UpdateRemotePlugins
"endfunction
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'

" Snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Copying history
Plug 'YankRing.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Asynchronous make
Plug 'neomake/neomake'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Terminal manager
Plug 'kassio/neoterm'

" Syntaxes
Plug 'ngmy/vim-rubocop'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'scrooloose/syntastic'

" Languages
Plug 'fatih/vim-go'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Docs
Plug 'rizzatti/dash.vim'

" LaTeX
Plug 'lervag/vimtex'

" Markdown preview
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()
