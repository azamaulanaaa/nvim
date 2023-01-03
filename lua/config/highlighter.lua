return {
    'nvim-treesitter/nvim-treesitter', 
    branch = 'master',
    --run = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup{}
    end,
}
