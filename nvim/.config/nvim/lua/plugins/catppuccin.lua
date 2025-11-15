return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
				},
				semantic_tokens = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		-- mini.statusline changes
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = "none" })
        vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = 'none', link = 'MiniStatuslineDevinfo'  })
		vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = "none" })
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "none" })
	end,
}
