function setting()
	local setup = {
		backup					= false,
		writebackup			= false,
		swapfile				= false,
		encoding				=	'utf-8',
		relativenumber	= true,
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
		smartindent			= true,
		shiftround			= true,
		scrolloff				= 2,
	}

	for name, value in pairs(setup) do
		vim.o[name] = value
	end
end

setting()
