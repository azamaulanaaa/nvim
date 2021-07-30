-- enable cursorline
vim.opt.cursorline = true

-- if not in gui the set t_Co to 256
if not vim.fn.has('gui_running') then vim.opt.t_Co = 256 end
-- if term support gui color then set it true
if vim.fn.has('termguicolors') then vim.opt.termguicolors = true end

-- set colorscheme for nvim
vim.cmd('colorscheme onedark')

-- set colorscheme for lightline
vim.g.lightline = { 
  colorscheme = "onedark"
}
