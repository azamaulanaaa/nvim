return {
    'mhartington/formatter.nvim',
    opt = true,
    ft = {
        'rust',
        'go',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
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
                    end,
                },
                javascript = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                '--single-quote',
                                '--tab-width', 4
                            },
                            stdin = true,
                        }
                    end
                },
                javascriptreact = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                '--single-quote',
                                '--tab-width', 4
                            },
                            stdin = true,
                        }
                    end
                },
                typescript = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                '--single-quote',
                                '--tab-width', 4
                            },
                            stdin = true,
                        }
                    end
                },
                typescriptreact = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                '--single-quote',
                                '--tab-width', 4
                            },
                            stdin = true,
                        }
                    end
                },
            },
        })
        vim.api.nvim_exec([[
            augroup FormatAutogroup
                autocmd!
                autocmd BufWritePost *.rs,*.go,*.js,*.jsx,*.ts,*.tsx FormatWrite
            augroup END
        ]], true)
    end,
}

