" Import vim-plug config
runtime plug.vim

" Import user configuration
runtime user.vim

" Import plugins configuration
let plugins = '/plugins-config'

" Import coc config
runtime plugins.'coc.vim'
