 return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "java",
        "c",
        "cpp",
        "typescript",
        "css",
        "html",
        "bash",
        "comment",
        "lua",
        "json",
        "markdown",
        "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
