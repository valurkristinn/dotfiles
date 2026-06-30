return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          only_local = "node_modules/.bin",
        }),
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
  end,
}
