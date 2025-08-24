return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        --lua
        null_ls.builtins.formatting.stylua,

        --java
        null_ls.builtins.diagnostics.checkstyle,

        --c/c++
        null_ls.builtins.diagnostics.cppcheck,

        --java/c/c++
        null_ls.builtins.formatting.clang_format,

        --python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint,

        --javascript
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
  end,
}
