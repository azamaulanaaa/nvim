if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua <<EOF
require 'nvim-treesitter.configs'.setup {
  hightlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    'bash',
    'javascript',
    'typescript',
    'tsx',
    'json',
    'yaml',
    'html',
    'go',
    'lua',
    'dockerfile',
    'python',
  },
}

EOF
