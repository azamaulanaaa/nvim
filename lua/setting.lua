function setting()
	local setup = {
		backup					= false,
		writebackup			= false,
		swapfile				= false,
		encoding				=	'utf-8',
		relativenumber	= true,
		numberwidth			= 1,
		signcolumn			= 'yes',
		belloff					= 'all',
		updatetime			= 100,
		redrawtime			= 1500,
		timeout					= true,
		timeoutlen			= 500,
		ttimeout				= true,
		ttimeoutlen			= 10,
		tabstop					= 2,
		shiftwidth			= 2,
		softtabstop			=	-1,
		autoindent			= true,
		smartindent			= true,
		expandtab				= true,
		smarttab				= true,
    backspace       = 'indent,eol,start',
		shiftround			= true,
		scrolloff				= 2,
		sidescrolloff		= 5,
		wrap					= false,
	}

	for name, value in pairs(setup) do
		vim.o[name] = value
	end

  vim.cmd('filetype plugin on')
end

setting()
