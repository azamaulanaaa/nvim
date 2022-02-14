return {
    'joshdick/onedark.vim',
    config = function() 
        -- Enable cursorline
        vim.opt.cursorline = true

        -- If not in gui the set t_Co to 256
        if not vim.fn.has('gui_running') then vim.opt.t_Co = 256 end

        -- If term support gui color then set it true
        if vim.fn.has('termguicolors') then vim.opt.termguicolors = true end

        -- Set colorscheme for nvim
        vim.cmd('colorscheme onedark')

        -- Remove statusline background
        vim.cmd('highlight clear StatusLine')
        vim.cmd('highlight EndOfBuffer guifg=#282C34')
    end,
}
