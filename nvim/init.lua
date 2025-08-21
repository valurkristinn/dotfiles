require("config.lazy")

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  set number
  set tabstop=4
  set shiftwidth=4
  set expandtab

]]

local opt = vim.opt
opt.wrap = false

vim.keymap.set('n', '<leader>w', ':NvimTreeFocus<CR>', { desc = 'Focus nvim-tree' })


