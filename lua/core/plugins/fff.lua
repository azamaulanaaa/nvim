local M = {
	"dmtrkovalenko/fff.nvim",
	lazy = false,
}

M.build = function()
	require("fff.download").download_or_build_binary()
end
M.init = function()
	local subcommands = {
		files = function()
			require("fff").find_files()
		end,
		live_grep = function()
			require("fff").live_grep()
		end,
		-- helptags = function()
		-- not supported yet!
		-- end,
		-- blines = function()
		-- not supported yet!
		-- end,
	}

	vim.api.nvim_create_user_command("Fff", function(opts)
		local f = subcommands[opts.args]
		if f then
			f()
		else
			subcommands.files()
		end
	end, {
		nargs = "?", -- Accepts 0 or 1 argument
		desc = "fff.nvim interface",
		complete = function()
			return vim.tbl_keys(subcommands)
		end,
	})
end

-- Update your keys to use the new subcommand syntax
M.keys = {
	{ "<leader>ff", "<cmd>Fff files<cr>", desc = "Find Files" },
	{ "<leader>fw", "<cmd>Fff live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Fff blines<cr>", desc = "Grep Current File" },
}
M.opts = {
	layout = {
		prompt = "> ",
		prompt_position = "top",
		flex = {
			wrap = "bottom",
		},
	},
}

return M
