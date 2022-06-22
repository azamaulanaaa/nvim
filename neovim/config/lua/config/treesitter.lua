return {
    'nvim-treesitter/nvim-treesitter', 
    branch = 'master',
    commit = '238532fe82b3dbfedcc06f11a536e19b1df696e1',
    run = ':TSUpdate',
    opt = true,
    ft = {
        'bash',
        'dockerfile',
        'go',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'lua',
        'python',
        'typescript',
        'typescriptreact',
        'yaml',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'bash',
                'dockerfile',
                'go',
                'html',
                'javascript',
                'json',
                'lua',
                'python',
                'tsx',
                'typescript',
                'yaml',
            },
            hightlight = {
                enable = true,
                disable = {},
            },
        }
    end,
}
