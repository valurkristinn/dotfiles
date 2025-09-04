require("config.lazy")

vim.cmd([[
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set number
  set number relativenumber
  set cursorline
  set cursorlineopt=number
]])
local opt = vim.opt
opt.wrap = false
vim.opt.clipboard = "unnamedplus"
