return {
	"tamton-aquib/staline.nvim",
	config = function()
		require("staline").setup({

			sections = {
				left = { { "other", "branch" }, " ", { "other", "lsp" } },
				mid = { { "file", "file_name" } },
				right = { "-line_column" },
			},
			mode_colors = {
				i = "#F9E2AF",
				n = "#89B4FA",
				c = "#A6E3A1",
				v = "#CBA6F7",
			},
			defaults = {
				true_colors = true,
				line_column = "%L",
				branch_symbol = "\u{e725} ",
			},
		})

		vim.cmd("highlight other guifg=#CDD6F4 guibg=none")
		vim.cmd("highlight file guifg=#9399B2 guibg=none")
	end,
}
