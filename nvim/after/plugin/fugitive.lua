local map = vim.keymap.set
local startWin = nil
local openKey = "<leader>gg"
local closeKey = "<leader>gc"

map("n", openKey, function()
	if not startWin then
		startWin = vim.api.nvim_get_current_win()
		vim.cmd("Git")
		vim.cmd("wincmd L")
		vim.cmd("Git log --oneline")
		vim.cmd("wincmd j")
    print("Press " .. closeKey .. " to close Git window")
	end
end, { noremap = true, silent = true })

map("n", closeKey, function()
	if startWin then
		vim.api.nvim_set_current_win(startWin)
		vim.cmd("wincmd o")
	else
		print("Press " .. openKey .. " for open Git window")
	end
  startWin = nil
end, { noremap = true, silent = true })
