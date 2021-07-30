" Make sure vim-plug installed
let data_dir = has('nvim') ? stdpath('config') : '~/.vim'
if empty(glob(data_dir.'/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin(stdpath('config').'/plugins')

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Fugitive
Plug 'tpope/vim-fugitive'

" Nerdfont
Plug 'lambdalisue/nerdfont.vim'

" File tree explorer
Plug 'lambdalisue/fern.vim'

" git status plugins for fern
Plug 'lambdalisue/fern-git-status.vim'

" Nerdfont for ferm
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Git stage for fern
Plug 'lambdalisue/fern-mapping-git.vim'

" Fix performance issue
Plug 'antoinemadec/FixCursorHold.nvim'

" Onedark theme
Plug 'joshdick/onedark.vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Nvim Builtin LSP
Plug 'neovim/nvim-lspconfig'

" Nvim Completion
Plug 'nvim-lua/completion-nvim'

" Vim Polyglot
Plug 'sheerun/vim-polyglot'

" One theme
Plug 'rakr/vim-one'

" Vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()
