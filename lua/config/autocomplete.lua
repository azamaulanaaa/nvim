return {
    'hrsh7th/nvim-cmp',
    branch = 'main',
    requires = {
        { 
            'hrsh7th/cmp-nvim-lsp',
            branch = 'main',
        },
        { 
            'hrsh7th/cmp-buffer',
            branch = 'main',
        },
        { 
            'hrsh7th/cmp-path',
            branch = 'main',
        },
        { 
            'L3MON4D3/LuaSnip',
            branch = 'master',
        },
        { 
            'saadparwaiz1/cmp_luasnip',
            branch = 'master',
        },
    },
    config = function()
        -- Completion popup menu
        vim.o.completeopt   ='menu,menuone,noselect'

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
                { name = 'luasnip' },
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
