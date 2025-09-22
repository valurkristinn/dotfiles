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
]])
local opt = vim.opt
opt.wrap = false
vim.opt.clipboard = "unnamedplus"


vim.keymap.set("n", "Y", "y$", { desc = "yank to end of line"})
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer"})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "previous buffer"})
