return {
    'gelguy/wilder.nvim',
    branch = 'master',
    commit = '6332b51762faaec0685769111ace06fecf673341',
    config = function()
        vim.fn['wilder#enable_cmdline_enter']()

        -- Show sugestion
        vim.o.wildcharm = 9 -- 9 for <Tab>

        -- Keybindings
        vim.api.nvim_set_keymap('c', '<tab>', [[wilder#in_context() ? wilder#next() : '<tab>']], { expr = true })
        vim.api.nvim_set_keymap('c', '<s-tab>', [[wilder#in_context() ? wilder#previous() : '<s-tab>']], { expr = true })

        -- Trigger
        vim.fn['wilder#set_option']('modes', {'/', '?', ':'})
    end,
}
