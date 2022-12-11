return {
    'navarasu/onedark.nvim',
    config = function() 
        -- Enable cursorline
        vim.opt.cursorline = true
        vim.g.onedark_hide_endofbuffer = 1

        -- If not in gui the set t_Co to 256
        if not vim.fn.has('gui_running') then vim.opt.t_Co = 256 end

        -- If term support gui color then set it true
        if vim.fn.has('termguicolors') then vim.opt.termguicolors = true end

        -- Set colorscheme for nvim
        local onedark = require('onedark')
        onedark.setup({
            style = 'dark',
        })
        onedark.load()
    end,
}
