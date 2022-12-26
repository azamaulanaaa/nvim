return {
    'ggandor/leap.nvim',
    branch = 'main',
    config = function()
        require('leap').add_default_mappings()
    end,
}
