return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({ mappings = {} })
		local scroll = require("neoscroll").scroll

       

        vim.keymap.set({ "n", "v", "i" }, "<M-k>", function()
			    scroll(-10, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v", "i" }, "<M-j>", function()
			    scroll(10, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v"},"<M-u>", function()
			    scroll(-50, { move_cursor = true, duration = 100, easing = "sine" })
            end)

        vim.keymap.set({ "n", "v"}, "<M-d>", function()
			    scroll(50, { move_cursor = true, duration = 100, easing = "sine" })
            end)
	end,
}
