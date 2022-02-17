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
        local gl                = require('galaxyline')
        local colors            = require('galaxyline.theme').default
        local condition         = require('galaxyline.condition')
        local gls               = gl.section

        -- Custom colors
        local function link_color(name, attr)
            local raw = vim.api.nvim_get_hl_by_name(name, true)[attr]
            if raw == nil then
                return 'NONE'
            end

            local value = string.format('#%06x', raw)

            return value
        end
        
        colors.fg               = link_color("StatusLine", "foreground")
        colors.bg               = link_color("StatusLine", "background")

        -- Shortline background
        vim.cmd("hi! StatusLineNC guibg=" .. colors.bg)

        -- Reset section
        gls.left                = {}
        gls.mid                 = {}
        gls.right               = {}
        gls.short_line_left     = {}
        gls.short_line_right    = {}

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
            Border = {
                provider = function() return ' ' end,
                highlight = {'NONE', colors.bg},
            },
        }

        left {
            ViMode = {
                provider = function()
                    -- auto change color according the vim mode
                    local mode_color = {
                        n       = colors.red,
                        i       = colors.green,
                        v       = colors.blue,
                        ['']  = colors.blue,
                        V       = colors.blue,
                        c       = colors.magenta,
                        no      = colors.red,
                        s       = colors.orange, 
                        S       = colors.orange,
                        ['']  = colors.orange, 
                        ic      = colors.yellow,
                        R       = colors.violet,
                        Rv      = colors.violet, 
                        cv      = colors.red,
                        ce      = colors.red, 
                        r       = colors.cyan, 
                        rm      = colors.cyan, 
                        ['r?']  = colors.cyan, 
                        ['!']   = colors.red,
                        t       = colors.red
                    }
                    vim.cmd('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
    --					return ''
                    return '   '
                end,
                highlight = {colors.fg, colors.bg},
            },
        }

        left {
            GitBranch = {
                condition = condition.check_git_workspace,
                provider = 'GitBranch',
                icon = '   ',
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
                highlight = {colors.blue, colors.bg},
            },
        }

        left {
            DiffAdd = {
                provider = 'DiffAdd',
                condition = condition.hide_in_width,
                icon = '  ',
                highlight = {colors.green, colors.bg},
            },
        }

        left {
            DiffModified = {
                provider = 'DiffModified',
                condition = condition.hide_in_width,
                icon = ' 柳',
                highlight = {colors.orange, colors.bg},
            },
        }

        left {
            DiffRemove = {
                provider = 'DiffRemove',
                condition = condition.hide_in_width,
                icon = '  ',
                highlight = {colors.red, colors.bg},
            },
        }

        -- Midle
        mid {
            FileIcon = {
                provider = 'FileIcon',
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
                condition = condition.buffer_not_empty,
                highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg},
            },
        }

        mid {
            FileName = {
                provider = 'FileName',
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
                condition = condition.buffer_not_empty,
                highlight = {colors.fg, colors.bg},
            },
        }

        -- Right
        right {
            DiagnosticError = {
                provider = 'DiagnosticError',
                icon = '  ',
                highlight = {colors.red, colors.bg},
            },
        }

        right {
            DiagnosticWarn = {
                provider = 'DiagnosticWarn',
                icon = '  ',
                highlight = {colors.yellow, colors.bg},
            },
        }

        right {
            DiagnosticHint = {
                provider = 'DiagnosticHint',
                icon = '  ',
                highlight = {colors.cyan, colors.bg},
            },
        }

        right {
            DiagnosticInfo = {
                provider = 'DiagnosticInfo',
                icon = '  ',
                highlight = {colors.blue, colors.bg},
            },
        }

        right {
            LineInfo = {
                provider = 'LineColumn',
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
                highlight = {colors.fg, colors.bg},
            },
        }

        right {
            FileEncode = {
                provider = 'FileEncode',
                condition = condition.hide_in_width,
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
                highlight = {colors.fg, colors.bg},
            },
        }

        right {
            Border = {
                provider = function() return ' ' end,
                highlight = {'NONE', colors.bg}
            },
        }
    end,
}
