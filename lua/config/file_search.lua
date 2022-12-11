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
        local find_files = function(opt)
            vim.fn.system('git rev-parse --is-inside-work-tree')
            if vim.v.shell_error == 0 then
                builtin.git_files(opt)
            else
                builtin.find_files(opt)
            end
        end
        vim.keymap.set('n', '<leader>ff', find_files, {})
    end,
}
