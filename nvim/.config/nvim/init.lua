vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- if ~/.nvim-lean exists only req.lua is used (used for servers)
local lean_marker = vim.fn.expand("~/.nvim-lean")

require("config.req")
if not vim.uv.fs_stat(lean_marker) then
	require("config.xtra")
end

vim.cmd([[
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set number relativenumber
  set cursorline
  set cursorlineopt=number
  set noshowmode
  set nowrap
  set clipboard=unnamedplus
  set signcolumn=yes:2
  set termguicolors
  colorscheme zenburned
]])

require("config.statusline")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "delete buffer" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "write" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit" })

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "BufRead" }, {
	pattern = { "*.md", "*.typ" },
	command = "setlocal wrap | setlocal linebreak",
})
