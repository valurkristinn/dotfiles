return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,                 
    config = function()
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem toggle current<cr>")
      vim.keymap.set("n", "<leader>bb", "<cmd>Neotree buffers toggle float<cr>")
      vim.keymap.set("n", "<leader>gg", "<cmd>Neotree git_status toggle float<cr>")
    end,
  },
}
