return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    requires = {
        { 
            'nvim-lua/plenary.nvim',
            branch = 'master',
        },
    },
    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    end,
}
