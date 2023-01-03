return {
    'nvim-tree/nvim-tree.lua',
    branch = 'master',
    requires = {
        { 
            'kyazdani42/nvim-web-devicons',
            brach = "main",
        },
    },
    config = function()
        require('nvim-tree').setup {
            filters = {
                dotfiles = true,
            },
            renderer = {
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
                root_folder_modifier = ':t:s?$?/..?',
            },
            update_focused_file = {
                enable = false,
            },
            view = {
                relativenumber = false,
                signcolumn = "no",
            },
        }

        -- Keybinding
        vim.api.nvim_set_keymap('n', '<c-o>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
    end,
}
