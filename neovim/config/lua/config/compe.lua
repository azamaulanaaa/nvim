return {
    'hrsh7th/nvim-compe',
    config = function()
        -- Completion popup menu
        vim.o.completeopt   ='menuone,noselect'
        vim.o.shortmess     = vim.o.shortmess..'c'

        require('compe').setup({
            source = {
                path        = true;
                buffer      = true;
                nvim_lsp    = true;
                nvim_lua    = true;
            };
        })
        
        -- Keybindings
        function keymap(...) vim.api.nvim_set_keymap(...) end
        local expr_opts = { expr = true; silent = true }

        keymap('i', '<tab>', "pumvisible() ? '<c-n>' : '<tab>'", expr_opts)
        keymap('i', '<s-tab>', "pumvisible() ? '<c-p>' : '<s-tab>'", expr_opts)
        keymap('i', '<cr>', "compe#confirm({ 'keys': '<cr>', 'select': v:true })", expr_opts)
    end
}
