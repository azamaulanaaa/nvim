local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		{ "windwp/nvim-autopairs", config = true },
	},
}

M.event = function(_, events)
	table.insert(events, "InsertEnter")

	return events
end

M.opts = function(_, opts)
	local cmp = require("cmp")

	opts.completion = opts.completion or {}
	opts.completion.completeopt = "menu,menuone"

	opts.snippet = opts.snippet or {}
	opts.snippet.expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end

	opts.sources = opts.sources or {}
	table.insert(opts.sources, { name = "nvim_lsp" })
	table.insert(opts.sources, { name = "buffer" })
	table.insert(opts.sources, { name = "path" })
	table.insert(opts.sources, { name = "luasnip" })

	opts.mapping = opts.mapping or {}
	opts.mapping["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	})
	opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif require("luasnip").expand_or_jumpable() then
			require("luasnip").expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" })
	opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif require("luasnip").jumpable(-1) then
			require("luasnip").jump(-1)
		else
			fallback()
		end
	end, { "i", "s" })

	return opts
end

return M
