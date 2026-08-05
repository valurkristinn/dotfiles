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
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal toggle current<cr>")
			vim.keymap.set("n", "<leader>bb", "<cmd>Neotree buffers toggle current<cr>")
			vim.keymap.set("n", "<leader>gg", "<cmd>Neotree git_status toggle current<cr>")
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
				},
			})
		end,
	},
}
