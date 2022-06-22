return {
    'junegunn/fzf.vim',
    branch = 'master',
    commit = 'd5f1f8641b24c0fd5b10a299824362a2a1b20ae0',
    requires = {
        { 
            'junegunn/fzf',
            tag = '0.30.0',
            run = function()
                vim.fn['fzf#install']()
            end,
        },
        { 
            'tpope/vim-fugitive',
            branch = 'master',
            commid = '8b39d29d947618913ba1db32de605a6335875b99',
        },
    },
    opt = true,
    keys = { 
        {'n', '<leader>ff' },
        {'n', '<leader>bb' },
    },
    setup = function()
        -- Disable preview window
        vim.g.fzf_preview_window = {}
    end,
    config = function()
        -- Custom FZF
        function fzf()
            if vim.fn['FugitiveHead']() ~= '' then
                -- Ignore files in .gitignore
                vim.cmd('GFiles --cached --others --exclude-standard')
                return
            end

            vim.cmd('Files')
            return
        end
        
        -- Keybinding
        vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua fzf()<cr>]], { noremap = true, silent = true })	
    end,
}
