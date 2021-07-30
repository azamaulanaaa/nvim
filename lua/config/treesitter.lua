require('nvim-treesitter.configs').setup {
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
