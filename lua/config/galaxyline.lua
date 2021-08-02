return {
	'glepnir/galaxyline.nvim',
	requires = { 
		{ 'kyazdani42/nvim-web-devicons' },
	},
	config = function()
		-- Disable showmode
		vim.o.showmode = false

		-- Disable ruler
		vim.o.ruler = false

		-- Load galaxyline
		local gl = require('galaxyline')
		local colors = require('galaxyline.theme').default
		local condition = require('galaxyline.condition')
		local gls = gl.section

		-- Reset section
		gls.left = {}
		gls.mid = {}
		gls.right = {}
		gls.short_line_left = {}
		gls.short_line_right = {}

		-- Custom function
		function left(element) table.insert(gls.left, element) end
		function mid(element) table.insert(gls.mid, element) end
		function right(element) table.insert(gls.right, element) end
		function shortline(list) gl.short_line_list = list end
		function shortline_left(element) table.insert(gls.short_line_left, element) end
		function shortline_right(element) table.insert(gls.short_line_right, element) end

		-- Shortline list
		shortline {'NvimTree', 'packer'}

		-- Left
		left {
			RainbowRed = {
				provider = function() return '▊ ' end,
				highlight = {colors.blue},
			},
		}

		left {
			ViMode = {
				provider = function()
					-- auto change color according the vim mode
					local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
															[''] = colors.blue,V=colors.blue,
															c = colors.magenta,no = colors.red,s = colors.orange,
															S=colors.orange,[''] = colors.orange,
															ic = colors.yellow,R = colors.violet,Rv = colors.violet,
															cv = colors.red,ce=colors.red, r = colors.cyan,
															rm = colors.cyan, ['r?'] = colors.cyan,
															['!']  = colors.red,t = colors.red}
					vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
					return ''
				end,
				separator = ' ',
				highlight = {colors.red},
			},
		}

		left {
			GitIcon = {
				provider = function() return '  ' end,
				condition = condition.check_git_workspace,
				separator = ' ',
				separator_highlight = {'NONE'},
				highlight = {colors.violet},
			},
		}

		left {
			GitBranch = {
				provider = 'GitBranch',
				separator = ' ',
				condition = condition.check_git_workspace,
				highlight = {colors.violet},
			},
		}

		left {
			DiffAdd = {
				provider = 'DiffAdd',
				condition = condition.hide_in_width,
				icon = '  ',
				highlight = {colors.green},
			},
		}

		left {
			DiffModified = {
				provider = 'DiffModified',
				condition = condition.hide_in_width,
				icon = ' 柳',
				highlight = {colors.orange},
			},
		}

		left {
			DiffRemove = {
				provider = 'DiffRemove',
				condition = condition.hide_in_width,
				icon = '  ',
				highlight = {colors.red},
			},
		}

		-- Midle
		mid {
			FileIcon = {
				provider = 'FileIcon',
				separator = ' ',
				condition = condition.buffer_not_empty,
				highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color},
			},
		}

		mid {
			FileName = {
				provider = 'FileName',
				separator = ' ',
				condition = condition.buffer_not_empty,
				highlight = {colors.magenta},
			},
		}

		-- Right
		right {
			DiagnosticError = {
				provider = 'DiagnosticError',
				icon = '  ',
				highlight = {colors.red},
			},
		}

		right {
			DiagnosticWarn = {
				provider = 'DiagnosticWarn',
				icon = '  ',
				highlight = {colors.yellow},
			},
		}

		right {
			DiagnosticHint = {
				provider = 'DiagnosticHint',
				icon = '  ',
				highlight = {colors.cyan},
			},
		}

		right {
			DiagnosticInfo = {
				provider = 'DiagnosticInfo',
				icon = '  ',
				highlight = {colors.blue},
			},
		}

		right {
			FileEncode = {
				provider = 'FileEncode',
				condition = condition.hide_in_width,
				separator = ' ',
				separator_highlight = {'NONE'},
				highlight = {colors.green},
			},
		}

		right {
			FileFormat = {
				provider = 'FileFormat',
				condition = condition.hide_in_width,
				separator = ' ',
				separator_highlight = {'NONE'},
				highlight = {colors.green},
			},
		}

		--right {
		--	PerCent = {
		--		provider = 'LinePercent',
		--		separator = ' ',
		--		separator_highlight = {'NONE'},
		--		highlight = {colors.fg},
		--	}
		--}

		right {
			LineInfo = {
				provider = 'LineColumn',
				separator = ' ',
				separator_highlight = {'NONE'},
				highlight = {colors.fg},
			},
		}

		right {
			FileSize = {
				provider = 'FileSize',
				separator = ' ',
				condition = condition.buffer_not_empty,
				highlight = {colors.fg},
			},
		}

		right {
			RainbowBlue = {
				provider = function() return ' ▊' end,
				highlight = {colors.blue},
			},
		}

		-- Shortline left
		shortline_left {
			RainbowRed = {
				provider = function() return '▊ ' end,
				highlight = {colors.blue}
			},
		}

		shortline_left {
			BufferType = {
				provider = 'FileTypeName',
				separator = ' ',
				separator_highlight = {'NONE'},
				highlight = {colors.blue}
			}
		}

		shortline_left {
			SFileName = {
				provider =  'SFileName',
				condition = condition.buffer_not_empty,
				highlight = {colors.fg}
			}
		}

		-- Shortline right
		--shortline_right {
		--	BufferIcon = {
		--		provider= 'BufferIcon',
		--		highlight = {colors.fg}
		--	}
		--}
	end,
}
