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
    function plugin(path) use(require('config/'..path)) end
    
    -- Theme
		plugin 'onedark'

    -- Statusline
		plugin 'galaxyline'

    -- Journal system
		plugin 'vimwiki'

    -- File explorer
		plugin 'nvimtree'

    -- Git
		plugin 'gitsigns'
		plugin 'fugitive'

    -- LSP Client
		plugin 'lsp'

    -- Syntax Highlighter
		plugin 'treesitter'

		-- Indent line
		plugin 'blankline'

		-- File search
		plugin 'telescope'
  end
)
