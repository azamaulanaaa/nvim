return {
    'kyazdani42/nvim-tree.lua',
    branch = 'master',
    commit = '79258f1d670277016523e13c0a88daa25070879f',
    requires = {
        { 
            'kyazdani42/nvim-web-devicons',
            brach = "main",
            commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
        },
    },
    opt = true,
    keys = { 
        { 'n', '<c-o>' },
    },
    config = function()
        require('nvim-tree').setup {
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            filters = {
                dotfiles = true,
            },
            renderer = {
                add_trailing = false,
                highlight_git = true,
                icons = {
                    glyphs = { default = '' },
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                    },
                },
                indent_markers = {
                    enable = true,
                },
                root_folder_modifier = table.concat{':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??'},
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                relativenumber = true,
            },
        }

        -- Keybinding
        vim.api.nvim_set_keymap('n', '<c-o>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
    end,
}
