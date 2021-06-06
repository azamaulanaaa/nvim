" Make sure vim-plug installed
let data_dir = has('nvim') ? stdpath('data').'/site' : '~/.vim'
if empty(glob(data_dir.'/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('./plugins')

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Custom Statusbar
Plug 'vim-airline/vim-airline'

" Theme for airline
Plug 'vim-airline/vim-airline-themes'

" Onehalf theme
Plug 'sonph/onehalf', {'rtp':'vim'}

" File tree explorer
Plug 'lambdalisue/fern.vim'

" Fix performance issue
Plug 'antoinemadec/FixCursorHold.nvim'

call plug#end()
