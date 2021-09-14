return {
    'tpope/vim-fugitive',
    config = function()
        vim.cmd('autocmd filetype gitcommit setlocal spell spelllang=en_us')
    end,
}
