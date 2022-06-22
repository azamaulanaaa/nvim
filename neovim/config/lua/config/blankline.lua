return {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'master',
    commit = '6177a59552e35dfb69e1493fd68194e673dc3ee2',
    setup = function()
        local config = {
            indent_blankline_filetype_exclude               = { "help", "terminal", "dashboard" },
            indent_blankline_buftype_exclude                = { "terminal" },
            indent_blankline_char                           = "▏",
            indent_blankline_show_trailing_blankline_indent = false,
        }

        for name, value in pairs(config) do
            vim.g[name] = value
        end
    end,
}
