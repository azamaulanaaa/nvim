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
        function plugin(path) use(require('config.'..path)) end

        -- Manage it self
        use 'wbthomason/packer.nvim'
            
        -- Visual --
        
        -- Theme
        plugin 'colorscheme'

        -- Statusline
        plugin 'galaxyline'

        -- Indent line
        plugin 'blankline'

        -- minimap
        plugin 'minimap'

        -- Feature --
        
        -- File explorer
        plugin 'nvimtree'

        -- Git
        plugin 'gitsigns'

        -- Nvim Command Suggestion
        plugin 'wilder'

        -- Cursor Assist
        plugin 'lightspeed'

        -- File search
        plugin 'telescope'

        -- Coding Assist --
        
        -- LSP Client
        plugin 'lsp'

        -- Completion
        plugin 'cmp'

        -- Formatter
        plugin 'formatter'

        -- Syntax Highlighter
        plugin 'treesitter'
    end
)
