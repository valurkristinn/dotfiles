return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
        transparent_background = true,
    })
        vim.cmd.colorscheme("catppuccin")
        vim.cmd[[
au colorscheme * highlight Normal             ctermbg=NONE guibg=NONE
au colorscheme * highlight NonText            ctermbg=NONE guibg=NONE
au colorscheme * highlight Text               ctermbg=NONE guibg=NONE
au colorscheme * highlight LineNr             ctermbg=NONE guibg=NONE
au colorscheme * highlight CursorLineNR       ctermbg=NONE guibg=NONE
au colorscheme * highlight SignColumn         ctermbg=NONE guibg=NONE
        ]]
  end,
}
