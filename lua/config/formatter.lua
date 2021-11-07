return {
    'mhartington/formatter.nvim',
    opt = true,
    ft = {
        'rust',
    },
    config = function()
        require("formatter").setup({
            filetype = {
                rust = {
                    function()
                        return {
                            exe = "rustfmt",
                            args = {"--emit stdout"},
                            stdin = true,
                        }
                    end,
                },
            },
        })
        vim.api.nvim_exec([[
            augroup FormatAutogroup
            autocmd!
            autocmd BufWritePost *rs FormatWrite
            augroup END
        ]], true)
end,
}

