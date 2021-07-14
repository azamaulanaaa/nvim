" Import vim-plug config
runtime plug.vim

" Import user configuration
runtime user.vim

" Import plugins configuration

" Import fern config
runtime plugins-config/fern.vim

" Import lightline config
runtime plugins-config/lightline.vim

" Import lsp config
luafile ~/.config/nvim/plugins-config/lsp.lua
