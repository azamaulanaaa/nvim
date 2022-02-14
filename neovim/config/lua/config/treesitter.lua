return {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    opt = true,
    ft = {
        'bash',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'yaml',
        'html',
        'go',
        'lua',
        'dockerfile',
        'python',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            hightlight = {
                enable = true,
                disable = {},
            },
            ensure_installed = {
                'bash',
                'javascript',
                'typescript',
                'tsx',
                'json',
                'yaml',
                'html',
                'go',
                'lua',
                'dockerfile',
                'python',
            },
        }
    end,
}
