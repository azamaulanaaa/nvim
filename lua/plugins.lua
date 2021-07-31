-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Plugins
return require('packer').startup(
  function()
    function config(path) require('config/'..path) end
    
    -- Theme
    use 'joshdick/onedark.vim'
    config('onedark')

    -- Statusline
    use 'itchyny/lightline.vim'

    -- Journal system
    use 'vimwiki/vimwiki'
    config('vimwiki')

    -- File explorer
		use {
			'kyazdani42/nvim-tree.lua',
			requires={'kyazdani42/nvim-web-devicons'},
		}
		config('nvimtree')

    -- Git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- LSP Client
    use {
      'neovim/nvim-lspconfig',
      requires = {
        {'nvim-lua/completion-nvim'},
      },
    }
    config('lsp')

    -- Syntax Highlighter
    use {
      'nvim-treesitter/nvim-treesitter', 
      run = ':TSUpdate'
    }
    config('treesitter')
  end
)
