function disable_builtin()
    local plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',
        'loginpat',
        'rrhelper',
        'spellfile_plugin',
        'matchit',
    }

    for _, plugin in pairs(plugins) do
        vim.g['loaded'..plugin] = 1
    end
end

disable_builtin()
