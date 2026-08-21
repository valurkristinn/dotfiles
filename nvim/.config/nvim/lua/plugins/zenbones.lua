return {
	"zenbones-theme/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	priority = 1000,
	config = function()
		vim.g.forestbones_transparent_background = true

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "forestbones",
			callback = function()
				local lush = require("lush")
				local base = require("forestbones")
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
	end,
}
