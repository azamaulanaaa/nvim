return {
    'mhartington/formatter.nvim',
    opt = true,
    ft = {
        'rust',
        'go',
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
                go = {
                    function()
                        return {
                            exe = "gofmt",
                            args = {vim.api.nvim_buf_get_name(0)},
                            stdin = true,
                        }
                    end
                },
            },
        })
        vim.api.nvim_exec([[
            augroup FormatAutogroup
                autocmd!
                autocmd BufWritePost *.rs, *.go FormatWrite
            augroup END
        ]], true)
end,
}

