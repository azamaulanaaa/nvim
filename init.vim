" Import vim-plug config
runtime plug.vim

" Import user configuration
runtime user.vim

" Import plugins configuration

" Import lightline config
runtime plugins-config/lightline.vim

" Import lsp config
luafile ~/.config/nvim/plugins-config/lsp.lua

" Import vimwiki config
runtime plugins-config/vimwiki.vim

" Import treesitter config
runtime plugins-config/treesitter.vim

" Import nerdtree config
runtime plugins-config/nerdtree.vim
