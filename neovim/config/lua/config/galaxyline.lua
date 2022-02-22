return {
    'NTBBloodbath/galaxyline.nvim',
    requires = { 
        { 'kyazdani42/nvim-web-devicons' },
    },
    config = function()

        -- Load galaxyline
        local gl  = require('galaxyline')
        local glc = require('galaxyline.condition')
        local gls = gl.section
        local glp = {
            diagnostic = require('galaxyline.providers.diagnostic'),
            vcs        = require('galaxyline.providers.vcs'),
            fileinfo   = require('galaxyline.providers.fileinfo'),
            extensions = require('galaxyline.providers.extensions'),
            buffer     = require('galaxyline.providers.buffer'),
            search     = require('galaxyline.providers.search'),
            whitespace = require('galaxyline.providers.whitespace'),
            lspclient  = require('galaxyline.providers.lsp'),
        }
        local colors = require('galaxyline.themes.colors').default

        -- Custom function
        local section = {
            left      = function (element) table.insert(gls.left, element) end,
            mid       =  function (element) table.insert(gls.mid, element) end,
            right     = function (element) table.insert(gls.right, element) end,
            shortline = {
                list  = function (list) gl.short_line_list = list end,
                left  = function (element) table.insert(gls.short_line_left, element) end,
                right = function (element) table.insert(gls.short_line_right, element) end,
            },
        }

        local custom = {
            providers = {
                left_border = function () return ' ' end,
                right_border = function () return ' ' end,
                whitespace = function () return ' ' end,
            },
            conditions = {
                file_defined     = function () return glp.fileinfo.get_current_file_name() ~= '' end,
                git_and_in_width = function () return glc.check_git_workspace() and glc.hide_in_width() end,
                has_diagnostic   = function () return 
                    (glp.diagnostic.get_diagnostic_error() ~= '' or
                    glp.diagnostic.get_diagnostic_warn() ~= '' or
                    glp.diagnostic.get_diagnostic_hint() ~= '' or
                    glp.diagnostic.get_diagnostic_info() ~= '') and
                    glc.hide_in_width()
                end,
            },
        }

        local function link_color(name, attr)
            local raw = vim.api.nvim_get_hl_by_name(name, true)[attr]
            if raw == nil then
                return 'NONE'
            end

            local value = string.format('#%06x', raw)

            return value
        end

        -- Reset section
        gls.left                = {}
        gls.mid                 = {}
        gls.right               = {}
        gls.short_line_left     = {}
        gls.short_line_right    = {}

        -- Disable showmode
        vim.o.showmode = false

        -- Disable ruler
        vim.o.ruler = false

        -- Custom colors
        colors.fg = link_color("StatusLine", "foreground")
        colors.bg = link_color("StatusLine", "background")

        -- Shortline background
        --vim.cmd("hi! StatusLineNC guibg=" .. colors.bg)
        vim.cmd('hi! clear StatusLine')
        -- vim.cmd('hi! clear StatusLineNC')

        -- Shortline list
        section.shortline.list {'NvimTree', 'packer'}

        -- Left
        section.left {
            ViModeLeftBoder = {
                provider = custom.providers.left_border,
                icon = ' ',
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.left {
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
                    return '   '
                end,
                highlight = {colors.fg, colors.bg},
            },
        }

        section.left {
            ViModeRightBorder = {
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.left {
            GitLeftBorder = {
                condition = glc.check_git_workspace,
                provider = custom.providers.left_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {'NONE', colors.bg},
            }
        }

        section.left {
            GitBranch = {
                condition = glc.check_git_workspace,
                provider = glp.vcs.get_git_branch,
                icon = ' ',
                highlight = {colors.blue, colors.bg},
                separator = ' ',
                separator_highlight = {colors.blue, colors.bg},
            },
        }
                

        section.left {
            DiffAdd = {
                condition = custom.conditions.git_and_in_width,
                provider = glp.vcs.diff_add,
                icon = '洛',
                highlight = {colors.green, colors.bg},
            },
        }

        section.left {
            DiffModified = {
                condition = custom.conditions.git_and_in_width,
                provider = glp.vcs.diff_modified,
                icon = ' ',
                highlight = {colors.orange, colors.bg},
            },
        }

        section.left {
            DiffRemove = {
                condition = custom.conditions.git_and_in_width,
                provider = glp.vcs.diff_remove,
                icon = ' ',
                highlight = {colors.red, colors.bg},
            },
        }

        section.left {
            GitRightBorder = {
                condition = glc.check_git_workspace,
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
            }
        }

        -- Midle
        section.mid {
            FileLeftBorder = {
                provider = custom.providers.left_border,
                condition = custom.conditions.file_defined,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.mid {
            FileIcon = {
                provider = glp.fileinfo.get_file_icon,
                condition = custom.conditions.file_defined,
                highlight = {glp.fileinfo.get_file_icon_color, colors.bg},
                separator = ' ',
                separator_highlight = {glp.fileinfo.get_file_icon_color, colors.bg},
            }
        }

        section.mid {
            FileName = {
                provider = glp.fileinfo.get_current_file_name,
                condition = custom.conditions.file_defined,
                highlight = {colors.fg, colors.bg},
            },
        }

        section.mid {
            FileRightBorder = {
                provider = custom.providers.right_border,
                condition = custom.conditions.file_defined,
                highlight = {colors.bg, 'NONE'},
            }
        }

        -- Right
        section.right {
            DiagnosticLeftBorder = {
                provider = custom.providers.left_border,
                condition = custom.conditions.has_diagnostic,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.right {
            DiagnosticLeftBorderSeparatorFix = {
                provider = custom.providers.whitespace,
                condition = custom.conditions.has_diagnostic,
                highlight = {'NONE', colors.bg},
            }
        }

        section.right {
            DiagnosticError = {
                provider = glp.diagnostic.get_diagnostic_error,
                condition = glc.hide_in_width,
                icon = ' ',
                highlight = {colors.red, colors.bg},
            },
        }

        section.right {
            DiagnosticWarn = {
                provider = glp.diagnostic.get_diagnostic_warn,
                condition = glc.hide_in_width,
                icon = ' ',
                highlight = {colors.yellow, colors.bg},
            },
        }

        section.right {
            DiagnosticHint = {
                provider = glp.diagnostic.get_diagnostic_hint,
                condition = glc.hide_in_width,
                icon = ' ',
                highlight = {colors.cyan, colors.bg},
            },
        }

        section.right {
            DiagnosticInfo = {
                provider = glp.diagnostic.get_diagnostic_info,
                condition = glc.hide_in_width,
                icon = ' ',
                highlight = {colors.blue, colors.bg},
            },
        }

        section.right {
            DiagnosticRightBorder = {
                provider = custom.providers.right_border,
                condition = custom.conditions.has_diagnostic,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.right {
            StatLeftBorder = {
                provider = custom.providers.left_border,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.right {
            LineInfo = {
                provider = glp.fileinfo.line_column,
                highlight = {colors.fg, colors.bg},
            },
        }

        section.right {
            FileEncode = {
                provider = glp.fileinfo.get_file_encode,
                condition = glc.hide_in_width,
                highlight = {colors.fg, colors.bg},
            },
        }

        section.right {
            StatRightBorder = {
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
            }
        }
    end,
}
