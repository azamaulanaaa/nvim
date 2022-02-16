return {
    'hrsh7th/nvim-cmp',
    requires = {
        { 'hrsh7th/cmp-nvim-lsp'},
        { 'hrsh7th/cmp-buffer'},
        { 'hrsh7th/cmp-path'},
        { 'hrsh7th/cmp-cmdline'},
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function()
        -- Completion popup menu
        vim.o.completeopt   ='menu,menuone,noselect'
        vim.o.shortmess     = vim.o.shortmess..'c'

        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }),
            mapping = {
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<TAB>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
            },
            view = {
                entries = 'native'
            },
        })
    end
}
