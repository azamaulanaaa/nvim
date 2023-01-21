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

        -- Plugin Manager --
        use 'wbthomason/packer.nvim'
            
        -- Visual --
        plugin 'colorscheme'
        plugin 'statusline'
        plugin 'indent_line'
        plugin 'minimap'
        plugin 'gitsigns'

        -- Feature --
        plugin 'file_tree'
        plugin 'cursor_asist'
        plugin 'file_search'
        plugin 'terminal'
        
        -- Progaming Specific --
        plugin 'lsp'
        plugin 'autocomplete'
        plugin 'cmd_autocomplete'
        plugin 'formatter'
        plugin 'highlighter'
        plugin 'autopairs'
    end
)
