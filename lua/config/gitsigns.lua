local present, icons = pcall(require, "gitsigns")
if not present then
	return
end

require('gitsigns').setup()
