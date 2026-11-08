vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
	"https://github.com/ibhagwan/fzf-lua",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/f-person/git-blame.nvim",
	"https://github.com/MagicDuck/grug-far.nvim",
	"https://github.com/karb94/neoscroll.nvim",
})

-- lsp

local langs = {
	"lua_ls",
	"clangd",
	"bashls",
	"oxlint",
	"pyright",
	"vtsls",
	"cssls",
	"astro",
	"tinymist",
	"jdtls",
}

vim.env.JDTLS_JVM_ARGS = "-javaagent:"
	.. vim.fn.expand("~/.m2/repository/org/projectlombok/lombok/1.18.46/lombok-1.18.46.jar")

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = langs,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

for _, l in ipairs(langs) do
	if l == "vtsls" then
		vim.lsp.config(l, {
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		})
	else
		vim.lsp.config(l, { capabilities = capabilities })
	end
	vim.lsp.enable(l)
end

vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<space>de", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<space>dq", vim.diagnostic.setloclist, {})

-- formatter

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			only_local = "node_modules/.bin",
		}),
	},
	on_attach = function(client, bufnr)
		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)

-- neo-tree
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

-- fzf-lua
local fzf = require("fzf-lua")
fzf.setup()
fzf.register_ui_select()
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "help tags" })

-- undotree
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>")

-- blink.cmp
require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	completion = {
		menu = { border = "rounded" },
		documentation = { window = { border = "rounded" } },
	},
})

-- git-blame
require("gitblame").setup({
	enabled = false,
	message_template = " <summary> • <date> • <author> • <<sha>>",
	date_format = "%m-%d-%Y %H:%M:%S",
	virtual_text_column = 1,
})
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "toggle git-blame" })

-- grug-far
require("grug-far").setup({})

-- neoscroll
require("neoscroll").setup({ mappings = {} })
local scroll = require("neoscroll").scroll

vim.keymap.set({ "n", "v", "i" }, "<C-u>", function()
	scroll(-10, { move_cursor = true, duration = 100, easing = "sine" })
end)

vim.keymap.set({ "n", "v", "i" }, "<C-d>", function()
	scroll(10, { move_cursor = true, duration = 100, easing = "sine" })
end)

vim.keymap.set({ "n", "v" }, "<M-u>", function()
	scroll(-50, { move_cursor = true, duration = 100, easing = "sine" })
end)

vim.keymap.set({ "n", "v" }, "<M-d>", function()
	scroll(50, { move_cursor = true, duration = 100, easing = "sine" })
end)

-- start screen
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.api.nvim_buf_get_name(0) == "" and vim.bo.buftype == "" then
			vim.keymap.set("n", "u", vim.pack.update, { buffer = true })
			vim.keymap.set("n", "e", ":Neotree filesystem toggle current<cr>", { buffer = true })
			vim.keymap.set("n", "f", require("fzf-lua").files, { buffer = true })
		end
	end,
})
