vim.pack.add({
	"https://github.com/zenbones-theme/zenbones.nvim",
	{ src = "https://github.com/echasnovski/mini.nvim", version = vim.version.range("*") },
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

-- zenbones
vim.g.zenburned_compat = 1

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "zenburned",
	callback = function()
		-- transparent background
		for _, group in ipairs({
			"Normal",
			"Folded",
			"StatusLineNC",
			"StatusLine",
			"TabLineFill",
			"TabLine",
			"WinBar",
			"WinBarNC",
			"Pmenu",
			"NormalFloat",
		}) do
			local hl = vim.api.nvim_get_hl(0, { name = group })
			hl.bg = nil
			vim.api.nvim_set_hl(0, group, hl)
		end
	end,
})

-- mini
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.surround").setup()
require("mini.jump2d").setup()
require("mini.icons").setup()
require("mini.move").setup()

-- indent-blankline
require("ibl").setup({ scope = { enabled = false } })
