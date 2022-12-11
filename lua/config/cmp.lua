return {
    'hrsh7th/nvim-cmp',
    branch = 'main',
    commit = 'df6734aa018d6feb4d76ba6bda94b1aeac2b378a',
    requires = {
        { 
            'hrsh7th/cmp-nvim-lsp',
            branch = 'main',
            commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
        },
        { 
            'hrsh7th/cmp-buffer',
            branch = 'main',
            commit = '62fc67a2b0205136bc3e312664624ba2ab4a9323',
        },
        { 
            'hrsh7th/cmp-path',
            branch = 'main',
            commit = '466b6b8270f7ba89abd59f402c73f63c7331ff6e',
        },
        { 
            'L3MON4D3/LuaSnip',
            branch = 'master',
            commit = 'a12441e0598e93e67235eba67c8e6fbffc896f06',
        },
        { 
            'saadparwaiz1/cmp_luasnip',
            branch = 'master',
            commit = 'a9de941bcbda508d0a45d28ae366bb3f08db2e36',
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
