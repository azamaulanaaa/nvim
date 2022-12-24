return {
    'nvim-tree/nvim-tree.lua',
    branch = 'master',
    requires = {
        { 
            'kyazdani42/nvim-web-devicons',
            brach = "main",
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
                    quit_on_open = false,
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
