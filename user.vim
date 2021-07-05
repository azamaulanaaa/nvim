set nocompatible

" Memory management
set nobackup
set nowritebackup
set noswapfile

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Enable syntax
syntax enable

" :find autocomplete
set path+=**
set wildmenu
" Ignore node_modules folder
set wildignore+=**/node_modules/**
" Maping to \f
nnoremap <leader>f :find 

" Show number line
set relativenumber

" Type experience
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

" Add Cursor Support
set mouse=a

" Disable beep
set belloff=all

" Load theme
set cursorline
set t_Co=256
colorscheme dogrun

" Make it responseive
set updatetime=300

" Always show tabline
set showtabline=2


" Auto normal mode in terminal
tnoremap <CR> <CR><c-\><c-n><CR>
tnoremap <c-c> <c-c><c-\><c-n><CR>
