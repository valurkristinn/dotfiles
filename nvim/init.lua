require("config.lazy")

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set relativenumber
]])

local opt = vim.opt
opt.wrap = false
vim.opt.clipboard = "unnamedplus"
