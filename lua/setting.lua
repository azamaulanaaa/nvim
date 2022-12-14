function setting()
    local setup = {
        backup          = false,
        writebackup	    = false,
        swapfile        = false,
        encoding        = 'utf-8',
        relativenumber  = true,
        numberwidth     = 1,
        signcolumn      = 'yes',
        belloff         = 'all',
        updatetime      = 100,
        redrawtime      = 1500,
        timeout         = true,
        timeoutlen      = 500,
        ttimeout        = true,
        ttimeoutlen     = 10,
        tabstop         = 4,
        shiftwidth      = 4,
        softtabstop     = -1,
        autoindent      = true,
        smartindent     = true,
        expandtab       = true,
        smarttab        = true,
        backspace       = 'indent,eol,start',
        shiftround      = true,
        scrolloff       = 2,
        sidescrolloff   = 12,
        wrap            = false,
        guifont         = 'FiraCode Nerd Font:h10',
        shell           = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag    = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir      = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe       = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote      = "",
        shellxquote     = "",
    }

    for name, value in pairs(setup) do
        vim.o[name] = value
    end

    local global = {
    }

    for name, value in pairs(global) do
        vim.g[name] = value
    end

    vim.cmd('filetype plugin on')
end

setting()
