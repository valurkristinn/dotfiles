vim.pack.add({
	"https://github.com/rktjmp/lush.nvim",
	"https://github.com/zenbones-theme/zenbones.nvim",
	{ src = "https://github.com/echasnovski/mini.nvim", version = vim.version.range("*") },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	"https://github.com/debugloop/telescope-undo.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/r4ppz/lspeek.nvim", version = "3322ffb55deba02d47503309130b4a0164f79483" },
	"https://github.com/tamton-aquib/staline.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/f-person/git-blame.nvim",
	"https://github.com/MagicDuck/grug-far.nvim",
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
})

-- zenbones
vim.g.zenburned_transparent_background = true

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "zenburned",
	callback = function()
		local lush = require("lush")
		local base = require("zenburned")
		local specs = lush.parse(function()
			return {
				StatusLine({ base.StatusLine, bg = "NONE" }),
				StatusLineNC({ base.StatusLineNC, bg = "NONE" }),
				WinBar({ base.WinBar, bg = "NONE" }),
				WinBarNC({ base.WinBarNC, bg = "NONE" }),
				TabLine({ base.TabLine, bg = "NONE" }),
				TabLineFill({ base.TabLineFill, bg = "NONE" }),
				-- neo-tree isn't a supported plugin upstream, so these groups fall back
				-- to neo-tree's own hardcoded defaults (blue directory icon, orange
				-- conflict/untracked) instead of the theme's palette.
				NeoTreeDirectoryIcon({ base.Directory }),
				NeoTreeGitConflict({ base.DiagnosticWarn }),
				NeoTreeGitUntracked({ base.DiagnosticWarn, gui = "italic" }),
			}
		end)
		lush.apply(lush.compile(specs))
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
require("mini.comment").setup()

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

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
require("telescope").load_extension("undo")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")

-- nvim-cmp
local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "path/to/your/snippetFolder" },
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- none-ls
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

-- lspeek
require("lspeek").setup({})
vim.keymap.set("n", "gpd", "<cmd>LSPeekDef<CR>", { desc = "Peek definition" })
vim.keymap.set("n", "gpt", "<cmd>LSPeekTypeDef<CR>", { desc = "Peek type definition" })

-- staline
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

-- indent-blankline
require("ibl").setup({
	exclude = { filetypes = { "dashboard" } },
	scope = { enabled = false },
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

-- vim-tmux-navigator, no config needed
