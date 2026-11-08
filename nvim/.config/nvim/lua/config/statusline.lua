local mode_colors = {
	i = "#F9E2AF",
	n = "#89B4FA",
	c = "#A6E3A1",
	v = "#CBA6F7",
}

-- both sides get the same fixed width so the file name stays centered
local side_width = 20

for mode, color in pairs(mode_colors) do
	vim.api.nvim_set_hl(0, "StatusMode" .. mode, { fg = "#000000", bg = color })
end

function _G.statusline()
	local mode = vim.api.nvim_get_mode().mode
	local mode_hl = mode_colors[mode] and "StatusMode" .. mode or "StatusModen"
	local name = vim.fn.expand("%:.")
	local icon = MiniIcons.get("file", name)
	local modified = vim.bo.modified and " [+] " or ""

	return table.concat({
		"%-" .. side_width .. "." .. side_width .. "(",
		vim.diagnostic.status(),
		"%)%=",
		icon,
		" ",
		name,
		modified,
		"%=%" .. side_width .. "." .. side_width .. "(%#",
		mode_hl,
		"# %L %)",
	})
end

vim.opt.statusline = "%!v:lua.statusline()"
