return {
    'NTBBloodbath/galaxyline.nvim',
    branch = "main",
    commit = "4d4f5fc8e20a10824117e5beea7ec6e445466a8f",
    requires = { 
        { 
            'kyazdani42/nvim-web-devicons',
            brach = "main",
            commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
        },
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
                left_border = function () return '' end,
                right_border = function () return '' end,
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

        -- Shortline list
        section.shortline.list {'NvimTree', 'packer'}

        -- Left Section --

        -- Start Space
        section.left {
            StartSpace = {
                provider = custom.providers.whitespace,
                highlight = {'NONE', 'NONE'},
            }
        }

        -- Open Border
        section.left {
            ViModeLeftBoder = {
                provider = custom.providers.left_border,
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
                    
                    -- default
                    return '   '
                end,
                highlight = {colors.fg, colors.bg},
            }
        }

        -- Close Border
        section.left {
            ViModeRightBorder = {
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {'NONE', 'NONE'},
            }
        }

        -- Open Border
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
                icon = ' ',
                provider = glp.vcs.get_git_branch,
                highlight = {colors.blue, colors.bg},
                separator = ' ',
                separator_highlight = {colors.blue, colors.bg},
            }
        }

        section.left {
            DiffAdd = {
                condition = custom.conditions.git_and_in_width,
                icon = '洛',
                provider = glp.vcs.diff_add,
                highlight = {colors.green, colors.bg},
            }
        }

        section.left {
            DiffModified = {
                condition = custom.conditions.git_and_in_width,
                icon = ' ',
                provider = glp.vcs.diff_modified,
                highlight = {colors.orange, colors.bg},
            }
        }

        section.left {
            DiffRemove = {
                condition = custom.conditions.git_and_in_width,
                icon = ' ',
                provider = glp.vcs.diff_remove,
                highlight = {colors.red, colors.bg},
            }
        }

        -- Close Border
        section.left {
            GitRightBorder = {
                condition = glc.check_git_workspace,
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {'NONE', 'NONE'},
            }
        }

        -- Middle Section --

        -- Open Border
        section.mid {
            FileLeftBorder = {
                condition = custom.conditions.file_defined,
                provider = custom.providers.left_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {'NONE', 'NONE'},
            }
        }

        section.mid {
            FileIcon = {
                condition = custom.conditions.file_defined,
                provider = glp.fileinfo.get_file_icon,
                highlight = {glp.fileinfo.get_file_icon_color, colors.bg},
                separator = ' ',
                separator_highlight = {colors.bg, colors.bg},
            }
        }

        section.mid {
            FileName = {
                condition = custom.conditions.file_defined,
                provider = glp.fileinfo.get_current_file_name,
                highlight = {colors.fg, colors.bg},
            }
        }

        -- Close Border
        section.mid {
            FileRightBorder = {
                condition = custom.conditions.file_defined,
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
            }
        }

        -- End Space
        section.mid {
            EndSpace = {
                provider = custom.providers.whitespace,
                highlight = {'NONE', 'NONE'},
            }
        }

        -- Right Section --
        
        -- Start Space
        section.right {
            StartSpace = {
                provider = custom.providers.whitespace,
                highlight = {'NONE', 'NONE'},
            }
        }

        -- Open Border
        section.right {
            DiagnosticLeftBorder = {
                condition = custom.conditions.has_diagnostic,
                provider = custom.providers.left_border,
                highlight = {colors.bg, 'NONE'},
            }
        }

        section.right {
            DiagnosticLeftBorderSeparatorFix = {
                condition = custom.conditions.has_diagnostic,
                provider = custom.providers.whitespace,
                highlight = {'NONE', colors.bg},
            }
        }

        section.right {
            DiagnosticError = {
                condition = glc.hide_in_width,
                icon = ' ',
                provider = glp.diagnostic.get_diagnostic_error,
                highlight = {colors.red, colors.bg},
            }
        }

        section.right {
            DiagnosticWarn = {
                condition = glc.hide_in_width,
                icon = ' ',
                provider = glp.diagnostic.get_diagnostic_warn,
                highlight = {colors.yellow, colors.bg},
            }
        }

        section.right {
            DiagnosticHint = {
                condition = glc.hide_in_width,
                icon = ' ',
                provider = glp.diagnostic.get_diagnostic_hint,
                highlight = {colors.cyan, colors.bg},
            }
        }

        section.right {
            DiagnosticInfo = {
                condition = glc.hide_in_width,
                icon = ' ',
                provider = glp.diagnostic.get_diagnostic_info,
                highlight = {colors.blue, colors.bg},
            }
        }

        -- Close Border
        section.right {
            DiagnosticRightBorder = {
                condition = custom.conditions.has_diagnostic,
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {'NONE', 'NONE'},
            }
        }

        -- Open Border
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
                separator = ' ',
                separator_highlight = {colors.bg, colors.bg},
            }
        }

        section.right {
            FileEncode = {
                provider = glp.fileinfo.get_file_encode,
                condition = glc.hide_in_width,
                highlight = {colors.fg, colors.bg},
            }
        }

        -- Close Border
        section.right {
            StatRightBorder = {
                provider = custom.providers.right_border,
                highlight = {colors.bg, 'NONE'},
                separator = ' ',
                separator_highlight = {colors.bg, colors.bg},
            }
        }

        -- End Space
        section.right {
            EndSpace = {
                provider = custom.providers.whitespace,
                highlight = {'NONE', 'NONE'},
            }
        }
        
    end,
}
