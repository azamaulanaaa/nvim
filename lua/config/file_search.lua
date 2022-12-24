return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    requires = {
        { 
            'nvim-lua/plenary.nvim',
            branch = 'master',
        },
    },
    opt = true,
    keys = { 
        {'n', '<leader>ff' },
        {'n', '<leader>fb' },
    },
    setup = function()
    end,
    config = function()
        -- Custom FZF
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    end,
}
