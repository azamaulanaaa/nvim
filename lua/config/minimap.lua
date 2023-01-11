return {
    'echasnovski/mini.nvim',
    require = {
        'lewis6991/gitsigns.nvim',
    },
    branch = 'main',
    config = function()
        local minimap = require('mini.map')

        local config = minimap.config
        config.symbols.encode = minimap.gen_encode_symbols.dot('3x2')
        config.integrations = {
            minimap.gen_integration.builtin_search(),
            minimap.gen_integration.diagnostic(),
            minimap.gen_integration.gitsigns(),
        }
        config.window.show_integration_count = false

        minimap.setup(config)
        minimap.open()
    end,
}
