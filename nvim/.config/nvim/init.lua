require("config.lazy")

vim.cmd([[
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set number
  set number relativenumber
  set cursorline
  set cursorlineopt=number
  set noshowmode
  set rtp^="/Users/valur/.opam/default/share/ocp-indent/vim"
  autocmd BufRead,BufNewFile   *.md setlocal wrap
]])
local opt = vim.opt
opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes:2"

vim.keymap.set("n", "Y", "y$", { desc = "yank to end of line" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>bc", ":bunload<CR>", { desc = "unload buffer" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "write" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit" })

-- auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- start screen
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.api.nvim_buf_get_name(0) == "" and vim.bo.buftype == "" then
			vim.keymap.set("n", "u", ":Lazy update<CR>", { buffer = true })
			vim.keymap.set("n", "f", function()
        require('telescope.builtin').find_files()
      end, { buffer = true })
		end
	end,
})
