return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({ mappings = {} })
		local scroll = require("neoscroll").scroll

       

        vim.keymap.set({ "n", "v", "i" }, "<C-u>", function()
			    scroll(-10, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v", "i" }, "<C-d>", function()
			    scroll(10, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v"},"]d", function()
			    scroll(-50, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v"}, "[d", function()
			    scroll(50, { move_cursor = true, duration = 100, easing = "sine" })
            end)

	end,
}

