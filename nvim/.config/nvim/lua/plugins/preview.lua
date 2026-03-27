return {
  'barrettruth/preview.nvim',
  init = function()
    vim.g.preview = { typst = true, latex = true, github = true }
    vim.keymap.set("n", "<leader>tt",  ":Preview toggle<CR>")
    vim.keymap.set("n", "<leader>ts",  ":Preview status<CR>")
  end,
}
