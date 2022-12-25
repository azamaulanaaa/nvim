return {
    'mhartington/formatter.nvim',
    branch = 'master',
    config = function()
        require("formatter").setup({
            filetype = {
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
                json = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                '--double-quote',
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
                autocmd BufWritePost *.rs,*.go,*.js,*.jsx,*.ts,*.tsx,*.json FormatWrite
            augroup END
        ]], true)
    end,
}

