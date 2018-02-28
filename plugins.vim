call plug#begin('~/.config/nvim/plugged')
" nofrils-dark theme
Plug 'robertmeta/nofrils'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf is a general-purpose command-line fuzzy finder.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Git diff in the number column
Plug 'airblade/vim-gitgutter'

" Autocompleter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snipets
Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Asynchronous make
"Plug 'neomake/neomake'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Terminal manager
Plug 'kassio/neoterm'

" Syntaxes
Plug 'w0rp/ale'
Plug 'ngmy/vim-rubocop'

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'

" Markdown preview
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()
